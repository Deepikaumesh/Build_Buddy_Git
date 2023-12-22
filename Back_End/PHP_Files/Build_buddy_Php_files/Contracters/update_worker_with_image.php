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
		$id = $_POST['id'];
				$name = $_POST["name"];
				$age= $_POST["age"];
				$place= $_POST["place"];
				$experience= $_POST["experience"];
				$phone= $_POST["phone"];
				$email= $_POST["email"];
				$description= $_POST["description"];
	    

		 // $file_name1 = $_FILES['image']['name'];
		 if( $_FILES['image'])
		 {
				 $file_name1 = $_FILES['image']['name'];
				 $file_tmp =$_FILES['image']['tmp_name'];
				 move_uploaded_file($file_tmp,'image_uploaded/'.$file_name1);
		 
				$file_name2="http://$ip_address/flutterimg/image_uploaded/".$file_name1;


				$sql = "UPDATE ` workers` SET  id='$id',name='".$name."',age='".$age."',place='".$place."',experience='".$experience."',phone='".$phone."',email='".$email."',description='".$description."' WHERE id=".$id);
		 }
		 else
		 {
			 	$sql = "UPDATE ` workers` SET id='$id',name='".$name."',age='".$age."',place='".$place."',experience='".$experience."',phone='".$phone."',email='".$email."',description='".$description."' WHERE id=".$id);
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


