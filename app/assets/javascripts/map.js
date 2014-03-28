var map = {};
var markers = [];

var clearMarkers = function() {
  markers.forEach(function(marker) {
    marker.setMap(null);
  });
  markers = [];
};

var map_initialize = function() {

  $("#spinwheel").show();

  var mapOptions = {
    zoom: 15
  };

  map = new google.maps.Map(document.getElementById('map-canvas'),
      mapOptions);

  // Try HTML5 geolocation
  if(navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(function(position) {
      var pos = new google.maps.LatLng(position.coords.latitude,
                                       position.coords.longitude);

      var infowindow = new google.maps.InfoWindow({
        map: map,
        position: pos,
        // content: 'Location found using HTML5.'
      });

      map.setCenter(pos);
      doYelpSearch(pos);

    }, function() {
      handleNoGeolocation(true);
    });
  } else {
    // Browser doesn't support Geolocation
    handleNoGeolocation(false);
  }
}

function handleNoGeolocation(errorFlag) {
  if (errorFlag) {
    var content = 'Error: The Geolocation service failed.';
  } else {
    var content = 'Error: Your browser doesn\'t support geolocation.';
  }

  var options = {
    map: map,
    position: new google.maps.LatLng(37.7833, 122.4167),
    content: content
  };

  var infowindow = new google.maps.InfoWindow(options);
  map.setCenter(options.position);
}

function setMarker(result) {

  // Populate Google Map with markers
  var position = new google.maps.LatLng(
    result.latitude,
    result.longitude
  );

  infowindow = new google.maps.InfoWindow();

  var marker_image = 'coffee-cup.png';

  var marker = new google.maps.Marker({
    position: position,
    map: map,
    icon: marker_image,
    data: {text: "<h4>"+result.name+"</h4><p>Wi-Fi speed: "+result.avg_download+" Mbps</p>"},
    title: result.name
  });

  google.maps.event.addListener(marker, 'click', function() { 
    onItemClick(event, this);
  });

  markers.push(marker);
}

function onItemClick(event, pin) { 
  var contentString = pin.data.text;
  infowindow.setContent(contentString); 
  infowindow.setPosition(pin.position); 
  infowindow.open(map);
}  

$(document).on('ready page:load', map_initialize);