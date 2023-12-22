import 'package:build_buddy_project/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

import 'Users_View_Contractor.dart';

class User_Add_Review extends StatefulWidget {
  const User_Add_Review({Key? key}) : super(key: key);

  @override
  _User_Add_ReviewState createState() => _User_Add_ReviewState();
}

class _User_Add_ReviewState extends State<User_Add_Review> {
  TextEditingController comments =TextEditingController();

  late bool status;
  late String message;

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
                  controller: comments,
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
              setState(() {
                Submit();
              });

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
  Future Submit() async {
    var APIURL = "http://$ip_address/Build_buddy_Php_files/Users/Customer_Add_Review.php";

    //json maping user entered details
    Map maped_data = {
      'comments': comments.text,
      'username' :username_user,
    };
    //send  data using http post to our php code
    http.Response reponse =
    await http.post(Uri.parse(APIURL), body: maped_data);

    //getting response from php code, here
    var data = jsonDecode(reponse.body);
    var responseMessage = data["message"];
    var responseError = data["error"];

    // print("DATA: ${data}");
    print(data);

    if (responseError) {
      setState(() {
        status = false;
        message = responseMessage;
      });
    } else {
      comments.clear();



      setState(() {
        status = true;
        message = responseMessage;
      });
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>User_View_Contracter()));

      Fluttertoast.showToast(
          msg: "Comment Added successfully!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.blueGrey);
    }
  }
}
