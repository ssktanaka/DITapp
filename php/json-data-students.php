<?
/*
 * Following code will list all the students on a course
 */

//Enable cross domain Communication - Beware, this can be a security risk 
header('Access-Control-Allow-Origin: *');

// array for JSON response
$response = array();

// include db connect class
require_once __DIR__ . '/db_connect.php';

// connecting to db
$db = new DB_CONNECT();

// get all courses from course table
$result = mysql_query("SELECT * FROM studenttable") or die(mysql_error());

// check for empty result
if (mysql_num_rows($result) > 0)
 {
    // looping through all results
    // students node
    $response["students"] = array();

     while ($row = mysql_fetch_array($result)) 
     {
        	// temp student array
            $student = array();
            $student["studentID"] = $row["studentID"];
            $student["firstName"] = $row["firstName"];
            $student["lastName"] = $row["lastName"];
            $student["moduleNo1"] = $row["moduleNo1"];
            $student["moduleNo2"] = $row["moduleNo2"];
            $student["courseID"] =$row["courseID"];


       // push single student into final response array
        array_push($response["students"], $student);
    }
    // success
    $response["success"] = 1;

    // echoing JSON response
    print (json_encode($response));
    // echo (json_encode($response));

}
else {
    // no students found
    $response["success"] = 0;
    $response["message"] = "No students found";

    // echo no students JSON
    print (json_encode($response));
    //echo (json_encode($response));
}


?>

