//function to populate dropdown list with student names
function populateStudentNames () {
  	$.getJSON("../php/json-data-students.php", function(data) {
		$.each(data.students, function(index, student) {
			$("#select-choice-2").append("<option id='" + student.studentID + "' value='" + student.firstName + "'>" + student.firstName + " " + student.lastName + "</option>");		
		});
   	});
};

//populate student page upon page creation
$(document).on("pagecreate","#schedulePage",function(event){
	populateStudentNames();
});

//find matching course modules for selected student
$("#select-choice-2").change(function(){
	var selectedID = $(this).find("option:selected").attr("id");
	displayModules(selectedID);
});

function getModuleNames(module1, module2) {
	var moduleNames = [];
	$.getJSON("../php/json-data-modules.php", function(data) {
		$.each(data.modules, function(index, module) {
			if (module.moduleNo == module1 || module.moduleNo == module2 ) {
				moduleNames.push(module.moduleName);
			} else
			{
				//do nothing right now
			};
		});	
		return moduleNames;	
	});	
};

function displayModules (selectedID) {
	var module1;
	var module2;
  	$.getJSON("../php/json-data-students.php", function(data) {
		$.each(data.students, function(index, student) {
			if (selectedID == student.studentID){
				module1 = student.moduleNo1;
				module2 = student.moduleNo2;
				// $("#scheduleContent").empty();
			 //  	$("#scheduleContent").append("<p> Module 1: " + student.moduleNo1+ "</p>");
				// $("#scheduleContent").append("<p> Module 2: " + student.moduleNo2+ "</p>");
			}
		});
   	});
	var moduleNames2 = getModuleNames(module1, module2);
	console.log(moduleNames2);
}
