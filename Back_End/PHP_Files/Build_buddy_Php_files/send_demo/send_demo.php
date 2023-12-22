<?php
$servername = "localhost";
$username ="root";
$password ="";
$database ="buid_buddy_database";

$connection=mysqli_connect($servername,$username,$password,$database);




if( !empty($_POST["name"])and !empty($_POST["age"])){

	$name=$_POST["name"];
	$age= $_POST["age"];
	
	
	
	
	
	
		$sql="INSERT INTO send_data_demo(name,age)values('".$name."','".$age."')";
		
		if(Mysqli_query($connection,$sql)){
			$result["error"]=false;
			$result["Message"]="Registration success";
			echo json_encode($result);
			Mysqli_close($connection);
}}




?>