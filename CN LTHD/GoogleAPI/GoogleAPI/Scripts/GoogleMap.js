var map;
var initLocation;
var geocoder;
var marker;
var infowindow;
var latitude;
var longitude;
var myOptions;
// chua danh sach marker cua cac dia diem da luu
var dsMarker = new Array();
// xac dinh cac tuoc tinh cua dia diem can luu
var tenDiaDiem;
var type;
var lat;
var lng;

//ham xu ly khong dinh vi duoc
function handleNoGeolocation(errorFlag) {
    if (errorFlag == true) {
        alert("Dịch vụ định vị địa lý có lỗi!");
        initLocation = new google.maps.LatLng(14.058324, 108.277199);
    }
    else {
        alert("Trình duyệt không hỗ trợ định vị địa lý!");
        initLocation = new google.maps.LatLng(14.058324, 108.277199); ;
    }
    map.setCenter(initLocation);
}

function initialize() {
    var browserSupportFlag;
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
            var here = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);
            var marker = new google.maps.Marker({ position: here, map: map });
            //create info window
            var infowindow = new google.maps.InfoWindow({ content: 'My Location' });
            infowindow.open(map, marker);
            map.setZoom(20);
            latitude = position.coords.latitude;
            longitude = position.coords.longitude;
            google.maps.event.addListener(marker, 'click', function () {
                infowindow = new google.maps.InfoWindow({ content: 'My Location' });
                infowindow.open(map, marker);
            });
            dsMarker.push(marker);
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
            var here = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);
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
            dsMarker.push(marker);
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
            var marker = new google.maps.Marker({ map: map });
            marker.setPosition(results[0].geometry.location);
            var content = '<p style="color:Blue">' + results[0].formatted_address + '</p>';
            content += 'Vĩ độ:' + results[0].geometry.location.lat() + '</br>';
            content += 'Kinh độ:' + results[0].geometry.location.lng() + '</br>';
            tenDiaDiem = results[0].formatted_address;
            type = results[0].types;
            //alert(type);
            lat = results[0].geometry.location.lat();
            lng = results[0].geometry.location.lng();
            content += "<a href='javascript:void(0);' onclick=LuuDiaDiem()>Thêm</a>";
            map.setZoom(12);
            var infowindow = new google.maps.InfoWindow();
            infowindow.setContent(content);
            infowindow.open(map, marker);
            if (flag == true) {
                var panel = document.getElementById("diadiembox");
                var panelContent = "<strong>Các kết quả tìm được:</strong></br>";
                for (var i in results) {
                    panelContent += "<a href='javascript:void(0);' name='" + results[i].formatted_address + "' onclick=linkDiaDiem_Click(this)>" + results[i].formatted_address + "</a>" + "</br></br>";

                }
                panel.innerHTML = panelContent;
            }
            google.maps.event.addListener(marker, 'click', function () {
                infowindow.open(map, marker);
            });
            dsMarker.push(marker);
        }
        else {
            map = new google.maps.Map(document.getElementById("map"), {
                zoom: 8,
                center: new google.maps.LatLng(position.coords.latitude, position.coords.longitude),
                mapTypeId: google.maps.MapTypeId.ROADMAP
            });
        }
    });
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
    var infowindow = new google.maps.InfoWindow({
        content: content
    });
    // Adding the InfoWindow to the map
    infowindow.open(map, marker);
    dsMarker.push(marker);
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

function placeMarker(location) {
    var saveMarker = new google.maps.Marker({
        position: location,
        draggable: true,
        animation: google.maps.Animation.DROP,
        map: map
    });
    //alert(location.lat() +"\r\n"+ location.lng());

    google.maps.event.addListener(saveMarker, 'click', function () {
        lat = saveMarker.getPosition().lat();
        lng = saveMarker.getPosition().lng();
        if (infowindow)
            infowindow.close();
        var content = "</br>Tên địa điểm : " + "<input type='text' id='txb_LuuTenDiaDiem'/></br>"
        content += "</br>Loại địa điểm : " + "<input type='text' id='txb_LuuLoaiDiaDiem'/></br>"
        content += "Kinh độ : " + saveMarker.getPosition().lat() + '</br>' + "Vĩ độ : " + saveMarker.getPosition().lng()
        content += "</br><a href='javascript:void(0);' onclick=LuuDiaDiemMoi()>Thêm</a>" + "</br></br>"
        infowindow = new google.maps.InfoWindow({
            content : content
        });
        infowindow.open(map, saveMarker);
    });
    dsMarker.push(saveMarker);
}

