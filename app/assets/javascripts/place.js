var search_initialize = function() {

  // Populate results list and Google Map based on user search terms
  $("#search_button").click(function(eventObject) {
    eventObject.preventDefault();
    clearMarkers();
    var eq = {};
    
    // eq.searchterm = $("#yelpfind_searchterm").val();
    // eq.address = $("#yelpfind_address").val();
    // eq.city = $("#yelpfind_city").val();
    // eq.state = $("#yelpfind_state").val();
    eq.zipcode = $("#yelpfind_zipcode").val();
    // eq.searchradius = $("#yelpfind_searchradius").val();
    // eq.resultslimit = $("#yelpfind_resultslimit").val();
    

    $.ajax({
      url: "/places.json",
      type: "POST",
      data: { query: eq },
      beforeSend: function() {
        $("#spinwheel").show();
      }
    }).done(function(data) {
      $("#spinwheel").hide();
      // Clear the results list table
      $("#resultsTable").empty();

      // Define the Google Map

      // Iterate through the returned JSON object (as "data")
      $(data).each(function(index, result) {

        // Use Handlebars to display the parameters of the "result" in variable "data" to the html browser
        var resultsHTML = HandlebarsTemplates.result_list(result);
        $("#resultsTable").append(resultsHTML);
        
        // Populate the Google Map with markers from "result" object
        setMarker(result);
        console.log(result);
      });

      // Add event listener for button click and View Details
      // $(".viewDetails").on("click", function(event){
      //   var yelp_id = $(this).attr("data-id");

      //   console.log(yelp_id);

      //   $.ajax({
      //     url: "/philz-coffee-san-francisco-3",
      //     type: "GET"
      //   });

      //   });
    });

  });
};

$(document).on('ready page:load', search_initialize);
