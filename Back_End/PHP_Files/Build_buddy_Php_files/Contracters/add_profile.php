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
     $name = $_POST['name'];
	   $place = $_POST['place'];
	   $phone = $_POST['phone'];
	   $email = $_POST['email'];
	   $experience = $_POST['experience'];
	   
	   
	    

 $file_name1 = $_FILES['image']['name'];
 $file_tmp =$_FILES['image']['tmp_name'];
  move_uploaded_file($file_tmp,'image_uploaded/'.$file_name1);
 


  
  
  $file_name2="http://192.168.29.187/Build_buddy_Php_files/Contracters/image_uploaded/".$file_name1;
  
 



 $sql = "INSERT INTO `contractors_profile`( `id`,`name`,`place`,`phone`,`email`,`experience`,`image`) VALUES 
 ( '$id',' $name ','$place','$phone',' $email ','$experience','$file_name2')";

 if ($connection->query($sql) === TRUE)
{
  echo json_encode(array("statusCode=200","msg"=>"New record created successfully"));
} 
else 
{
  echo json_encode(array("statusCode=0","msg"=>$connection->error));
}
 
 
 
?>


