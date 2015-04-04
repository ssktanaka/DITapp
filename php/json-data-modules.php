<?
/*
 * Following code will list all the modules on a course
 */

//Enable cross domain Communication - Beware, this can be a security risk 
header('Access-Control-Allow-Origin: *');

// array for JSON response
$response = array();

// include db connect class
require_once __DIR__ . '/db_connect.php';

// connecting to db
$db = new DB_CONNECT();

// get all modules from module table
$result = mysql_query("SELECT * FROM moduletable") or die(mysql_error());

// check for empty result
if (mysql_num_rows($result) > 0)
 {
    // looping through all results
    // modules node
    $response["modules"] = array();

     while ($row = mysql_fetch_array($result)) 
     {
        	// temp module array
            $module = array();
            $module["moduleNo"] = $row["moduleNo"];
            $module["moduleName"] = $row["moduleName"];
            $module["meetingDay"] = $row["meetingDay"];            
            $module["credits"] = $row["credits"];
            $module["website"] = $row["website"];
            $module["dueDate"] = $row["dueDate"];
            $module["location"] =$row["location"];
            $module["room"] =$row["room"];
            $module["lat"] =$row["lat"];
            $module["long"] =$row["long"];
            
             	 	 	 	 	 	 	 	


       // push single module into final response array
        array_push($response["modules"], $module);
    }
    // success
    $response["success"] = 1;

    // echoing JSON response
    print (json_encode($response));
    // echo (json_encode($response));

}else {
    
    // no modules found
    $response["success"] = 0;
    $response["message"] = "No modules found";

    // echo no modules JSON
    print (json_encode($response));
    //echo (json_encode($response));
}

?>

