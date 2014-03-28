// Turn zipcode into latlng
var geocoder = new google.maps.Geocoder();

var geocodeZipCode = function(zipcode) {
  geocoder.geocode( { 'address': zipcode }, function(results, status) {
    if (status == google.maps.GeocoderStatus.OK) {
      doYelpSearch(results[0].geometry.location);
    } else {
      alert("Geocode was not successful for the following reason: " + status);
    }
  });
};

window.doYelpSearch = function(pos) {
  // re-center map
  map.setCenter(pos);

  // do Yelp search
  $.ajax({
      url: "/places.json",
      type: "POST",
      data: { query: {latitude: pos.k,
                      longitude: pos.A
                     } 
            } 
    }).done(function(data) {
      // Clear the results list table
      $("#resultsTable").empty();

      // Iterate through the returned JSON object (as "data")
      $(data).each(function(index, result) {

        // Use Handlebars to display the parameters of the "result" in variable "data" to the html browser
        var resultsHTML = HandlebarsTemplates.result_list(result);
        $("#resultsTable").append(resultsHTML);
        
        // Populate the Google Map with markers from "result" object
        setMarker(result);
        $("#spinwheel").hide();
      });
    });
};

var search_initialize = function() {
  // Populate results list and Google Map based on user search terms
  $("#search_button").click(function(eventObject) {
    eventObject.preventDefault();
    $("#spinwheel").show();
    clearMarkers();
    
    var zipcode = $("#yelpfind_zipcode").val();
    geocodeZipCode(zipcode);
  });
};

$(document).on('ready page:load', search_initialize);
