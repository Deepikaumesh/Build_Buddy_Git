import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'Admin-Login_Page.dart';
import 'Admin_View_Real_Estaters.dart';
import 'Admin_View_user.dart';
import 'Admin_view_Contracter.dart';
import 'Display_Data.dart';
import '../contractors/workers/Add_worker.dart';
import 'Admin_Searchbar_Contractors.dart';

class Admin_HomePage extends StatefulWidget {
  const Admin_HomePage({Key? key}) : super(key: key);

  @override
  _Admin_HomePageState createState() => _Admin_HomePageState();
}

class _Admin_HomePageState extends State<Admin_HomePage> {
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
                sharedpreferences.remove('admin_id');
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => AdminLogin_Page()));
              },
              icon: Icon(Icons.exit_to_app)),
        ],
        toolbarHeight: 90,
        elevation: 0,
        title: Text(
          "Click to view the members...",
          style: GoogleFonts.cookie(color: Colors.grey.shade600, fontSize: 30),
        ),
      ),


      backgroundColor: Colors.blueGrey.shade100,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
              // Cust_Search_Bar(),

            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Admin_View_Contracter()));
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                child: Card(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Stack(
                    children: [
                      Image.asset(
                        "assets/contracter_images/contracter.jpg",
                        height: 220,
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.contain,
                      ),
                      Positioned(
                        top: 15,
                        left: 30,
                        child: Text(
                          "Contractors",
                          style: GoogleFonts.courgette(
                              fontSize: 30, color: Colors.blueGrey.shade900),
                        ),
                      ),
                    ],
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  shadowColor: Colors.purple.shade900,
                  elevation: 9,
                  margin: EdgeInsets.all(10),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Admin_View_Real_Esters()));
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                child: Card(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Stack(
                    children: [
                      Image.asset(
                        "assets/real_estaters/rs.jpg",
                        height: 220,
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.contain,
                      ),
                      Positioned(
                        top: 15,
                        left: 30,
                        child: Text(
                          "Real Estaters",
                          style: GoogleFonts.courgette(
                              fontSize: 30, color: Colors.blueGrey.shade900),
                        ),
                      ),
                    ],
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  shadowColor: Colors.purple.shade900,
                  elevation: 9,
                  margin: EdgeInsets.all(10),
                ),
              ),
            ),
            // InkWell(
            //   onTap: () {
            //     Navigator.push(context,
            //         MaterialPageRoute(builder: (context) => Admin_View_Users()));
            //   },
            //   child: Padding(
            //     padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            //     child: Card(
            //       clipBehavior: Clip.antiAliasWithSaveLayer,
            //       child: Stack(
            //         children: [
            //           Image.asset(
            //             "assets/user_images/users.jpg",
            //             height: 220,
            //             width: MediaQuery.of(context).size.width,
            //             fit: BoxFit.contain,
            //           ),
            //           Positioned(
            //             top: 15,
            //             left: 30,
            //             child: Text(
            //               "Users",
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


          ],
        ),
      ),
    );
  }
}
