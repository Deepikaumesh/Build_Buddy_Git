import 'dart:convert';

import 'package:build_buddy_project/contractors/Contractors_Login_Page.dart';
import 'package:build_buddy_project/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;




class Contractor_Create_Profile extends StatefulWidget {
  const Contractor_Create_Profile({Key? key}) : super(key: key);

  @override
  _Contractor_Create_ProfileState createState() => _Contractor_Create_ProfileState();
}

class _Contractor_Create_ProfileState extends State<Contractor_Create_Profile> {

  TextEditingController category = TextEditingController();

  TextEditingController place = TextEditingController();

  TextEditingController work = TextEditingController();

  TextEditingController image = TextEditingController();
  //
  // TextEditingController _experience_in_years = TextEditingController();
  //
  // TextEditingController _description = TextEditingController();


  late bool status;

  late String message;

  @override
  void initState() {
    category = TextEditingController();
    place = TextEditingController();
    work = TextEditingController();
    image = TextEditingController();
    // _experience_in_years = TextEditingController();
    // _description = TextEditingController(text: "No");


    status = false;
    message = "";

    super.initState();
  }

  final GlobalKey<FormState> formkey = GlobalKey<FormState>();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          child: Form(
            key: formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Complete Your Profile",
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
                Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 40,
                    ),
                    child: TextFormField(
                      controller: category,
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter your name";
                        }
                        return null;
                      },
                      onSaved: (name) {},
                      obscureText: false,
                      decoration: InputDecoration(
                        label: Text("name"),
                        contentPadding:
                        EdgeInsets.symmetric(vertical: 0, horizontal: 10),
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
                    )),
                // Padding(
                //     padding: EdgeInsets.symmetric(
                //       horizontal: 40,
                //     ),
                //     child: TextFormField(
                //       controller: place,
                //       keyboardType: TextInputType.text,
                //       validator: (value) {
                //         if (value!.isEmpty) {
                //           return "Please enter  email";
                //         }
                //         if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                //             .hasMatch(value)) {
                //           return "Please enter a valid email";
                //         }
                //         return null;
                //       },
                //       onSaved: (email) {},
                //       obscureText: false,
                //       decoration: InputDecoration(
                //         label: Text("email"),
                //         contentPadding:
                //         EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                //         enabledBorder: OutlineInputBorder(
                //           borderSide: BorderSide(
                //             // color: Colors.grey[400],
                //             color: Colors.grey.shade500,
                //           ),
                //         ),
                //         border: OutlineInputBorder(
                //             borderSide: BorderSide(
                //               color: Colors.grey.shade500,
                //             )),
                //       ),
                //     )),
                Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 40,
                    ),
                    child: TextFormField(
                      controller: place,
                      keyboardType: TextInputType.phone,
                      validator: (value) {
                        if (value!.isEmpty && value!.length == 10) {
                          return "Please enter phone number";
                        }
                        return null;
                      },
                      onSaved: (name) {},
                      obscureText: false,
                      decoration: InputDecoration(
                        label: Text("place"),
                        contentPadding:
                        EdgeInsets.symmetric(vertical: 0, horizontal: 10),
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
                    )),
                Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 40,
                    ),
                    child: TextFormField(
                      controller: work,
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter the place";
                        }
                        return null;
                      },
                      onSaved: (name) {},
                      obscureText: true,
                      decoration: InputDecoration(
                        label: Text("place"),
                        contentPadding:
                        EdgeInsets.symmetric(vertical: 0, horizontal: 10),
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
                    )),

                SizedBox(
                  height: MediaQuery.of(context).size.height / 15,
                  width: MediaQuery.of(context).size.width / 1.3,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red.shade900,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                    ),
                    onPressed: () {
                      Fluttertoast.showToast(
                          msg: 'Profile Created Successfully ! ',
                          toastLength: Toast.LENGTH_LONG,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.blueGrey);
                      if (formkey.currentState!.validate()) {
                        setState(() {

                          Registration();
                        });
                        category.clear();
                        place.clear();
                        work.clear();
                      }
                    },
                    child: Text(
                      'Submit',
                      style: TextStyle(color: Colors.white, fontSize: 35),
                    ),
                  ),
                ),


              ],
            ),

            // ],
          ),
        ),
      ),
    );
  }

  Future Registration() async {
    var APIURL = "http://$ip_address/Build_buddy_Php_files/Users/user_requirement.php";

    //json maping user entered details
    Map mapeddate = {
      'category': category.text,
      'work': work.text,
      // 'phone': _phone.text,
      'place': place.text,
      // 'experience_in_years':_experience_in_years.text,
      // 'description': _description.text,
    };
    //send  data using http post to our php code
    http.Response reponse = await http.post(Uri.parse(APIURL), body: mapeddate);

    //getting response from php code, here
    var data = jsonDecode(reponse.body);
    var responseMessage = data["message"];
    var responseError = data["error"];
    print("DATA: ${data}");
    if (responseError) {
      setState(() {
        status = false;
        message = responseMessage;
      });
      Fluttertoast.showToast(
          msg: 'email and password already exists try another! ',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          textColor: Colors.white,
          webPosition: 1,
          backgroundColor: Colors.blueGrey);
    } else {
      category.clear();
     work.clear();
      // phone.clear();
      place.clear();
      // _experience_in_years.clear();
      // _description.clear();

      setState(() {
        status = true;
        message = responseMessage;
      });

      Fluttertoast.showToast(
          msg: 'Profile Created S-uccessfully ',
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.blueGrey);
    }

    print("DATA: ${data}");
  }
}