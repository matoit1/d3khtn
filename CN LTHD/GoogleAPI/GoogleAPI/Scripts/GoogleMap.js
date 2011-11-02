var map;
var vietnam = new google.maps.LatLng(14.058324, 108.277199);
var initLocation;
var browserSupportFlag;
var geocoder;
var marker;
var infowindow;
var latitude;
var longitude;
var myOptions;

//ham xu ly khong dinh vi duoc
function handleNoGeolocation(errorFlag) {
    if (errorFlag == true) {
        alert("Dịch vụ định vị địa lý có lỗi!");
        initLocation = vietnam;
    }
    else {
        alert("Trình duyệt không hỗ trợ định vị địa lý!");
        initLocation = vietnam;
    }
    map.setCenter(initLocation);
}

function initialize() {
    myOptions = {
        zoom: 8,
        center: new google.maps.LatLng(14.058324, 108.277199),
        mapTypeId: google.maps.MapTypeId.ROADMAP
    };

    map = new google.maps.Map(document.getElementById("map"), myOptions);
    //map.setCenter(new google.maps.LatLng(0, 0));
    //map.setZoom(13);

    // Try W3C Geolocation (Preferred)
    if (navigator.geolocation) {
        browserSupportFlag = true;
        navigator.geolocation.getCurrentPosition(function (position) {
            initLocation = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);
            map.setCenter(initLocation);
            // adding a marker
            var here = new google.maps.Latlng(position.coords.latitude, position.coords.longitude);
            var marker = new google.maps.Marker({ position: here, map: map });
            //create info window
            if (infowindow) {
                infowindow.close();
            }
            infowindow = new google.maps.InfoWindow({ content: 'My Location' });
            infowindow.open(map, marker);
            map.setZoom(20);
            latitude = position.coords.latitude;
            longitude = position.coords.longitude;
        }, function () {
            handleNoGeolocation(browserSupportFlag);
        });
    }

    // Try Google Gears Geolocation
    else if (google.gears) {
        browserSupportFlag = true;
        var geo = google.gears.factory.create('beta.geolocation');
        geo.getCurrentPosition(function (position) {
            initLocation = new google.maps.LatLng(position.latitude, position.longitude);
            map.setCenter(initLocation);
            // adding a marker
            var here = new google.maps.Latlng(position.coords.latitude, position.coords.longitude);
            var marker = new google.maps.Marker({ position: here, map: map });
            //create info window
            if (infowindow) {
                infowindow.close();
            }
            var infowindow = new google.maps.InfoWindow({ content: 'My Location' });
            infowindow.open(map, marker);
            map.setZoom(20);
            latitude = position.coords.latitude;
            longitude = position.coords.longitude;
        }, function () {
            handleNoGeolocation(browserSupportFlag);
        });
    }
    // Browser doesn't support Geolocation
    else {
        browserSupportFlag = false;
        handleNoGeolocation(browserSupportFlag);
    }

    var homeControlDiv = document.createElement('DIV');
    var homeControl = new HomeControl(homeControlDiv, map);

    homeControlDiv.index = 1;
    map.controls[google.maps.ControlPosition.TOP_RIGHT].push(homeControlDiv);
}

//Tim dia diem
function findLocation(address, flag) {
    if (!geocoder) {
        geocoder = new google.maps.Geocoder();
    }
    var geocoderRequest = { address: address };
    geocoder.geocode(geocoderRequest, function (results, status) {
        if (status == google.maps.GeocoderStatus.OK) {
            if (!marker) {
                marker = new google.maps.Marker({ map: map });
            }
            marker.setPosition(results[0].geometry.location);
            //            if (!infowindow) {
            //                infowindow = new google.maps.InfoWindow();
            //            }
            var  infowindow = new google.maps.InfoWindow();
            var content = '<p style="color:Blue">' + results[0].formatted_address + '</p>';
            content += 'Vĩ độ:' + results[0].geometry.location.lat() + '</br>';
            content += 'Kinh độ:' + results[0].geometry.location.lng() + '</br>';
//            content += '<a href="google.aspx?Them=Them&name=' + results[0].formatted_address + '&type=' + results[0].types + '&lat=' + results[0].geometry.location.lat() + '&long=' + results[0].geometry.location.lng() + '">Thêm</a>';
//            content += "     ";
//            content += '<a href="google.aspx?Xoa=Xoa&name=' + results[0].formatted_address + '&type=' + results[0].types + '">Xóa</a>';
//            content += "     ";
//            content += '<a href="google.aspx?Xoa=Sua&name=' + results[0].formatted_address + '&type=' + results[0].types + '">Sửa</a>';
            map.setZoom(12);
            infowindow.setContent(content);
            infowindow.open(map, marker);
            if (flag == true) {
                var panel = document.getElementById("diadiembox");
                var panelContent = "<strong>Các kết quả tìm được:</strong></br>";
                for (var i in results) {
                    panelContent += "<a href='javascript:void(0);' name='" + results[i].formatted_address + "' onclick=linkDiaDiem_Click(this)>" + results[i].formatted_address + "</a>" + "</br></br>";
                    panelContent += "<a href='google.aspx?save=save&name=" + results[i].formatted_address + "&type=" + results[i].types + "&lat=" + results[0].geometry.location.lat() + "&long=" + results[0].geometry.location.lng() + "'>Lưu lại</a></br></br>";
                }
                panel.innerHTML = panelContent;
            }
            google.maps.event.addListener(marker, 'click', function () {
                infowindow.open(map, marker);
            });
        }
        else {
            map = new google.maps.Map(document.getElementById("map"), {
                zoom: 8,
                center: new google.maps.LatLng(position.coords.latitude, position.coords.longitude),
                mapTypeId: google.maps.MapTypeId.ROADMAP
            });
            //alert('Không tìm thấy địa chỉ cần tìm');
        }
    });
}


