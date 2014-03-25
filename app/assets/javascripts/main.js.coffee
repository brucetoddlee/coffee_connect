
app = angular.module('MapTemplate', ['ui.map','ui.event'])

app.controller "MainCtrl", @MainCtrl = ['$scope', ($scope) ->

  #https://developers.google.com/maps/documentation/javascript/basics
  google.maps.visualRefresh = true

  sf = new google.maps.LatLng(37.775, -122.418)

  $scope.mapOptions =
    zoom: 15
    center: sf
    disableDefaultUI: true
    mapTypeId: google.maps.MapTypeId.ROADMAP
    streetViewControl: true
    streetViewControlOptions:
      position: google.maps.ControlPosition.RIGHT_TOP
    zoomControl:true
    zoomControlOptions:
      position:  google.maps.ControlPosition.RIGHT_TOP
      style: google.maps.ZoomControlStyle.SMALL

  request =
    location: sf
    radius: 500
    types: ["store"]


  service = new google.maps.places.PlacesService(map)
  
  service.nearbySearch request, callback
  return

  callback = (results, status) ->
    if status is google.maps.places.PlacesServiceStatus.OK
      i = 0

      while i < results.length
        createMarker results[i]
        i++
    return

  createMarker = (place) ->
    placeLoc = place.geometry.location
    marker = new google.maps.Marker(
      map: map
      position: place.geometry.location
    )





  # Get ref to some services that you might use
  $scope.directionsService = new google.maps.DirectionsService()
  $scope.directionsDisplay = new google.maps.DirectionsRenderer()

  $scope.geo = navigator.geolocation

  $('#map_canvas').height $(window).height()

  $scope.onMapIdle = ->
    console.log 'Map loaded.'
    $scope.directionsDisplay.setMap($scope.map)
    $scope.dropMarkerAtCurrentPosition()

  $scope.dropMarkerAtCurrentPosition = ->
    $scope.geo.getCurrentPosition (position) ->
      $scope.setMarker position.coords.latitude, position.coords.longitude

  # plots  marker
  $scope.setMarker = (lat, lon) ->
    marker = new google.maps.Marker(
      map: $scope.map
      position: new google.maps.LatLng(lat, lon)
      animation: google.maps.Animation.NONE
    )
]




