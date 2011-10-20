var map;
var vietnam = new google.maps.LatLng(14.058324, 108.277199);
var initLocation;
var browserSupportFlag;
var geocoder;
var marker;
var infowindow;
var latitude;
var longitude;

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
    var myOptions = {
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
            var infoWindow = new google.maps.InfoWindow({ content: 'My Location' });
            infoWindow.open(map, marker);
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
            var infoWindow = new google.maps.InfoWindow({ content: 'My Location' });
            infoWindow.open(map, marker);
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
            if (!infowindow) {
                infowindow = new google.maps.InfoWindow();
            }
            var content = '<p>' + results[0].formatted_address + '</p></br>';
            content += 'Vĩ độ:' + results[0].geometry.location.lat() + '</br>';
            content += 'Kinh độ:' + results[0].geometry.location.lng() + '</br></br></br>';
            map.setZoom(12);
            infowindow.setContent(content);
            infowindow.open(map, marker);
            if (flag == true) {
                var panel = document.getElementById("diadiembox");
                var panelContent = "<strong>Các kết quả tìm được:</strong></br>";
                for (var i in results) {
                    panelContent += "<a href='javascript:void(0);' name='" + results[i].formatted_address + "' onclick=linkDiaDiem_Click(this)>" + results[i].formatted_address + "</a>" + "</br></br>";
                    panelContent += "<a href='google.aspx?name=" + results[i].formatted_address + "&lat=" + results[0].geometry.location.lat() + "&long=" + results[0].geometry.location.lng() + "'>" + "Lưu lại" + "</a>" + "</br></br>";
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
    var infoWindow = new google.maps.InfoWindow({
        content: content
    });
    // Adding the InfoWindow to the map
    infoWindow.open(map, marker);
}