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
				$name = $_POST["name"];
				$age= $_POST["age"];

	$connection->query("UPDATE  send_data_demo SET name='".$name."',age='".$age."' WHERE id=".$id);




	



    	
	$result = array();
	$result['msg'] = "Successfully Edited..";
	echo json_encode($result);

?>



