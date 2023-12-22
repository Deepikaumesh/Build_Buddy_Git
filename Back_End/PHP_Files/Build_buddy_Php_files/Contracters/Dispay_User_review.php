<?php

$servername = "localhost";
$username ="root";
$password ="";
$database ="buid_buddy_database";

$connection=new Mysqli($servername,$username,$password,$database);

// if($connection->connect_error){
	// die("Connection Failed:".$connection->connect_error);
// }


$sql= "select * from   userr_review ";

$result=Mysqli_query($connection,$sql) or die("error in selecting".Mysqli_error($connection));

$response=array();
if($result->num_rows>0){
	while($rows=$result->fetch_assoc()){
		array_push($response,$rows);
	}
}
$connection->close();
//header('content-Type:application/json');
echo json_encode($response);


?>
