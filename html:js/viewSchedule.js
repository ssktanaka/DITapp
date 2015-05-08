//global variables to hold returned JSON data
var students;
var modules;

//function to populate dropdown list with student names
function populateStudentNames () {
  	$.getJSON("../php/json-data-students.php", function(data) {
		//save student data to global variable students
		students = data.students;
		//iterate over student data, and fill dropdown with students' first and last names
		$.each(data.students, function(index, student) {
			$("#select-choice-2").append("<option id='" + student.studentID + "' value='" + student.firstName + "'>" + student.firstName + " " + student.lastName + "</option>");		
		});
   	});
};

//function to get module data upon page creation
function getModuleData() {
	$.getJSON("../php/json-data-modules.php", function(data) {
		//save module data to global variable modules
		modules = data.modules;
	});
};

//populate student page, get module data upon page creation
$(document).on("pagecreate","#schedulePage",function(event){
	populateStudentNames();
	getModuleData();
	//hide spacefiller div for styling
	$("div.spacefiller").show();
});

//find matching course modules for selected student
$("#select-choice-2").change(function(){
	//get student ID for selected student
	var selectedID = $(this).find("option:selected").attr("id");
	//pass student ID to displayModules function 
	displayModules(selectedID);
});

//match moduleNo1 and moduleNo2 to module object
function getModuleNames(module1, module2) {
	//empty array to hold module object 
	var selectedModule = [];
	//iterate over module data. if module number matches either module 1 or module2, save module object to array
	$.each(modules, function(index, module) {
		if (module.moduleNo == module1 || module.moduleNo == module2 ) {
			selectedModule.push(module);
		} else {
			//do nothing right now
		};
	});
	return selectedModule;		
};

//function to display course information, given a selected student ID
function displayModules(selectedID) {
	//declare local variables to hold module information
	var module1;
	var module2;
	//iterate over student list. if selected student ID matches student ID in list, save moduleNo1 and moduleNo2
	$.each(students, function(index, student) {
		if (selectedID == student.studentID){
			module1 = student.moduleNo1;
			module2 = student.moduleNo2;
		}
   	});		
	//call getModuleNames and pass in moduleNo1 and moduleNo2
	var selectedModule = getModuleNames(module1, module2);
	//clear divs 
	$("#module1").empty();
	$("#module2").empty();
	//hide spacefiller div for styling
	$("div.spacefiller").hide();
	//fill divs with course information
	$("#module1").append("<h4>" + selectedModule[0].moduleName + "</h4><p>" + selectedModule[0].meetingDay + "s</p><p>Room " + selectedModule[0].room + "</p><p>" + selectedModule[0].location + "</p>");
	$("#module2").append("<h4>" + selectedModule[1].moduleName + "</h4><p>" + selectedModule[1].meetingDay + "s</p><p>Room " + selectedModule[1].room + "</p><p>" + selectedModule[1].location + "</p>");
};
