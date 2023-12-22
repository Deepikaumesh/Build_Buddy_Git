<?php
$servername = "localhost";
$username ="root";
$password ="";
$database ="buid_buddy_database";

$connection=mysqli_connect($servername,$username,$password,$database);

if( !empty($_POST["username"])and !empty($_POST["email"])and !empty($_POST["phone"])and !empty($_POST["password"])){

	$username=$_POST["username"];
	$email= $_POST["email"];
	$phone=$_POST["phone"];
	$password=$_POST["password"];
	
	// $username=Mysql_real_escape_string($connection,$username);
	// $email=Mysql_real_escape_string($connection,$email);
	// $phone=Mysql_real_escape_string($connection,$phone);
	// $password=Mysql_real_escape_string($connection,$password);
	
	$findexist="select * from  admin where username='".$username."'";
	
	
	$resultSearch=Mysqli_query($connection,$findexist);
	
	if(Mysqli_num_rows($resultsearch)>0){
		while($row=Mysqli_fetch_array($resultsearch))
		{
			$result["error"]=true;
			$result["Message"]="username Already exist try another";
	echo json_encode($result);
	}
	   } 
	
	
	else{
		$sql="INSERT INTO admin(username,email,phone,password)values('".$username."','".$email."','".$phone."','".$password."')";
		
		if(Mysqli_query($connection,$sql)){
			$result["error"]=false;
			$result["Message"]="Registration success";
			echo json_encode($result);
			Mysqli_close($connection);
}}}




?>