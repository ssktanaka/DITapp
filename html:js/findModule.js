//global variable to hold module dataset
var modules;

//function to populate module page with course buttons in listview
function populateModulePage() {
	$.getJSON("../php/json-data-modules.php", function(data) {
		//assign dataset to modules variable
		modules = data.modules;
		//iterate through module data, append module information to moduleButtons div
		$.each(data.modules, function(index, module) {
			$("#moduleButtons").append("<li class='individualModule' id='" + module.moduleNo + "'><a href='#moduleInfo'>"+ module.moduleName+ "</a></li>");
		});
		//refresh the listview
		$("#moduleButtons").listview("refresh");
   	});
};

//function to create map
function createMap(lat,long){
	//create variable latlong to hold new map coordinates
	var latlong = new google.maps.LatLng(lat, long);
	//create variable map to hold map object 
	var map = new google.maps.Map(document.getElementById("map_canvas"), {
	    center: latlong,
	    zoom: 18,
	    mapTypeId: google.maps.MapTypeId.ROADMAP
	});
	//create variable marker to hold marker coordinates
	var marker = new google.maps.Marker({
	    position: latlong,
	    map: map,
	    title: "DIT Campus Location",
	    draggable: false
	});
	//listen for map to finish creating
	google.maps.event.addListenerOnce(map, "idle", function() {
		//resize and reset zoom to position map correctly
  		google.maps.event.trigger(map, "resize");
  		map.setZoom(16);
	});
};

//populate module page with course buttons in listview
$(document).on("pagecreate","#modulePage",function(event){
	//call populate module page function
	populateModulePage();
});

//populate additional class page with relevant module information
$(document).on("click", ".individualModule", function() {
	//get id of module
	var moduleNumber = this.id; 
	$.each(modules, function(index, module) {
		//if module information matches module id, then display module information 
		if (moduleNumber == module.moduleNo) {
			$("#additionalContent").empty();
		  	$("#additionalContent").append("<h4>Module Name</h4><p>" + module.moduleName + "</p>");
			$("#additionalContent").append("<h4>Meeting Day</h4><p> " + module.meetingDay+ "</p>");
			$("#additionalContent").append("<h4>Number of Credits</h4><p> " + module.credits+ "</p>");
			$("#additionalContent").append("<h4>Campus Location</h4><p> " + module.location+ "</p>");
			$("#additionalContent").append("<h4>Room Number</h4><p> " + module.room+ "</p>");	
			//create map div
			$("#additionalContent").append("<div id='map_canvas'></div>");
			//create map object
			createMap(module.lat, module.long);	
		};
	});
});









