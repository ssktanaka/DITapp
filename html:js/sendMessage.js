//function to populate dropdown list with lecturer names
function populateTeacherNames () {
  	$.getJSON("../php/json-data-lecturers.php", function(data) {
		$.each(data.lecturers, function(index, lecturer) {
			$("#select-choice-3").append("<option id='" + lecturer.firstName + "' value='" + lecturer.firstName + "'>" + lecturer.firstName + " " + lecturer.lastName+ "</option>");		
		});
   	});
};

//populate student page upon page creation
$(document).on("pagecreate","#messagePage",function(event){
	populateTeacherNames();
	//hide message content
	$("#messageContent").hide();
	$("div.spacefiller").show();
});

//display message content once user selects lecturer from dropdown menu
$("select").change(function(){
	$("div.spacefiller").hide();
    $("#messageContent").show(1000);
});