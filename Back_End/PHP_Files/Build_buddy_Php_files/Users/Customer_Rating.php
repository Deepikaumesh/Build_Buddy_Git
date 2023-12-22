<?php
$servername = "localhost";
$username ="root";
$password ="";
$database ="buid_buddy_database";

$connection=mysqli_connect($servername,$username,$password,$database);




if( !empty($_POST["rating_value"])and !empty($_POST["username"])){

	$rating_value=$_POST["rating_value"];
	$username=$_POST["username"];
	
	
	
	
	
	
	
		$sql="INSERT INTO  customer_rating(rating_value,username)values('".$rating_value."','".$username."')";
		
		if(Mysqli_query($connection,$sql)){
			$result["error"]=false;
			$result["Message"]="Comment added Successfully!";
			echo json_encode($result);
			Mysqli_close($connection);
}}




?>