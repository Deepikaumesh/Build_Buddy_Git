import 'package:build_buddy_project/User/user_payment.dart';
import 'package:build_buddy_project/User/user_requirement.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../Admin/Admin-Login_Page.dart';
import '../Admin/Admin_View_Real_Estaters.dart';
import '../Admin/Admin_view_Contracter.dart';
import '../Main_Screen/about_us.dart';
import '../Main_Screen/privacy_and_policy.dart';
import '../drop_test2.dart';
import '../dropdown_test.dart';
import '../main.dart';
import 'User_Profile_update_Display_Page.dart';
import 'user_payment_2.dart';



import '../final_test.dart';
import '../mul_greeks_folks.dart';
import '../mul_third.dart';
import '../test4.dart';
import 'User_Veiw_Real_Estators.dart';
import 'Users_Login_Page.dart';


// class Users_HomePage extends StatefulWidget {
//   const Users_HomePage({Key? key}) : super(key: key);
//
//   @override
//   _Users_HomePageState createState() => _Users_HomePageState();
// }
//
// class _Users_HomePageState extends State<Users_HomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Home Page"),
//       ),
//       body: Center(
//         child: Column(
//           children: [
//             SizedBox(
//               height: 50,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 Text("Logout"),
//                 IconButton(
//                     onPressed: () async {
//                       final SharedPreferences sharedpreferences =
//                       await SharedPreferences.getInstance();
//                       sharedpreferences.remove('users_id');
//                       Navigator.pushReplacement(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => Users_Login_Page()));
//                     },
//                     icon: Icon(Icons.exit_to_app)),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Users_View_Contractor.dart';

// import 'package:shared_preferences/shared_preferences.dart';
//
// import 'Admin-Login_Page.dart';
// import 'Admin_View_Real_Estaters.dart';
// import 'Admin_View_user.dart';
// import 'Admin_view_Contracter.dart';
// import 'Display_Data.dart';
// import '../contractors/workers/Add_worker.dart';

class Users_Home_Page extends StatefulWidget {
  const Users_Home_Page({Key? key}) : super(key: key);

  @override
  _Users_Home_PageState createState() => _Users_Home_PageState();
}

