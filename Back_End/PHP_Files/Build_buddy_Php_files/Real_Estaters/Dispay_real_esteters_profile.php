<?php

$servername = "localhost";
$username ="root";
$password ="";
$database ="buid_buddy_database";

$connection=new Mysqli($servername,$username,$password,$database);

//'$customer_name'";

   $id = $_GET['id'];
   $sql = "select * from real_estaters  WHERE id=".$id; 


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