function searchKeyPress(e) {
    // look for window.event in case event isn't passed in
    if (window.event) { e = window.event; }
    if (e.keyCode == 13) {
        //document.getElementById('btn_TimDiaDiem').click();
        btn_TimDiaDiem_Click();
    }
}

//ham xu ly su kien button click
function btn_TimDiaDiem_Click() {
    var address = document.getElementById("txb_TenDiaDiem").value;
    findLocation(address, true);
}

//ham xu ly su kien link click
function linkDiaDiem_Click(link) {
    var DiaDiem = link.name;
    findLocation(DiaDiem, false);
}

//ham xu ly su kien button click
function btn_MyLocation_Click() {
    map.setZoom(15);

    var content = 'Vi tri cua ban</br>' + 'Vi do: ' + latitude + '</br> kinh do: ' + longitude;
    var marker = new google.maps.Marker({
        position: initLocation,
        map: map
    });
    // Creating a InfoWindow
    if (infowindow)
        infowindow.close();
    infowindow = new google.maps.InfoWindow({
        content: content
    });
    // Adding the InfoWindow to the map
    infowindow.open(map, marker);
}

/**
* The HomeControl adds a control to the map that simply
* returns the user to Chicago. This constructor takes
* the control DIV as an argument.
*/

function HomeControl(controlDiv, map) {

    // Set CSS styles for the DIV containing the control
    // Setting padding to 5 px will offset the control
    // from the edge of the map
    controlDiv.style.padding = '5px';

    // Set CSS for the control border
    var controlUI = document.createElement('DIV');
    controlUI.style.backgroundColor = 'white';
    controlUI.style.borderStyle = 'solid';
    controlUI.style.borderWidth = '2px';
    controlUI.style.cursor = 'pointer';
    controlUI.style.textAlign = 'center';
    controlUI.title = 'Click to set the map to Home';
    controlDiv.appendChild(controlUI);

    // Set CSS for the control interior
    var controlText = document.createElement('DIV');
    controlText.style.fontFamily = 'Arial,sans-serif';
    controlText.style.fontSize = '12px';
    controlText.style.paddingLeft = '4px';
    controlText.style.paddingRight = '4px';
    controlText.innerHTML = 'Home';
    controlUI.appendChild(controlText);

    // Setup the click event listeners: simply set the map to Chicago
    google.maps.event.addDomListener(controlUI, 'click', function () {
        map.setCenter(initLocation)
        map.setZoom(15)
    });
}

function btn_ChonDiaDiem_Click() {
    google.maps.event.clearListeners(map, 'click');
    google.maps.event.addListenerOnce(map, 'click', function (event) {
        placeMarker(event.latLng);
    });
}

var saveMarker;
function placeMarker(location) {
    saveMarker = new google.maps.Marker({
        position: location,
        draggable: true,
        animation: google.maps.Animation.DROP,
        map: map
    });
    //google.maps.event.addListener(marker, 'click', toggleBounce);
    google.maps.event.addListener(saveMarker, 'click', function () {
        if (infowindow)
            infowindow.close();
        var content = "</br>Tên địa điểm : " + "<input type='text' id='txb_LuuTenDiaDiem'/></br>"
        content += "Kinh độ : " + saveMarker.getPosition().lat() + '</br>' + "Vĩ độ : " + saveMarker.getPosition().lng()
        content += "</br><a href='javascript:void(0);' onclick=LuuDiaDiem()>Thêm</a>" + "</br></br>"
         infowindow = new google.maps.InfoWindow({
            content : content
        });
        infowindow.open(map, saveMarker);
    });
}

function LuuDiaDiem() {
    var nameLocation = document.getElementById("txb_LuuTenDiaDiem").value;
    var lat = saveMarker.getPosition().lat();
    var lng = saveMarker.getPosition().lng();
    var idUser = document.getElementById("user");
    if (idUser != null) {
        $.ajax({ url: "http://localhost:2817/Service1.svc/ThemDiaDiem/DiaDiem?idUser=" + idUser + "&nameLoc=" + nameLocation + "&lat=" + lat + "&lng=" + lng,
            success: function (data) {
                if (data) {
                    alert("Đã thêm địa điểm");
                }
                else
                    alert("Thêm địa điểm không thành công");
            }
        });
    }else
        alert("Chưa đăng nhập");
}

