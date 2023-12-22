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
				$place= $_POST["place"];
				$experience= $_POST["experience"];
				$phone= $_POST["phone"];
				$email= $_POST["email"];
				$description= $_POST["description"];
			
				

	//$connection->query("UPDATE   user SET name='".$name."',age='".$age."' WHERE id=".$id//)
  $connection->query("UPDATE   workers SET name='".$name."',age='".$age."',place='".$place."',experience='".$experience."',phone='".$phone."',email='".$email."',description='".$description."' WHERE id=".$id);



	



    	
	$result = array();
	$result['msg'] = "Successfully Edited..";
	echo json_encode($result);

?>



