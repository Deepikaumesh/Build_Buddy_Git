import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

import '../../main.dart';




class add_workers extends StatefulWidget {
  const add_workers({Key? key}) : super(key: key);

  @override
  State<add_workers> createState() => _add_workersState();
}

class _add_workersState extends State<add_workers> {

  TextEditingController namecontroller = TextEditingController();
  TextEditingController agecontroller = TextEditingController();
  TextEditingController placecontroller = TextEditingController();
  TextEditingController experiencecontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController descriptioncontroller = TextEditingController();


  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  late bool status;
  late String message;

  @override
  void initState() {
    namecontroller = TextEditingController();
    agecontroller = TextEditingController();
    placecontroller = TextEditingController();
    experiencecontroller = TextEditingController();
    phonecontroller = TextEditingController();
    emailcontroller = TextEditingController();
    descriptioncontroller = TextEditingController();


    status = false;
    message = "";

    super.initState();
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ADD WORKERS"),
        backgroundColor: Colors.grey,
        centerTitle: true,

      ),
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key:_formkey,
            child: Column(
              children: [

                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 25,vertical: 20),
                  child: TextFormField(
                    controller: namecontroller,
                    keyboardType: TextInputType.text,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                        ),
                        hintText: "Enter name",
                        hintStyle: TextStyle(color: Colors.black),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                  ),
                ),
                // SizedBox(height:20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 20),
                  child: TextFormField(
                    controller:agecontroller,
                    keyboardType: TextInputType.text,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                        ),
                        hintText: "Enter age",
                        hintStyle: TextStyle(color: Colors.black),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                  ),
                ),


                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 20),
                  child: TextFormField(
                    controller:placecontroller,
                    keyboardType: TextInputType.text,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                        ),
                        hintText: "Enter place",
                        hintStyle: TextStyle(color: Colors.black),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 20),
                  child: TextFormField(
                    controller:experiencecontroller,
                    keyboardType: TextInputType.text,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                        ),
                        hintText: "Enter experience",
                        hintStyle: TextStyle(color: Colors.black),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 20),
                  child: TextFormField(
                    controller:phonecontroller,
                    keyboardType: TextInputType.text,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                        ),
                        hintText: "Enter phone",
                        hintStyle: TextStyle(color: Colors.black),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 20),
                  child: TextFormField(
                    controller:emailcontroller,
                    keyboardType: TextInputType.text,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                        ),
                        hintText: "Enter email",
                        hintStyle: TextStyle(color: Colors.black),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                  ),
                ),


                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 20),
                  child: TextFormField(
                    controller:descriptioncontroller,
                    keyboardType: TextInputType.text,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                        ),
                        hintText: "Enter description",
                        hintStyle: TextStyle(color: Colors.black),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                  ),
                ),


                SizedBox(
                  height: 20,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Submit();
                        namecontroller.clear();
                        agecontroller.clear();
                        agecontroller.clear();
                        placecontroller.clear();
                        experiencecontroller.clear();
                        phonecontroller.clear();
                        descriptioncontroller.clear();
                        emailcontroller.clear();


                      },
                      child: Text(
                        'Submit',
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),

                    ),
                  //  Text(status ? message : message,style: TextStyle(color: Colors.red.shade900),),


                  ],
                )

              ],
            ),
          ),
        ),

      ),

    );
  }
  Future Submit() async {
    var APIURL =
        "http://$ip_address/Build_buddy_Php_files/Contracters/Workers_details.php";


    //json maping user entered details
    Map maped_data = {
      'username': namecontroller.text,
      'age': agecontroller.text,
      'place': placecontroller.text,
      'experience': experiencecontroller.text,
      'phone': phonecontroller.text,
      'email': emailcontroller.text,
      'description': descriptioncontroller.text,
      'related_contracter':username_contracter,

    };
    //send  data using http post to our php code
    http.Response reponse = await http.post(Uri.parse(APIURL), body: maped_data);

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
      namecontroller.clear();
      agecontroller.clear();

      setState(() {
        status = true;
        message = responseMessage;
      });
      Fluttertoast.showToast(
          msg: "send successfully",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.blueGrey);
    }
  }

}
