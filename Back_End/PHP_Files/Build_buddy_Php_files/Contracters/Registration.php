<?php
$servername = "localhost";
$username ="root";
$password ="";
$database ="buid_buddy_database";

$connection=mysqli_connect($servername,$username,$password,$database);

if( !empty($_POST["username"])and !empty($_POST["email"])and !empty($_POST["phone"])and !empty($_POST["password"])
and !empty($_POST["report_status"])	
){

	$username=$_POST["username"];
	$email= $_POST["email"];
	$phone=$_POST["phone"];
	$password=$_POST["password"];
	$report_status=$_POST["report_status"];
	

	
	$findexist="select * from  contractors where username='".$username."'";
	
	
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
		$sql="INSERT INTO contractors(username,email,phone,password,report_status)values('".$username."','".$email."','".$phone."','".$password."','".$report_status."')";
		
		if(Mysqli_query($connection,$sql)){
			$result["error"]=false;
			$result["Message"]="Registration success";
			echo json_encode($result);
			Mysqli_close($connection);
}}}




?>