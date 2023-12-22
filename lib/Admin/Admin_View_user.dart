//
//
// import 'dart:convert';
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// import '../main.dart';
// import 'package:http/http.dart' as http;
//
// class Admin_View_users extends StatefulWidget {
//   const Admin_View_users({Key? key}) : super(key: key);
//
//   @override
//   _Admin_View_usersState createState() => _Admin_View_usersState();
// }
//
// class _Admin_View_usersState extends State<Admin_View_users> {
//   Future<List> getData() async {
//     final response = await http.get(Uri.parse(
//         "http://$ip_address/Build_buddy_Php_files/Admin/Admin_View_user.php"));
//     return json.decode(response.body);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         elevation: 0,
//         automaticallyImplyLeading: false,
//         backgroundColor: Colors.white,
//         centerTitle: true,
//         title: Text(
//           "Display User Data",
//           style: GoogleFonts.prompt(fontSize: 22, color: Colors.blueGrey),
//         ),
//       ),
//       body:
//
//       FutureBuilder<List>(
//         future: getData(),
//         builder: (context, snapshot) {
//           if (snapshot.hasError)
//             Fluttertoast.showToast(
//                 msg: 'Error',
//                 toastLength: Toast.LENGTH_SHORT,
//                 gravity: ToastGravity.BOTTOM,
//                 timeInSecForIosWeb: 1,
//                 textColor: Colors.white,
//                 webPosition: 1,
//                 backgroundColor: Colors.blueGrey);
//
//           //   return snapshot.hasData ? Display_Data_Items(list: snapshot.data ?? [])  : Center(child: CircularProgressIndicator(),
//
//           return snapshot.hasData
//               ? ListView.builder(
//               itemCount: snapshot.data?.length,
//               itemBuilder: (context, index) {
//                 return Container(
//                   margin: EdgeInsets.symmetric(vertical: 10),
//                   child: Padding(
//                     padding: const EdgeInsets.only(left: 30,right: 30),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//
//
//                       children: [
//
//                         Text(
//                           (snapshot.data![index]["username"]),
//                           style: GoogleFonts.lora(
//                               fontSize: 20, color: Colors.pink.shade700),
//                         ),
//                         SizedBox(height: 5,),
//                         Text(snapshot.data![index]["email"]),
//                         SizedBox(height: 5,),
//                         Text(snapshot.data![index]["phone"]),
//                         SizedBox(height: 5,),
//
//                         Row(
//                           children: [
//                             GestureDetector(
//                                 onTap: (){
//
//                                   setState(() {
//
//
//                                     delrecord(snapshot.data![index].id);
//
//                                     Navigator.pushReplacement(
//                                         context,
//                                         MaterialPageRoute(
//                                             builder: (context) =>  Admin_View_users()));
//
//
//                                   });
//
//                                   Fluttertoast.showToast(
//                                       msg: 'Data Deleted ',
//                                       toastLength: Toast.LENGTH_LONG,
//                                       gravity: ToastGravity.BOTTOM,
//                                       timeInSecForIosWeb: 1,
//                                       backgroundColor: Colors.blueGrey);
//
//
//
//                                 },
//                                 child: Icon(Icons.delete,color: Colors.red.shade900,)),
//                             SizedBox(width: 250,),
//
//                             GestureDetector(
//                                 onTap: (){
//                                   setState(() {
//
//                                   });
//                                   // Navigator.pushReplacement(
//                                   //     context,
//                                   //     MaterialPageRoute(
//                                   //         builder: (context) =>  Edit_data(data_user: snapshot.data[index],)));
//                                 },
//
//                                 child: Icon(Icons.edit,color: Colors.green.shade900,)),
//                           ],
//                         ),
//                         Divider(thickness: 2,color: Colors.grey,)
//                       ],
//                     ),
//                   ),
//                 );
//               })
//               : Center(child: CircularProgressIndicator());
//         },
//       ),
//     );
//   }
//
//
//
//   Future<void> delrecord(String id) async {
//     String url =
//         "http://$ip_address/phpmyadmin/index.php?route=/sql&pos=0&db=buid_buddy_database&table=users";
//     var res = await http.post(Uri.parse(url), body: {
//       "id": id,
//     });
//     var resoponse = jsonDecode(res.body);
//     if (resoponse["success"] == "true") {
//       setState(() {
//         Navigator.pushReplacement(
//             context,
//             MaterialPageRoute(
//                 builder: (context) =>  Admin_View_users()));
//
//       });
//       print("success");
//     }
//   }
// }


