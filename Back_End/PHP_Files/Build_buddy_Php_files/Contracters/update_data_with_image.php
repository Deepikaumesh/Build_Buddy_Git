<?php
$servername = 'localhost';
$username = 'root';
$password = '';
$database = "user_data";

// // Create connection
$connection = new mysqli($servername, $username, $password,$database);
    
   
// Check connection
if ($connection->connect_error) {
  die("Connection failed: " . $connection->connect_error);
}
		$ip_address='192.168.29.64';
		$id=$_POST['id'];
		$craft_id= $_POST['craft_id'];
		$name = $_POST['name'];
		$price = $_POST['price'];
		$description = $_POST['description'];
	    

		 // $file_name1 = $_FILES['image']['name'];
		 if( $_FILES['image'])
		 {
				 $file_name1 = $_FILES['image']['name'];
				 $file_tmp =$_FILES['image']['tmp_name'];
				 move_uploaded_file($file_tmp,'image_uploaded/'.$file_name1);
		 
				$file_name2="http://$ip_address/flutterimg/image_uploaded/".$file_name1;


				$sql = "UPDATE `img_tb` SET craft_id='$craft_id',name='$name',price='$price',description='$description',image='$file_name2' where id=$id";
		 }
		 else
		 {
			 	$sql = "UPDATE `img_tb` SET craft_id='$craft_id',name='$name',price='$price',description='$description' where id=$id";
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