function LuuDiaDiemMoi() {
    var nameLocation = document.getElementById("txb_LuuTenDiaDiem").value;
    var typeofLocation = document.getElementById("txb_LuuLoaiDiaDiem").value;
    var latitude = lat;
    var longitude = lng;
    var idUser;
    try {
        idUser = document.getElementById("idUser").value;
    } catch (r) {
        alert("Chưa đăng nhập");
        return;
    }
    //alert(idUser + "\r\n " + nameLocation + "\r\n " + typeofLocation + "\r\n " + latitude + "\r\n " + longitude);
    //them dia diem moi
    if (idUser != null) {
        $.ajax({ url: "http://localhost:2817/Service1.svc/ThemDiaDiemMoi/DiaDiem?idUser=" + idUser + "&nameloc=" + nameLocation + "&type=" + typeofLocation + "&lat=" + latitude + "&lng=" + longitude,
            success: function (data) {
                if (data) {
                    alert("Đã thêm địa điểm");
                }
                else
                    alert("Thêm địa điểm không thành công");
            }
        });
    }
}

function LuuDiaDiem() {
    var idUser;
    try {
        idUser = document.getElementById("idUser").value;
    } catch (r) {
        alert("Chưa đăng nhập");
        return;
    }
   
    //them dia diem moi
    if (idUser != null) {
        //alert(idUser + "\r\n " + tenDiaDiem + "\r\n " + type + "\r\n " + lat + "\r\n " + lng);
        $.ajax({ url: "http://localhost:2817/Service1.svc/ThemDiaDiemMoi/DiaDiem?idUser=" + idUser + "&nameloc=" + tenDiaDiem + "&type=" + type + "&lat=" + lat + "&lng=" + lng,
            success: function (data) {
                if (data) {
                    alert("Đã thêm địa điểm");
                }
                else
                    alert("Thêm địa điểm không thành công");
            }
        });
    }
}



function btn_DiaDiemCuaToi_Click() {
    var idUser;
    try {
        idUser = document.getElementById("idUser").value;
    } catch (r) {
        alert("Chưa đăng nhập");
        return;
    }
    if (idUser != null) {
        $.ajax({ url: "http://localhost:2817/Service1.svc/LayDanhSachDiaDiemTheoNguoiDung?idUser=" + idUser,
            success: function (data) {
                if (data) {
                    //hien thi danh sach marker len ban do\
                    //alert(data[0].name);
                    HienThiDanhSachMarkerLenBanDo(data);
                }
                else
                    alert("Chưa lưu địa điểm nào");
            }
        });
    }
}
var dsDiaDiem = new Array();
function HienThiDanhSachMarkerLenBanDo(ds) {
    dsDiaDiem = new Array();
    dsDiaDiem = ds;
    if(dsMarker){
        for(j in dsMarker)
        {
            dsMarker[j].setMap(null);
            
        }
        dsMarker.splice(0, dsMarker.length);
    }
    for (i in ds) {
        //alert(ds[i].name);
        var myLatlng = new google.maps.LatLng(ds[i].Lat, ds[i].Lng);
        var marker = new google.maps.Marker({
            position: myLatlng,
            map : map
        });
//        var content = '<p style="color:Blue">' + ds[i].name + '</p>';
//            content += 'Vĩ độ: ' + ds[i].Lat + '</br>';
//            content += 'Kinh độ: ' + ds[i].Lng + '</br>';
//            content += "</br><a href='javascript:void(0);' onclick=XoaDiaDiem("+ds[i].ID+")>Xóa</a>" + "</br></br>"
//        var infowindow = new google.maps.InfoWindow({
//            content: content
//        });
        //infowindow.open(map, marker);
        google.maps.event.addListener(marker, 'click', function () {   
            if (infowindow)
                infowindow.close();
            var content = '<p style="color:Blue">' + ds[i].name + '</p>';
            content += 'Vĩ độ: ' + ds[i].Lat + '</br>';
            content += 'Kinh độ: ' + ds[i].Lng + '</br>';
            content += "</br><a href='javascript:void(0);' onclick=XoaDiaDiem(" + ds[i].ID + ")>Xóa</a>" + "</br></br>"
            infowindow = new google.maps.InfoWindow({
                content: content
            });
            infowindow.open(map, marker);
        });
        dsMarker.push(marker);  
    }
    //alert(dsMarker.length);
    map.setCenter(new google.maps.LatLng(ds[0].Lat, ds[0].Lng));
    map.setZoom(10);
}

function XoaDiaDiem(id) {
    for (i in dsDiaDiem) {
        if (dsDiaDiem[i].ID == id) {
            dsMarker[i].setMap(null);
            dsMarker.splice(i, 1);
            dsDiaDiem.splice(i, 1);
        }
    }
    $.ajax({ url: "http://localhost:2817/Service1.svc/XoaDiaDiem?id=" + id,
        success: function (data) {
            if (data) {
                alert("Đã xóa");
            }
            else
                alert("Không thể xóa");
        }
    });
}
