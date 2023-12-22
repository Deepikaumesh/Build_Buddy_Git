import 'package:build_buddy_project/contractors/workers/Display_contractor_worker_profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../Main_Screen/privacy_and_policy.dart';
import '../Main_Screen/about_us.dart';
import '../main.dart';
import 'Contracter_Profile_update_Display_Page.dart';
import 'Display_contractor_user.dart';
import 'Display_customer_requirements.dart';
import 'display_contractor_payment.dart';
import 'workers/Add_worker.dart';
import 'Add_Profile.dart';
import 'Contractor_updation_main_page.dart';
import 'Contractors_Login_Page.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class User_contracter_model {
  // final String id;
  final String id;
  final String username;
  final String email;
  final String phone;
  final String password;
  final String report_status;

  User_contracter_model({
    // required this.id,
    required this.id,
    required this.username,
    required this.email,
    required this.phone,
    required this.password,
    required this.report_status,
  });
}



class Contracters_HomePage extends StatefulWidget {
  const Contracters_HomePage({Key? key}) : super(key: key);

  @override
  _Contracters_HomePageState createState() => _Contracters_HomePageState();
}

class _Contracters_HomePageState extends State<Contracters_HomePage> {



  Future<List<User_contracter_model>> getRequest() async {
    //replace your restFull API here.
    String url =
        "http://$ip_address/Build_buddy_Php_files/Contracters/Display__workers_profile.php";

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
      );

