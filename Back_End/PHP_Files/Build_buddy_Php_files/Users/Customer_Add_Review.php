<?php
$servername = "localhost";
$username ="root";
$password ="";
$database ="buid_buddy_database";

$connection=mysqli_connect($servername,$username,$password,$database);




if( !empty($_POST["comments"])and !empty($_POST["username"])){

	$comments=$_POST["comments"];
	$username=$_POST["username"];
	
	
	
	
	
	
	
		$sql="INSERT INTO  userr_review(comments,username)values('".$comments."','".$username."')";
		
		if(Mysqli_query($connection,$sql)){
			$result["error"]=false;
			$result["Message"]="Comment added Successfully!";
			echo json_encode($result);
			Mysqli_close($connection);
}}




?>