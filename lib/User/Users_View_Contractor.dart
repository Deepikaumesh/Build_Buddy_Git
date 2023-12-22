import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:http/http.dart' as http;

import '../main.dart';
import 'User_view_contracter_Detail_Page_with_their_workers.dart';



// import 'Edit_data.dart';

//Creating a class user to store the data;
class User_contracter_model {
  // final String id;
  final String id;
  final String username;
  final String email;
  final String phone;
  final String password;
  final String report_status;
  final String place;
  final String experience;
  final String image;

  User_contracter_model({
    // required this.id,
    required this.id,
    required this.username,
    required this.email,
    required this.phone,
    required this.password,
    required this.report_status,
    required this.place,
    required this.experience,
    required this.image,
  });
}

class User_View_Contracter extends StatefulWidget {
  @override
  _User_View_ContracterState createState() => _User_View_ContracterState();
}

class _User_View_ContracterState extends State<User_View_Contracter> {
//Applying get request.

  Future<List<User_contracter_model>> getRequest() async {
    //replace your restFull API here.
    String url =
        "http://$ip_address/Build_buddy_Php_files/Admin/Admin_View_Contractors.php";

    final response = await http.get(Uri.parse(url));

    var responseData = json.decode(response.body);

    //Creating a list to store input data;
    List<User_contracter_model> users = [];
    for (var singleUser in responseData) {
      User_contracter_model user = User_contracter_model(
        //id:  singleUser["id"].toString(),
        id: singleUser["id"].toString(),
        username: singleUser["username"].toString(),
        email: singleUser["email"].toString(),
        phone: singleUser["phone"].toString(),
        password: singleUser["password"].toString(),
        report_status: singleUser["report_status"].toString(),
        place: singleUser["place"].toString(),
        experience: singleUser["experience"].toString(),
        image: singleUser["image"].toString(),
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
            "Display Contracter Data",
            style: GoogleFonts.prompt(fontSize: 22, color: Colors.blueGrey),
          ),
        ),
        body: Scaffold(
          body: FutureBuilder<List>(
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



                    return Padding(
                      padding: EdgeInsets.all(10),
                      child: InkWell(
                        onTap: (){

                          setState(() {
                            contracter_name = snapshot.data![index].username;
                            print(contracter_name);
                          });
Navigator.push(context, MaterialPageRoute(builder: (context)=>User_view_contracter_Detail_page_with_their_workers(datapass: snapshot.data![index],)));

                        },
                        child: Container(
                          height: 120,
                          decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(width: 2,color: Colors.teal.shade100)),
                          margin: EdgeInsets.symmetric(vertical: 10),

                          child: Padding(
                            padding: const EdgeInsets.only(left: 30, right: 30),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  (snapshot.data![index].username),
                                  style: GoogleFonts.lora(
                                      fontSize: 20,
                                      color: Colors.teal),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(snapshot.data![index].email),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(snapshot.data![index].phone),
                                SizedBox(
                                  height: 5,
                                ),
                              //  Text(snapshot.data![index].place),


                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: [
                                      snapshot.data![index].report_status == "No" ? SizedBox(height: 1,):

                                      //Text("Reported Account"),



                                      Text("Reported Account",style: TextStyle(color: Colors.red.shade700),),
                                      SizedBox(
                                        width: 250,
                                      ),


                                    ],
                                  ),
                                ),
                                // Divider(
                                //   thickness: 2,
                                //   color: Colors.grey,
                                // )
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  })
                  : Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ),
    );
  }

  Future<void> delrecord(String id) async {
    String url =
        "http://$ip_address/Build_buddy_Php_files/Admin/Admin_Contracters_delete_data.php";
    var res = await http.post(Uri.parse(url), body: {
      "id": id,
    });
    var resoponse = jsonDecode(res.body);
    if (resoponse["success"] == "true") {
      setState(() {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => User_View_Contracter()));
      });
      print("success");
    }
  }
}