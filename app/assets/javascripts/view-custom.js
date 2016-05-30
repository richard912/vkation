// jquery noconflict starts
$.noConflict();
jQuery(document).ready(function($) {
// start Code that uses jQuery's here
	// show hide vacation sub categories
	// toggle not working here to show multiple drops
	$(".options-drop-trigger-1").click(function(){
    	$(".options-list-js-1").show();
    	$(".options-list-js-2").hide();
    	$(".options-list-js-3").hide();
    	$(".options-list-js-4").hide();
    	$(".options-list-js-5").hide();
    	$(".options-list-js-6").hide();
	});

	$(".options-drop-trigger-2").click(function(){
    	$(".options-list-js-2").show();
    	$(".options-list-js-1").hide();
    	$(".options-list-js-3").hide();
    	$(".options-list-js-4").hide();
    	$(".options-list-js-5").hide();
    	$(".options-list-js-6").hide();
	});

	$(".options-drop-trigger-3").click(function(){
    	$(".options-list-js-3").show();
    	$(".options-list-js-2").hide();
    	$(".options-list-js-1").hide();
    	$(".options-list-js-4").hide();
    	$(".options-list-js-5").hide();
    	$(".options-list-js-6").hide();
	});

	$(".options-drop-trigger-4").click(function(){
    	$(".options-list-js-4").show();
    	$(".options-list-js-2").hide();
    	$(".options-list-js-3").hide();
    	$(".options-list-js-1").hide();
    	$(".options-list-js-5").hide();
    	$(".options-list-js-6").hide();
	});

	$(".options-drop-trigger-5").click(function(){
    	$(".options-list-js-5").show();
    	$(".options-list-js-2").hide();
    	$(".options-list-js-3").hide();
    	$(".options-list-js-4").hide();
    	$(".options-list-js-1").hide();
    	$(".options-list-js-6").hide();
	});

	$(".options-drop-trigger-6").click(function(){
    	$(".options-list-js-6").show();
    	$(".options-list-js-2").hide();
    	$(".options-list-js-3").hide();
    	$(".options-list-js-4").hide();
    	$(".options-list-js-5").hide();
    	$(".options-list-js-1").hide();
	});

	// date picker
// $( ".datepicker" ).datepicker();

// $(".test-marker").click(function(){
//     	$(".map-over").show();
//     	$(".close-map-over").show();
// 	});	


// 	$(".close-map-over").click(function(){
//     	$(".map-over").hide();
//     	$(".close-map-over").hide();
// 	});	
	

// end Code that uses jQuery's
});
 // jquery noconflict ends





// function initialize() {
//   var mapProp = {
//     center:new google.maps.LatLng(51.508742,-0.120850),
//     zoom:5,
//     mapTypeId:google.maps.MapTypeId.ROADMAP
//   };
//   var map=new google.maps.Map(document.getElementById("googleMap"), mapProp);
// }
// google.maps.event.addDomListener(window, 'load', initialize);
//

 