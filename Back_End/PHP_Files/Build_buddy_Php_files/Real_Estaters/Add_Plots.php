<?php
$servername = 'localhost';
$username = 'root';
$password = '';
$database = "buid_buddy_database";


// // Create connection
$connection = new mysqli($servername, $username, $password,$database);
    
   
// Check connection
if ($connection->connect_error) {
  die("Connection failed: " . $connection->connect_error);
}
 

   $id= $_POST['id'];
    $username=$_POST["username"];
	$email= $_POST["email"];
	$phone=$_POST["phone"];
	$place = $_POST['place'];
	$amount=$_POST["amount"];
	$area=$_POST["area"];
	$description = $_POST['description'];
	   
	   
	    

 $file_name1 = $_FILES['image']['name'];
 $file_tmp =$_FILES['image']['tmp_name'];
  move_uploaded_file($file_tmp,'image_uploaded/'.$file_name1);
 


  
  
  $file_name2="http://192.168.29.64/Build_buddy_Php_files/Real_Estaters/image_uploaded/".$file_name1;
  
 



 $sql = "INSERT INTO `plots`( id,username,email,phone,place,amount,area,description,image) VALUES 
 ( '$id','$username','$email','$phone','$place','$amount','$area','$description','$file_name2')";

 if ($connection->query($sql) === TRUE)
{
  echo json_encode(array("statusCode=200","msg"=>"New record created successfully"));
} 
else 
{
  echo json_encode(array("statusCode=0","msg"=>$connection->error));
}
 
 
 
?>


