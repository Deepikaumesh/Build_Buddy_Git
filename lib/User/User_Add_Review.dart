import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class User_Add_Review extends StatefulWidget {
  const User_Add_Review({Key? key}) : super(key: key);

  @override
  _User_Add_ReviewState createState() => _User_Add_ReviewState();
}

class _User_Add_ReviewState extends State<User_Add_Review> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: const Text("Type Your Comments here!.."),
        content: SizedBox(
            height: 300,
            child:    Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: TextFormField(
                  maxLines: 20,
                 // controller: _confirmpassword,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    //label: Text("comments"),

                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        // color: Colors.grey[400],
                        color: Colors.grey.shade500,
                      ),
                    ),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey.shade500,
                        )),
                  ),
                )),),
        actions: <Widget>[
          TextButton(
            onPressed: () {

            },
            child: Container(
              color: Colors.black,
              padding: const EdgeInsets.all(14),
              child: const Text("okay"),
            ),
          ),
        ],
    );
  }
  //
  // Future Submit() async {
  //   var APIURL = "http://$ip_address/Build_buddy_Php_files/Users/paymentt.php";
  //
  //   //json maping user entered details
  //   Map maped_data = {
  //     'customer_name': namecontroller.text,
  //     'email_id': emailcontroller.text,
  //     'phone_no': phonecocontroller.text,
  //     'account_no': accnocontroller.text,
  //     'amount': amountcontroller.text,
  //     'reciever_name': selectedValue,
  //     'bank_name': bankcontroller.text,
  //   };
  //   //send  data using http post to our php code
  //   http.Response reponse =
  //   await http.post(Uri.parse(APIURL), body: maped_data);
  //
  //   //getting response from php code, here
  //   var data = jsonDecode(reponse.body);
  //   var responseMessage = data["message"];
  //   var responseError = data["error"];
  //
  //   // print("DATA: ${data}");
  //   print(data);
  //
  //   if (responseError) {
  //     setState(() {
  //       status = false;
  //       message = responseMessage;
  //     });
  //   } else {
  //     namecontroller.clear();
  //     phonecocontroller.clear();
  //     emailcontroller.clear();
  //     accnocontroller.clear();
  //
  //
  //     setState(() {
  //       status = true;
  //       message = responseMessage;
  //     });
  //     Fluttertoast.showToast(
  //         msg: "Payment successful",
  //         toastLength: Toast.LENGTH_SHORT,
  //         gravity: ToastGravity.CENTER,
  //         timeInSecForIosWeb: 1,
  //         backgroundColor: Colors.blueGrey);
  //   }
  // }
}
