import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

import '../main.dart';

class user_payment extends StatefulWidget {
  const user_payment({Key? key}) : super(key: key);

  @override
  State<user_payment> createState() => _user_paymentState();
}

class _user_paymentState extends State<user_payment> {
  String? Receiver_type;

  TextEditingController namecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController phonecocontroller = TextEditingController();
  TextEditingController accnocontroller = TextEditingController();
  TextEditingController amountcontroller = TextEditingController();
  TextEditingController bankcontroller = TextEditingController();

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  late bool status;
  late String message;

  @override
  void initState() {
    setState(() {
      getAllCategory();
      getAllCategory_1();
    });
    namecontroller = TextEditingController(text: username_user);
    emailcontroller = TextEditingController(text: email_user);
    phonecocontroller = TextEditingController();
    accnocontroller = TextEditingController();
    amountcontroller = TextEditingController();
    bankcontroller = TextEditingController();
    status = false;
    message = "";

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Make A Payment"),
        backgroundColor: Colors.pink,
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                  child: Container(
                    height: 200,
                    width: 350,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      //  color: Colors.teal,
                      image: DecorationImage(
                          image: AssetImage("assets/user_images/payment.jpg"),
                          fit: BoxFit.cover),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25),
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
                        hintText: "Enter your name",
                        hintStyle: TextStyle(color: Colors.black),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                  ),
                ),

                SizedBox(height: 20),
                // ),
                Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                  child: TextFormField(
                    controller: emailcontroller ,
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
                      hintText: "Enter your email ",
                      hintStyle: TextStyle(color: Colors.black),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 20),
                Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                  child: TextFormField(
                    controller: phonecocontroller,
                    keyboardType: TextInputType.number,
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
                      hintText: "Enter your phone no",
                      hintStyle: TextStyle(color: Colors.black),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),


                SizedBox(height: 20),
                // ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                  child: TextFormField(
                    controller: accnocontroller,
                    keyboardType: TextInputType.number,
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
                      hintText: "Enter your account no",
                      hintStyle: TextStyle(color: Colors.black),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 20),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                  child: TextFormField(
                    controller: amountcontroller,
                    keyboardType: TextInputType.number,
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
                      hintText: "Enter your amount",
                      hintStyle: TextStyle(color: Colors.black),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                // Padding(
                //   padding:
                //       const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                //   child: DropdownButton<String>(
                //       underline: Container(),
                //       hint: Text("Select Receiver Type"),
                //       icon: const Icon(Icons.keyboard_arrow_down),
                //       isDense: true,
                //       isExpanded: true,
                //       items: <String>['Contracter', 'Real esteters']
                //           .map<DropdownMenuItem<String>>((String value) {
                //         return DropdownMenuItem<String>(
                //           value: value,
                //           child: Text(
                //             value,
                //             style: TextStyle(fontSize: 20),
                //           ),
                //         );
                //       }).toList(),
                //       value: Receiver_type,
                //       onChanged: (value) {
                //         setState(() {
                //           Receiver_type = value!;
                //           print(Receiver_type);
                //         });
                //       }),
                // ),
                SizedBox(height: 20),
                Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                  child: TextFormField(
                    controller: bankcontroller,
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
                      hintText: "Enter your bank name",
                      hintStyle: TextStyle(color: Colors.black),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                  child: DropdownButtonFormField(
                    hint: Text("Select receiver type"),
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        //<-- SEE HERE
                        borderSide: BorderSide(color: Colors.grey, width: 2),
                      ),
                      focusedBorder: OutlineInputBorder(
                        //<-- SEE HERE
                        borderSide: BorderSide(color: Colors.grey, width: 2),
                      ),
                      filled: true,
                      fillColor: Color(0xffe2e7ef),
                    ),
                    dropdownColor: Color(0xffe2e7ef),
                    // value: dropdownValue,
                    value: Receiver_type,
                    onChanged: (String? newValue) {
                      setState(() {
                        Receiver_type = newValue!;

                        SizedBox(
                          height: 5,
                        );
                      });
                    },
                    items: <String>['Contracter', 'Real esteters']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: TextStyle(fontSize: 20),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                //
                Receiver_type == 'Contracter'
                    ? Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 25, vertical: 10),
                        child: DropdownButtonFormField(
                          hint: Text("Select contracter name"),
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              //<-- SEE HERE
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 2),
                            ),
                            focusedBorder: OutlineInputBorder(
                              //<-- SEE HERE
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 2),
                            ),
                            filled: true,
                            fillColor: Color(0xffe2e7ef),
                          ),
                          dropdownColor: Color(0xffe2e7ef),
                          // value: dropdownValue,
                          value: Contra_selectedValue,
                          onChanged: (String? newValue) {
                            setState(() {
                              Contra_selectedValue = newValue!;
                              selectedValue =Contra_selectedValue;

                              SizedBox(
                                height: 5,
                              );
                            });
                          },
                          items: contracter_username_List.map((username) {
                            return DropdownMenuItem<String>(
                                value: username['username'],
                                child: Text(username['username']));
                          }).toList(),
                        ),
                      )
                    : Receiver_type == 'Real esteters'
                        ? Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 25, vertical: 10),
                            child: DropdownButtonFormField(
                              hint: Text("Select Real esteters name"),
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  //<-- SEE HERE
                                  borderSide:
                                      BorderSide(color: Colors.grey, width: 2),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  //<-- SEE HERE
                                  borderSide:
                                      BorderSide(color: Colors.grey, width: 2),
                                ),
                                filled: true,
                                fillColor: Color(0xffe2e7ef),
                              ),
                              dropdownColor: Color(0xffe2e7ef),
                              // value: dropdownValue,
                              value: real_selectedValue,
                              onChanged: (String? newValue) {
                                setState(() {
                                  real_selectedValue = newValue!;
                                  selectedValue =real_selectedValue;

                                  SizedBox(
                                    height: 5,
                                  );
                                });
                              },
                              items: Real_esteters_usrname.map((username) {
                                return DropdownMenuItem<String>(
                                    value: username['username'],
                                    child: Text(username['username']));
                              }).toList(),
                            ),
                          )
                        : Text("* select receiver type first",style: TextStyle(fontSize: 20,color: Colors.red),),

               // Text( "${selectedValue}" ),

                SizedBox(height: 30,),



                SizedBox(
                  height: MediaQuery.of(context).size.height / 15,
                  width: MediaQuery.of(context).size.width / 1.3,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.cyan.shade400,
                    ),
                    onPressed: ()
                    //async
                    {
                      setState(() {
                        Submit();
                      });



                    },
                    child: Text(
                      'Pay',
                      style: TextStyle(color: Colors.white, fontSize: 35),
                    ),
                  ),
                ),
            Text(
                    status ? message : message,
                    style: TextStyle(color: Colors.red.shade900),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String? Contra_selectedValue;
  String? real_selectedValue;

  String? selectedValue;

  List contracter_username_List = [];

  List Real_esteters_usrname = [];

  Future getAllCategory() async {
    var url =
        "http://$ip_address/Build_buddy_Php_files/Contracters/Display__contracter_username.php";
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      setState(() {
        contracter_username_List = jsonData;
        //  contracter_ = contracter_username_List;
      });
    }

    print(contracter_username_List);
  }

  Future getAllCategory_1() async {
    var url =
        "http://$ip_address/Build_buddy_Php_files/Real%20Estaters/Display__real_esteters_username.php";
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      setState(() {
        Real_esteters_usrname = jsonData;
        //
        //   real_username_List =  Real_esteters_usrname.map((username) {
        //     return username['username'];
        //   }).toList();
        //   print("new List test ${real_username_List}");
      });
    }

    print(Real_esteters_usrname);
  }

  Future Submit() async {
    var APIURL = "http://$ip_address/Build_buddy_Php_files/Users/paymentt.php";

    //json maping user entered details
    Map maped_data = {
      'customer_name': namecontroller.text,
      'email_id': emailcontroller.text,
      'phone_no': phonecocontroller.text,
      'account_no': accnocontroller.text,
      'amount': amountcontroller.text,
      'reciever_name': selectedValue,
      'bank_name': bankcontroller.text,
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
      namecontroller.clear();
      phonecocontroller.clear();
      emailcontroller.clear();
      accnocontroller.clear();


      setState(() {
        status = true;
        message = responseMessage;
      });
      Fluttertoast.showToast(
          msg: "Payment successful",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.blueGrey);
    }
  }
}
