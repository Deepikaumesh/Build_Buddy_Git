<?php
$servername = 'localhost';
$username = 'root';
$password = '';
$database = "buid_buddy_database";

// Create connection
$connection = mysqli_connect($servername, $username, $password, $database);
   
// Check connection
if ($connection->connect_error) {
  die("Connection failed: " . $connection->connect_error);
}
 $id=$_POST['id'];

  
 
 
	$connection->query("DELETE  FROM     real_estaters WHERE id=".$id) ;
 

$result=array("success"=>'Successfully Deleted');
echo json_encode($result);
?>