class _Users_Home_PageState extends State<Users_Home_Page> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey.shade100,
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () async {
                final SharedPreferences sharedpreferences =
                    await SharedPreferences.getInstance();
                sharedpreferences.remove('users');
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => Users_Login_Page()));
              },
              icon: Icon(Icons.exit_to_app)),
        ],
        toolbarHeight: 90,
        elevation: 0,

        title: Text(
          "Home Page",

          style: GoogleFonts.cookie(color: Colors.blueGrey.shade900, fontSize: 50),
        ),
      ),
      backgroundColor: Colors.blueGrey.shade100,
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: ListView(
          padding: const EdgeInsets.all(0),
          children: [

      //   DrawerHeader(
      //   decoration: BoxDecoration(
      //   color: Colors.blueGrey,
      //   ), //BoxDecoration
      //   child: UserAccountsDrawerHeader(
      //     decoration: BoxDecoration(color: Colors.blueGrey),
      //     // accountName: Text(
      //     //   "Abhishek Mishra",
      //     //   style: TextStyle(fontSize: 18),
      //     // ),
      //     // accountEmail: Text(email_contracter),
      //     currentAccountPictureSize: Size.square(50),
      //     accountName: Text(username_contracter),
      //   ), //UserAccountDrawerHeader
      // ),
      //       ListTile(
      //         // leading: const Icon(Icons.person),
      //         title: const Text(' '),
      //         onTap: () {
      //         },
      //       ),

            SizedBox(height: 70,),

            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Edit Profile '),
              onTap: () {

                Navigator.push(context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            User_Profile_update_Display_Page()));


                //Contractor_worker_update_Display_Page
              },
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Requirement '),
              onTap: () {

                Navigator.push(context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            user_requirement()));


                //Contractor_worker_update_Display_Page
              },
            ),
                        ListTile(
                          leading: const Icon(Icons.person_add_alt_1_outlined),
                          title: const Text(' Customer service '),
                          onTap: () {

                            showDialog(
                              context: context,
                              builder: (ctx) => AlertDialog(
                                title: const Text("Customer Service"),
                                content: const Text("For your queries contact us :             Phone - 1234567891 , Email - buildbuddy@gmail.com"),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(ctx).pop();
                                    },
                                    child: Container(
                                      color: Colors.black,
                                      padding: const EdgeInsets.all(14),
                                      child: const Text("okay"),
                                    ),
                                  ),
                                ],
                              ),
                            );

                          },
                        ),
                        // ListTile(
                        //   leading: const Icon(Icons.person_add_alt_1),
                        //   title: const Text(' My transactions '),
                        //   onTap: () {
                        //     Navigator.push(
                        //         context,
                        //         MaterialPageRoute(
                        //             builder: (BuildContext context) =>
                        //                 Display_contractor_user()));
                        //   },
                        // ),
                        ListTile(
                          leading: const Icon(Icons.monetization_on_outlined),
                          title: const Text(' Make a transaction '),
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        user_payment()));

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
                                  sharedpreferences.remove('user_id');
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Users_Login_Page()));
                                },
                        ),
                  ],  ),
                  ),








      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Text(
                "Whom are you looking for ?",
                style: GoogleFonts.courgette(fontSize: 19),
              ),
              SizedBox(height: 10,),

              InkWell(
                onTap: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => User_View_Contracter()));
                },
                child: CircleAvatar(
                  radius: 140,
                  backgroundImage: AssetImage("assets/user_images/User_Contractor.jpg"),
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 220),
                    child: Text("Contracters",style: GoogleFonts.courgette(
                        fontSize: 25, color: Colors.blueGrey.shade900),),
                  ),
                ),
              ),
             SizedBox(height: 30,),
              // InkWell(
              //   onTap: () {
              //     Navigator.push(
              //         context,
              //         MaterialPageRoute(
              //             builder: (context) => Admin_View_Contracter()));
              //   },
              //   child: Padding(
              //     padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              //     child: Card(
              //       clipBehavior: Clip.antiAliasWithSaveLayer,
              //       child: Stack(
              //         children: [
              //           Image.asset(
              //             "assets/contracter_images/contracter.jpg",
              //             height: 220,
              //             width: MediaQuery.of(context).size.width,
              //             fit: BoxFit.contain,
              //           ),
              //           Positioned(
              //             top: 15,
              //             left: 30,
              //             child: Text(
              //               "Contractors",
              //               style: GoogleFonts.courgette(
              //                   fontSize: 30, color: Colors.blueGrey.shade900),
              //             ),
              //           ),
              //         ],
              //       ),
              //       shape: RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(10.0),
              //       ),
              //       shadowColor: Colors.purple.shade900,
              //       elevation: 9,
              //       margin: EdgeInsets.all(10),
              //     ),
              //   ),
              // ),






              InkWell(
                onTap: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => User_View_Real_Estators()));
                },
                child: CircleAvatar(
                    radius: 140,
                    backgroundImage: AssetImage("assets/user_images/user_real_estators.jpg"),
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 220),
                    child: Text("Real Estaters",style: GoogleFonts.courgette(
                        fontSize: 25, color: Colors.blueGrey.shade900),),
                  ),
                ),
              ),



              // InkWell(
              //   onTap: () {
              //     Navigator.push(
              //         context,
              //         MaterialPageRoute(
              //             builder: (context) => Admin_View_Real_Esters()));
              //   },
              //   child: Padding(
              //     padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              //     child: Card(
              //       clipBehavior: Clip.antiAliasWithSaveLayer,
              //       child: Stack(
              //         children: [
              //           Image.asset(
              //             "assets/real_estaters/rs.jpg",
              //             height: 220,
              //             width: MediaQuery.of(context).size.width,
              //             fit: BoxFit.contain,
              //           ),
              //           Positioned(
              //             top: 15,
              //             left: 30,
              //             child: Text(
              //               "Real Estaters",
              //               style: GoogleFonts.courgette(
              //                   fontSize: 30, color: Colors.blueGrey.shade900),
              //             ),
              //           ),
              //         ],
              //       ),
              //       shape: RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(10.0),
              //       ),
              //       shadowColor: Colors.purple.shade900,
              //       elevation: 9,
              //       margin: EdgeInsets.all(10),
              //     ),
              //   ),
              // ),


              // SizedBox(height: 30,),
// TextButton(onPressed: (){
//  // Navigator.push(context, MaterialPageRoute(builder: (context)=>post()));
//
// }, child: Text("Test image")),
//               TextButton(onPressed: (){
//                 Navigator.push(context, MaterialPageRoute(builder: (context)=>MultipleImageSelector()));
//
//               }, child: Text("image")),
//               TextButton(onPressed: (){
//                // Navigator.push(context, MaterialPageRoute(builder: (context)=>fn()));
//
//               }, child: Text("test3")),
//               TextButton(onPressed: (){
//                 Navigator.push(context, MaterialPageRoute(builder: (context)=>test4()));
//
//               }, child: Text("test4")),

              // Text(email_user),
              // Text(username_user),

            ],
          ),
        ),
      ),
    );
  }
}
