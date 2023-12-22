// import 'dart:convert';
// import 'package:flutter/material.dart';
//
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// import 'package:http/http.dart' as http;
//
// import '../main.dart';
// import 'Contracter_update.dart';
//
//
// //Creating a class user to store the data;
// class Contracter_profile_model {
//   // final String id;
//   final String id;
//   final String name;
//   final String place;
//   final String phone;
//   final String email;
//   final String experience;
//   final String image;
//
//   Contracter_profile_model({
//     required this.id,
//     required this.name,
//     required this.place,
//     required this.phone,
//     required this.email,
//     required this.experience,
//     required this.image,
//   });
// }
//
// class Display_contractor_user extends StatefulWidget {
//   @override
//   _Display_contractor_userState createState() => _Display_contractor_userState();
// }
//
// class _Display_contractor_userState extends State<Display_contractor_user> {
// //Applying get request.
//
//   Future<List<Contracter_profile_model>> getRequest() async {
//     //replace your restFull API here.
//     String url =
//         "http://$ip_address/Build_buddy_Php_files/Contracters/Display__Contractors_profile.php";
//
//     final response = await http.get(Uri.parse(url));
//
//     var responseData = json.decode(response.body);
//
//     //Creating a list to store input data;
//     List<Contracter_profile_model> users = [];
//     for (var singleUser in responseData) {
//       Contracter_profile_model user = Contracter_profile_model(
//         //id:  singleUser["id"].toString(),
//         id: singleUser["id"].toString(),
//         name: singleUser["name"].toString(),
//         place: singleUser["place"].toString(),
//         email: singleUser["email"].toString(),
//         phone: singleUser["phone"].toString(),
//         experience: singleUser["experience"].toString(),
//         image: singleUser["image"].toString(),
//
//       );
//
//       //Adding user to the list.
//       users.add(user);
//     }
//     return users;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: Colors.white,
//         appBar: AppBar(
//           elevation: 0,
//           automaticallyImplyLeading: false,
//           backgroundColor: Colors.white,
//           centerTitle: true,
//           title: Text(
//             "Display Contracter profile",
//               style: GoogleFonts.prompt(fontSize: 22, color: Colors.blueGrey),
//           ),
//         ),
//         body: Scaffold(
//           body: FutureBuilder<List>(
//             future: getRequest(),
//             builder: (context, snapshot) {
//               if (snapshot.hasError)
//                 Fluttertoast.showToast(
//                     msg: 'Error',
//                     toastLength: Toast.LENGTH_SHORT,
//                     gravity: ToastGravity.BOTTOM,
//                     timeInSecForIosWeb: 1,
//                     textColor: Colors.white,
//                     webPosition: 1,
//                     backgroundColor: Colors.blueGrey);
//
//
//
//               return snapshot.hasData
//                   ? ListView.builder(
//                   itemCount: snapshot.data?.length,
//                   itemBuilder: (context, index) {
//                     return Padding(
//                       padding: const EdgeInsets.all(10.0),
//                       child: Card(
//                         elevation: 5,
//                         child: ListTile(
//                           leading: InkWell(
//                               onTap: (){
//
//                                 Navigator.push(context, MaterialPageRoute(builder: (context)=>Contracter_Update(
//
//                                   data_user: snapshot.data![index],)));
//
//                               },
//                               child: Icon(Icons.edit)),
//
//                           title: Text(snapshot.data![index].name),
//                           subtitle: Text(snapshot.data![index].email),
//                           // trailing: Icon(Icons.delete),
//                           trailing: CircleAvatar(
//                               child: Image.network(snapshot.data![index].image)),
//                         ),
//                       ),
//                     );
//                   })
//                   : Center(child: CircularProgressIndicator());
//             },
//           ),
//         ),
//       ),
//     );
//   }
//
//   Future<void> delrecord(String id) async {
//     String url =
//         "http://$ip_address/Build_buddy_Php_files/Admin/Admin_Contracters_delete_data.php";
//     var res = await http.post(Uri.parse(url), body: {
//       "id": id,
//     });
//     var resoponse = jsonDecode(res.body);
//     if (resoponse["success"] == "true") {
//       setState(() {
//         Navigator.pushReplacement(context,
//             MaterialPageRoute(builder: (context) => Display_contractor_user()));
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
// import 'Edit_data.dart';

//Creating a class user to store the data;
class Customer_requirement_model {
  // final String id;
  final String id;
  final String name;
  final String place;
  final String work;
  final String category;
  final String image;

  Customer_requirement_model({
    // required this.id,
    required this.id,
    required this.name,
    required this.place,
    required this.work,
    required this.category,
    required this.image,
  });
}

class Display_customer_requirements extends StatefulWidget {
  @override
  _Display_customer_requirementsState createState() =>
      _Display_customer_requirementsState();
}

class _Display_customer_requirementsState
    extends State<Display_customer_requirements> {
//Applying get request.

  Future<List<Customer_requirement_model>> getRequest() async {
    //replace your restFull API here.
    String url =
        "http://$ip_address/Build_buddy_Php_files/Contracters/view_Customer_requirement.php";

    final response = await http.get(Uri.parse(url));

    var responseData = json.decode(response.body);

    //Creating a list to store input data;
    List<Customer_requirement_model> users = [];
    for (var singleUser in responseData) {
      Customer_requirement_model user = Customer_requirement_model(
        //id:  singleUser["id"].toString(),
        id: singleUser["id"].toString(),
        name: singleUser["name"].toString(),
        place: singleUser["place"].toString(),
        work: singleUser["work"].toString(),
        category: singleUser["category"].toString(),
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
            "Customer  needs",
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
                        return Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 30, right: 30),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      ("Name:"),
                                      style: GoogleFonts.lora(
                                          fontSize: 20,
                                          color: Colors.orange.shade900),
                                    ),
                                    Text(
                                      (snapshot.data![index].name),
                                      style: GoogleFonts.lora(
                                          fontSize: 20, color: Colors.blue),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      ("Place:"),
                                      style: GoogleFonts.lora(
                                          fontSize: 20,
                                          color: Colors.orange.shade900),
                                    ),
                                    Text(
                                      (snapshot.data![index].place),
                                      style: GoogleFonts.lora(
                                          fontSize: 20, color: Colors.blue),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      ("Work:"),
                                      style: GoogleFonts.lora(
                                          fontSize: 20,
                                          color: Colors.orange.shade900),
                                    ),
                                    Text(
                                      snapshot.data![index].work,
                                      style: GoogleFonts.lora(
                                          fontSize: 20, color: Colors.blue),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      ("Category:"),
                                      style: GoogleFonts.lora(
                                          fontSize: 20,
                                          color: Colors.orange.shade900),
                                    ),
                                    Text(
                                      snapshot.data![index].category,
                                      style: GoogleFonts.lora(
                                          fontSize: 20, color: Colors.blue),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Divider(
                                  thickness: 2,
                                  color: Colors.grey,
                                )
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
}
