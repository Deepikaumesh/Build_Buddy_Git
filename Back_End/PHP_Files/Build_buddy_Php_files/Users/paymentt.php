
<?php
$servername = 'localhost';
$username = 'root';
$password = '';
$database = "buid_buddy_database";

// Create connection
$connection = mysqli_connect($servername, $username, $password, $database);


  if( !empty($_POST["customer_name"])and !empty($_POST["email_id"])
	  and !empty($_POST["phone_no"])and !empty($_POST["account_no"])
  and !empty($_POST["amount"])and !empty($_POST["reciever_name"])
  and !empty($_POST["bank_name"]))
	  
  
{

    $customer_name = $_POST["customer_name"];
    $email_id= $_POST["email_id"];
	$phone_no = $_POST["phone_no"];
    $account_no= $_POST["account_no"];
	$amount= $_POST["amount"];
	$reciever_name = $_POST["reciever_name"];
    $bank_name= $_POST["bank_name"];
   
   
   
               
      
      $customer_name=mysqli_real_escape_string($connection,$customer_name);
     $email_id=mysqli_real_escape_string($connection,$email_id);
	     
      $phone_no=mysqli_real_escape_string($connection,$phone_no);
     $account_no=mysqli_real_escape_string($connection,$account_no);
	 $amount=mysqli_real_escape_string($connection,$amount);
	     
      $reciever_name=mysqli_real_escape_string($connection,$reciever_name);
     $bank_name=mysqli_real_escape_string($connection,$bank_name);
     

      

 
 

 
    $sql = "INSERT INTO  paymentt (customer_name,email_id,phone_no,account_no,amount,reciever_name,bank_name) 
	VALUES ('".$customer_name."','".$email_id."',
	'".$phone_no."','".$account_no."',
	'".$amount."','".$reciever_name."','".$bank_name."')";


    if ( mysqli_query($connection, $sql) ) {
        $result["error"] = false;
        $result["message"] = "Payment success";
		 echo json_encode($result);
        mysqli_close($connection);
    }
    
      
}   

       

    
?>

