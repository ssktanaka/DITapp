<?
    $str_browser_language = !empty($_SERVER['HTTP_ACCEPT_LANGUAGE']) ? strtok(strip_tags($_SERVER['HTTP_ACCEPT_LANGUAGE']), ',') : '';
    $str_browser_language = !empty($_GET['language']) ? $_GET['language'] : $str_browser_language;
    switch (substr($str_browser_language, 0,2))
    {
        case 'de':
            $str_language = 'de';
            break;
        case 'en':
            $str_language = 'en';
            break;
        default:
            $str_language = 'en';
    }
    
    $arr_available_languages = array();
    $arr_available_languages[] = array('str_name' => 'English', 'str_token' => 'en');
    $arr_available_languages[] = array('str_name' => 'Deutsch', 'str_token' => 'de');
    
    $str_available_languages = (string) '';
    foreach ($arr_available_languages as $arr_language)
    {
        if ($arr_language['str_token'] !== $str_language)
        {
            $str_available_languages .= '<a href="'.strip_tags($_SERVER['PHP_SELF']).'?language='.$arr_language['str_token'].'" lang="'.$arr_language['str_token'].'" xml:lang="'.$arr_language['str_token'].'" hreflang="'.$arr_language['str_token'].'">'.$arr_language['str_name'].'</a> | ';
        }
    }
    $str_available_languages = substr($str_available_languages, 0, -3);
?>


<?
/*
 * Following code will list all the lecturers on a course
 */
 
//Enable cross domain Communication - Beware, this can be a security risk 
header('Access-Control-Allow-Origin: *');

// array for JSON response
$response = array();

// include db connect class
require_once __DIR__ . '/db_connect.php';

// connecting to db
$db = new DB_CONNECT();

// get all lecturers from lecturerTable
$result = mysql_query("SELECT * FROM lecturertable") or die(mysql_error());

// check for empty result
if (mysql_num_rows($result) > 0)
 {
    // looping through all results
    // lecturers node
    $response["lecturers"] = array();

     while ($row = mysql_fetch_array($result)) 
     {
        	// temp lecturer array
            $lecturer = array();
            $lecturer["staffNumber"] = $row["staffNumber"];
            $lecturer["firstName"] = $row["firstName"];
            $lecturer["lastName"] = $row["lastName"];
            $lecturer["moduleNo1"] = $row["moduleNo1"];
            $lecturer["moduleNo2"] = $row["moduleNo2"];
            $lecturer["email"] =$row["email"];

       // push single product into final response array
        array_push($response["lecturers"], $lecturer);
    }
    // success
    $response["success"] = 1;

    // echoing JSON response
    print (json_encode($response));
    // echo (json_encode($response));

}else {

    // no lecturers found
    $response["success"] = 0;
    $response["message"] = "No products found";

    // echo no lecturers JSON
    print (json_encode($response));
    //echo (json_encode($response));
}


?>

