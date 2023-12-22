<?php 
$servername = 'localhost';
$username = 'root';
$password = '';
 $database = "buid_buddy_database";

$connection = new mysqli($servername, $username, $password,$database);
    

if ($connection->connect_error) {
  die("Connection failed: " . $connection->connect_error);
}

            $connection->set_charset("utf8");
            
            
				$id = $_POST['id'];
				$report_status = $_POST["report_status"];
				
		
				

  $connection->query("UPDATE   contractors_reg2 SET report_status='".$report_status."' WHERE id=".$id);



	



    	
	$result = array();
	$result['msg'] = "Successfully Updated..";
	echo json_encode($result);

?>