      //Adding user to the list.
      users.add(user);
    }
    return users;
  }


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Home Page"),
          bottom: TabBar(
            tabs: [
              Tab(
                text: 'Workers',
              ),
              Tab(
                text: 'Customers',
              ),
            ],
          ),
          backgroundColor: Colors.blueGrey.shade100,
          centerTitle: true,
          actions: [
            // IconButton(
            //     onPressed: () async {
            //       final SharedPreferences sharedpreferences =
            //           await SharedPreferences.getInstance();
            //       sharedpreferences.remove('contracter_id');
            //       Navigator.pushReplacement(
            //           context,
            //           MaterialPageRoute(
            //               builder: (context) => Contracters_Login_Page()));
            //     },
            //     icon: Icon(Icons.exit_to_app)),
          ],
          toolbarHeight: 90,
          elevation: 0,
        ),
        drawer: Drawer(
          child: ListView(
            padding: const EdgeInsets.all(0),
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blueGrey,
                ), //BoxDecoration
                child: UserAccountsDrawerHeader(
                  decoration: BoxDecoration(color: Colors.blueGrey),
                  // accountName: Text(
                  //   "Abhishek Mishra",
                  //   style: TextStyle(fontSize: 18),
                  // ),
                   accountEmail: Text(email_contracter),
                  currentAccountPictureSize: Size.square(50),
                  accountName: Text(username_contracter),
                ), //UserAccountDrawerHeader
              ), //DrawerHeader
              ListTile(
                leading: const Icon(Icons.person),
                title: const Text('View Profile '),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              Contracter_Profile_update_Display_Page()));

                  //Contracter_Profile_update_Display_Page
                                  },
              ),
              ListTile(
                leading: const Icon(Icons.person_add_alt_1_outlined),
                title: const Text(' update workers '),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              Display_contractor_worker_profile()));
                },
              ),
              ListTile(
                leading: const Icon(Icons.person_add_alt_1),
                title: const Text(' view customers '),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              Display_contractor_user()));
                },
              ),
              ListTile(
                leading: const Icon(Icons.person_add_alt_1),
                title: const Text(' view customer needs '),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              Display_customer_requirements()));
                },
              ),

              ListTile(
                leading: const Icon(Icons.monetization_on_outlined),
                title: const Text(' Payment History '),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              contractor_payment()));

                },
              ),
              ListTile(
                leading: const Icon(Icons.video_label),
                title: const Text(' Privacy & Policy '),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              privacy_and_policy()));
                },
              ),
              ListTile(
                leading: const Icon(Icons.info),
                title: const Text(' About Us '),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => about_us()));

                },
              ),
              ListTile(
                leading: const Icon(Icons.logout),
                title: const Text('LogOut'),
                onTap: () async {
                        final SharedPreferences sharedpreferences =
                        await SharedPreferences.getInstance();
                        sharedpreferences.remove('contracter_id');
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Contracters_Login_Page()));
                      },
              ),
        ],  ),
        ), //Drawer
        body: TabBarView(
          children: [
            Center(
                child: Column(
              children: [


                Flexible(
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



                            return Padding(
                              padding: EdgeInsets.all(10),
                              child: InkWell(
                                onTap: (){


                                },
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
                                      // SingleChildScrollView(
                                      //   scrollDirection: Axis.horizontal,
                                      //   child: Row(
                                      //     children: [
                                      //       snapshot.data![index].report_status == "No" ? SizedBox(height: 1,):
                                      //
                                      //
                                      //
                                      //
                                      //
                                      //       Row(
                                      //         children: [
                                      //           Text("Reported Account",style: TextStyle(color: Colors.red.shade700),),
                                      //           GestureDetector(
                                      //               onTap: () {
                                      //                 setState(() {
                                      //
                                      //                 });
                                      //
                                      //                 Fluttertoast.showToast(
                                      //                     msg: 'Data Deleted ',
                                      //                     toastLength: Toast.LENGTH_LONG,
                                      //                     gravity: ToastGravity.BOTTOM,
                                      //                     timeInSecForIosWeb: 1,
                                      //                     backgroundColor: Colors.blueGrey);
                                      //               },
                                      //               child: Icon(
                                      //                 Icons.delete,
                                      //                 color: Colors.red.shade900,
                                      //               )),
                                      //         ],
                                      //       ),
                                      //
                                      //       SizedBox(
                                      //         width: 250,
                                      //       ),
                                      //
                                      //
                                      //     ],
                                      //   ),
                                      // ),
                                      Divider(
                                        thickness: 2,
                                        color: Colors.grey,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          })
                          : Center(child: CircularProgressIndicator());
                    },
                  ),
                ),

    Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 40,
        vertical: 30,
      ),
      child: SizedBox(
        width: 330.0,
        height: 70.0,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            //  shape: StadiumBorder(),
            // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            backgroundColor: Colors.blueGrey.shade100,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 2,
                width: MediaQuery.of(context).size.width / 7,
                child: Container(
                  height: MediaQuery.of(context).size.height / 2,
                  width: MediaQuery.of(context).size.width / 7,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    // color: Colors.teal,
                    image: DecorationImage(
                        image: AssetImage(
                            "assets/contracter_images/contractors_updation.jpg"),
                        fit: BoxFit.contain),
                  ),
                ),
              ),
              Spacer(),
              // Text("----------------------------------"),
              Text(
                'Add Workers',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) =>
                        add_workers()));
          },
        ),

      ),
    ),

               // Text("${username_contracter}"),
                // Padding(
                //   padding: EdgeInsets.symmetric(
                //     horizontal: 40,
                //     vertical: 30,
                //   ),
                //   child: SizedBox(
                //     width: 330.0,
                //     height: 70.0,
                //     child: ElevatedButton(
                //       style: ElevatedButton.styleFrom(
                //         //  shape: StadiumBorder(),
                //         // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                //         backgroundColor: Colors.blueGrey.shade100,
                //       ),
                //       child: Row(
                //         mainAxisAlignment: MainAxisAlignment.start,
                //         children: [
                //           SizedBox(
                //             height: MediaQuery.of(context).size.height / 2,
                //             width: MediaQuery.of(context).size.width / 7,
                //             child: Container(
                //               height: MediaQuery.of(context).size.height / 2,
                //               width: MediaQuery.of(context).size.width / 7,
                //               decoration: BoxDecoration(
                //                 borderRadius: BorderRadius.circular(6),
                //                 // color: Colors.teal,
                //                 image: DecorationImage(
                //                     image: AssetImage(
                //                         "assets/contracter_images/contractors_updation.jpg"),
                //                     fit: BoxFit.contain),
                //               ),
                //             ),
                //           ),
                //           Spacer(),
                //           // Text("----------------------------------"),
                //           Text(
                //             'Update Workers',
                //             style: TextStyle(
                //               fontSize: 20,
                //               fontWeight: FontWeight.w700,
                //               color: Colors.black,
                //             ),
                //           ),
                //         ],
                //       ),
                //       onPressed: () {
                //         Navigator.push(
                //             context,
                //             MaterialPageRoute(
                //                 builder: (BuildContext context) =>
                //                     Contractors_updation_page()));
                //       },
                //     ),
                //
                //   ),
                // ),
              ],
            )),



            Center(child:
         Column(
           children: [
             Padding(
               padding: EdgeInsets.symmetric(
                 horizontal: 40,
                 vertical: 30,
               ),
               child: SizedBox(
                 width: 330.0,
                 height: 70.0,
                 child: ElevatedButton(
                   style: ElevatedButton.styleFrom(
                     //  shape: StadiumBorder(),
                     // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                     backgroundColor: Colors.blueGrey.shade100,
                   ),
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.start,
                     children: [
                       SizedBox(
                         height: MediaQuery.of(context).size.height / 2,
                         width: MediaQuery.of(context).size.width / 7,
                         child: Container(
                           height: MediaQuery.of(context).size.height / 2,
                           width: MediaQuery.of(context).size.width / 7,
                           decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(6),
                             // color: Colors.teal,
                             image: DecorationImage(
                                 image: AssetImage(
                                     "assets/contracter_images/contractors_updation.jpg"),
                                 fit: BoxFit.contain),
                           ),
                         ),
                       ),
                       Spacer(),

                       Text(
                         'Updation',
                         style: TextStyle(
                           fontSize: 20,
                           fontWeight: FontWeight.w700,
                           color: Colors.black,
                         ),
                       ),
                     ],
                   ),
                   onPressed: () {
                     Navigator.push(
                         context,
                         MaterialPageRoute(
                             builder: (BuildContext context) =>
                                 Contractors_updation_page()));
                   },
                 ),
               ),
             ),









            ],
            )
            ),
          ],
        ),
      ),
    );
  }
}
