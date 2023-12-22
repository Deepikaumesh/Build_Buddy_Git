import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:http/http.dart' as http;

import '../main.dart';
import 'Admin_Searchbar_RS.dart';
import 'Edit_data.dart';

//Creating a class user to store the data;
class Real_Estaters_model {
  // final String id;
  final String id;
  final String username;
  final String email;
  final String phone;
  final String password;
  final String report_status;

  Real_Estaters_model({
    // required this.id,
    required this.id,
    required this.username,
    required this.email,
    required this.phone,
    required this.password,
    required this.report_status,
  });
}

class Admin_View_Real_Esters extends StatefulWidget {
  @override
  _Admin_View_Real_EstersState createState() => _Admin_View_Real_EstersState();
}

class _Admin_View_Real_EstersState extends State<Admin_View_Real_Esters> {
//Applying get request.

  Future<List<Real_Estaters_model>> getRequest() async {
    //replace your restFull API here.
    String url = "http://$ip_address/Build_buddy_Php_files/Admin/Admin_View_Real_Estaters.php";

    final response = await http.get(Uri.parse(url));

    var responseData = json.decode(response.body);

    //Creating a list to store input data;
    List<Real_Estaters_model> users = [];
    for (var singleUser in responseData) {
      Real_Estaters_model user = Real_Estaters_model(
        //id:  singleUser["id"].toString(),
        id: singleUser["id"].toString(),
        username: singleUser["username"].toString(),
        email: singleUser["email"].toString(),
        phone:singleUser["phone"].toString(),
        password: singleUser["password"].toString(),
        report_status: singleUser["report_status"].toString(),
      );

      //Adding user to the list.
      users.add(user);
    }
    return users;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            "Display Real Estaters Data",
            style: GoogleFonts.prompt(fontSize: 22, color: Colors.blueGrey),
          ),
        ),
        body: Column(
         children:[

           Admin_Searchbar_RS(),

           Expanded(
        child: FutureBuilder<List>(
            future: getRequest(),
            builder: (context, snapshot) {
              if (snapshot.hasError)
                Fluttertoast.showToast(
                    msg: 'Error',
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    textColor: Colors.white,
                    webPosition: 1,
                    backgroundColor: Colors.blueGrey);

              //   return snapshot.hasData ? Display_Data_Items(list: snapshot.data ?? [])  : Center(child: CircularProgressIndicator(),

              return snapshot.hasData
                  ? ListView.builder(
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 30,right: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,


                          children: [

                            Text(
                              (snapshot.data![index].username),
                              style: GoogleFonts.lora(
                                  fontSize: 20, color: Colors.blue),
                            ),
                            SizedBox(height: 5,),
                            Text(snapshot.data![index].email),
                            SizedBox(height: 5,),
                            Text(snapshot.data![index].phone),
                            SizedBox(height: 5,),

                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  snapshot.data![index].report_status == "No" ? SizedBox(height: 1,):

                                  //Text("Reported Account"),



                                  Row(
                                    children: [
                                      Text("Reported Account",style: TextStyle(color: Colors.red.shade700),),
                                      GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              delrecord(snapshot.data![index].id);

                                              Navigator.pushReplacement(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          Admin_View_Real_Esters()));
                                            });

                                            Fluttertoast.showToast(
                                                msg: 'Data Deleted ',
                                                toastLength: Toast.LENGTH_LONG,
                                                gravity: ToastGravity.BOTTOM,
                                                timeInSecForIosWeb: 1,
                                                backgroundColor: Colors.blueGrey);
                                          },
                                          child: Icon(
                                            Icons.delete,
                                            color: Colors.red.shade900,
                                          )),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 250,
                                  ),

                                ],
                              ),
                            ),


                            Divider(thickness: 2,color: Colors.grey,)
                          ],
                        ),
                      ),
                    );
                  })
                  : Center(child: CircularProgressIndicator());
            }),
           ),
         ],
        ),
      ),
    );
  }

  Future<void> delrecord(String id) async {
    String url =
        "http://$ip_address/Build_buddy_Php_files/Admin/Admin_Real_esteters_delete_data.php";
    var res = await http.post(Uri.parse(url), body: {
      "id": id,
    });
    var resoponse = jsonDecode(res.body);
    if (resoponse["success"] == "true") {
      setState(() {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) =>  Admin_View_Real_Esters()));

      });
      print("success");
    }
  }
}

