//function to populate module page with course buttons in listview
function populateModulePage() {
	$.getJSON("../php/json-data-modules.php", function(data) {
		$.each(data.modules, function(index, module) {
			$("#moduleButtons").append("<li class='individualModule' id='" + module.moduleNo + "'><a href='#moduleInfo'>"+ module.moduleName+ "</a></li>");
		});
		$("#moduleButtons").listview("refresh");
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
	$.getJSON("../php/json-data-modules.php", function(data) {
		//iterate through course information
		$.each(data.modules, function(index, module) {
			//if module information matches module id, then display module information 
			if (moduleNumber == module.moduleNo) {
				$("#additionalContent" ).empty();
			  	$("#additionalContent").append("<p> Module Name: " + module.moduleName+ "</p>");
				$("#additionalContent").append("<p> Meeting Day: " + module.meetingDay+ "</p>");
				$("#additionalContent").append("<p> Number of credits: " + module.credits+ "</p>");
				$("#additionalContent").append("<p> Campus Location: " + module.location+ "</p>");
				$("#additionalContent").append("<p> Room: " + module.room+ "</p>");
			}
		});
   	});
});