//
// import 'dart:convert';
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// import '../main.dart';
// import 'package:http/http.dart' as http;
//
// class Admin_View_Real_Estaters extends StatefulWidget {
//   const Admin_View_Real_Estaters({Key? key}) : super(key: key);
//
//   @override
//   _Admin_View_Real_EstatersState createState() => _Admin_View_Real_EstatersState();
// }
//
// class _Admin_View_Real_EstatersState extends State<Admin_View_Real_Estaters> {
//   Future<List> getData() async {
//     final response = await http.get(Uri.parse(
//         "http://$ip_address/Build_buddy_Php_files/Admin/Admin_View_Real_Estaters.php"));
//     return json.decode(response.body);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         elevation: 0,
//         automaticallyImplyLeading: false,
//         backgroundColor: Colors.white,
//         centerTitle: true,
//         title: Text(
//           "Display Real Estaters Data",
//           style: GoogleFonts.prompt(fontSize: 22, color: Colors.blueGrey),
//         ),
//       ),
//       body:
//
//       FutureBuilder<List>(
//         future: getData(),
//         builder: (context, snapshot) {
//           if (snapshot.hasError)
//             Fluttertoast.showToast(
//                 msg: 'Error',
//                 toastLength: Toast.LENGTH_SHORT,
//                 gravity: ToastGravity.BOTTOM,
//                 timeInSecForIosWeb: 1,
//                 textColor: Colors.white,
//                 webPosition: 1,
//                 backgroundColor: Colors.blueGrey);
//
//           //   return snapshot.hasData ? Display_Data_Items(list: snapshot.data ?? [])  : Center(child: CircularProgressIndicator(),
//
//           return snapshot.hasData
//               ? ListView.builder(
//               itemCount: snapshot.data?.length,
//               itemBuilder: (context, index) {
//                 return Container(
//                   margin: EdgeInsets.symmetric(vertical: 10),
//                   child: Padding(
//                     padding: const EdgeInsets.only(left: 30,right: 30),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//
//
//                       children: [
//
//                         Text(
//                           (snapshot.data![index]["username"]),
//                           style: GoogleFonts.lora(
//                               fontSize: 20, color: Colors.pink.shade700),
//                         ),
//                         SizedBox(height: 5,),
//                         Text(snapshot.data![index]["email"]),
//                         SizedBox(height: 5,),
//                         Text(snapshot.data![index]["phone"]),
//                         SizedBox(height: 5,),
//
//                         Row(
//                           children: [
//                             GestureDetector(
//                                 onTap: (){
//
//                                   setState(() {
//
//
//                                     delrecord(snapshot.data![index].id);
//
//                                     Navigator.pushReplacement(
//                                         context,
//                                         MaterialPageRoute(
//                                             builder: (context) =>  Admin_View_Real_Estaters()));
//
//
//                                   });
//
//                                   Fluttertoast.showToast(
//                                       msg: 'Data Deleted ',
//                                       toastLength: Toast.LENGTH_LONG,
//                                       gravity: ToastGravity.BOTTOM,
//                                       timeInSecForIosWeb: 1,
//                                       backgroundColor: Colors.blueGrey);
//
//
//
//                                 },
//                                 child: Icon(Icons.delete,color: Colors.red.shade900,)),
//                             SizedBox(width: 250,),
//
//                             GestureDetector(
//                                 onTap: (){
//                                   setState(() {
//
//                                   });
//                                   // Navigator.pushReplacement(
//                                   //     context,
//                                   //     MaterialPageRoute(
//                                   //         builder: (context) =>  Edit_data(data_user: snapshot.data[index],)));
//                                 },
//
//                                 child: Icon(Icons.edit,color: Colors.green.shade900,)),
//                           ],
//                         ),
//                         Divider(thickness: 2,color: Colors.grey,)
//                       ],
//                     ),
//                   ),
//                 );
//               })
//               : Center(child: CircularProgressIndicator());
//         },
//       ),
//     );
//   }
//
//
//
//   Future<void> delrecord(String id) async {
//     String url =
//         "http://$ip_address/phpmyadmin/index.php?route=/sql&pos=0&db=buid_buddy_database&table=users";
//     var res = await http.post(Uri.parse(url), body: {
//       "id": id,
//     });
//     var resoponse = jsonDecode(res.body);
//     if (resoponse["success"] == "true") {
//       setState(() {
//         Navigator.pushReplacement(
//             context,
//             MaterialPageRoute(
//                 builder: (context) =>  Admin_View_Real_Estaters()));
//
//       });
//       print("success");
//     }
//   }
// }






import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:http/http.dart' as http;

import '../main.dart';
import 'Edit_data.dart';

//Creating a class user to store the data;
class Admin_User_model {
  // final String id;
  final String id;
  final String username;
  final String email;
  final String phone;
  final String password;

  Admin_User_model({
    // required this.id,
    required this.id,
    required this.username,
    required this.email,
    required this.phone,
    required this.password,
  });
}

class Admin_View_Users extends StatefulWidget {
  @override
  _Admin_View_UsersState createState() => _Admin_View_UsersState();
}

class _Admin_View_UsersState extends State<Admin_View_Users> {
//Applying get request.

  Future<List<Admin_User_model>> getRequest() async {
    //replace your restFull API here.
    String url = "http://$ip_address/Build_buddy_Php_files/Admin/Admin_View_user.php";

    final response = await http.get(Uri.parse(url));

    var responseData = json.decode(response.body);

    //Creating a list to store input data;
    List<Admin_User_model> users = [];
    for (var singleUser in responseData) {
      Admin_User_model user = Admin_User_model(
        //id:  singleUser["id"].toString(),
        id: singleUser["id"].toString(),
        username: singleUser["username"].toString(),
        email: singleUser["email"].toString(),
        phone:singleUser["phone"].toString(),
        password: singleUser["password"].toString(),
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
            "Display User Data",
            style: GoogleFonts.prompt(fontSize: 22, color: Colors.blueGrey),
          ),
        ),
        body: Scaffold(




          body:

          FutureBuilder<List>(
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
                                  fontSize: 20, color: Colors.pink.shade700),
                            ),
                            SizedBox(height: 5,),
                            Text(snapshot.data![index].email),
                            SizedBox(height: 5,),
                            Text(snapshot.data![index].phone),
                            SizedBox(height: 5,),


                            Divider(thickness: 2,color: Colors.grey,)
                          ],
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
        "http://$ip_address/Build_buddy_Php_files/Admin/Admin_Users_delete_data.php";
    var res = await http.post(Uri.parse(url), body: {
      "id": id,
    });
    var resoponse = jsonDecode(res.body);
    if (resoponse["success"] == "true") {
      setState(() {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) =>  Admin_View_Users()));

      });
      print("success");
    }
  }
}

