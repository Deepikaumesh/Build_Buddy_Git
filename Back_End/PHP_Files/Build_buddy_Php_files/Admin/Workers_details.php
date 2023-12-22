<?php
$servername = "localhost";
$username ="root";
$password ="";
$database ="buid_buddy_database";

$connection=mysqli_connect($servername,$username,$password,$database);

if( !empty($_POST["name"])and !empty($_POST["age"])and 
!empty($_POST["place"])and !empty($_POST["experience"])and 
empty($_POST["phone"])and !empty($_POST["email"])and
!empty($_POST["description"])){


	$name= $_POST["name"];
	$age=$_POST["age"];
	$place=$_POST["place"];
	$experience=$_POST["experience"];
	$phone=$_POST["phone"];
	$email=$_POST["email"];
	$description=$_POST["description"];
	
	
		$sql="INSERT INTO workers(name,age,place,experience,phone,email,description)values
		
		('".$name."','".$age."','".$place."','".$experience."','".$phone."','".$email."','".$description."')";
		
		if(Mysqli_query($connection,$sql)){
			$result["error"]=false;
			$result["Message"]="Registration success";
			echo json_encode($result);
			Mysqli_close($connection);
}}




?>