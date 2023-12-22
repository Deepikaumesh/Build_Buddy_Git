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
	$password=$_POST["password"];
	$report_status=$_POST["report_status"];
	$place = $_POST['place'];
	$experience = $_POST['experience'];
	   
	    

		 // $file_name1 = $_FILES['image']['name'];
		 if( $_FILES['image'])
		 {
				 $file_name1 = $_FILES['image']['name'];
				 $file_tmp =$_FILES['image']['tmp_name'];
				 move_uploaded_file($file_tmp,'image_uploaded/'.$file_name1);
		 
				$file_name2="http://192.168.29.64/Build_buddy_Php_files/Contracters/image_uploaded/".$file_name1;

				$sql = "UPDATE `contractors_reg2` SET  id='$id',username='$username',email='$email',phone='$phone',password='$password',report_status='$report_status',place='$place',experience='$experience',image='$file_name2' WHERE id=$id";
		 }
		 else
		 {
			 					$sql = "UPDATE `contractors_reg2` SET  id='$id',username='$username',email='$email',phone='$phone',password='$password',report_status='$report_status',place='$place',experience='$experience',image='$file_name2' WHERE id=$id";

		 }

 if ($connection->query($sql) === TRUE)
{
  echo json_encode(array("statusCode=200","msg"=>"Updated successfully"));
} 
else 
{
  echo json_encode(array("statusCode=0","msg"=>$connection->error));
}
 
 
 
?>


