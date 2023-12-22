import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import 'package:shared_preferences/shared_preferences.dart';

import '../Main_Screen/about_us.dart';
import '../Main_Screen/privacy_and_policy.dart';
import 'Add_Plots.dart';
import 'Real_Esteters_Login_Page.dart';
import 'Real_esteters_Profile_update_Display_Page.dart';

class Real_Esteters_HomePage extends StatefulWidget {
  const Real_Esteters_HomePage({Key? key}) : super(key: key);

  @override
  _Real_Esteters_HomePageState createState() => _Real_Esteters_HomePageState();
}

class _Real_Esteters_HomePageState extends State<Real_Esteters_HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),


      backgroundColor: Colors.blueGrey.shade100,
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: ListView(
          padding: const EdgeInsets.all(0),
          children: [


            ListTile(
              // leading: const Icon(Icons.person_add_alt_1_outlined),
              title: const Text('   '),
              onTap: () {

              },
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('View profile '),
              onTap: () {

                Navigator.push(context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            Real_esteters_Profile_update_Display_Page()));
              },
            ),

            ListTile(
              leading: const Icon(Icons.sell),
              title: const Text(' Add plots & plot details'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            Add_Plots()));

              },
            ),







    ListTile(
    leading: const Icon(Icons.money),
    title: const Text(' Transaction'),
    // onTap: () {
    // Navigator.push(context,
    // MaterialPageRoute(
    // builder: (BuildContext context) =>Transaction()));
    ),

            ListTile(
              leading: const Icon(Icons.phone),
              title: const Text('Customer service '),
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

            ListTile(
              leading: const Icon(Icons.video_label),
              title: const Text(' Privacy & Policy '),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>privacy_and_policy()));
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
              title: const Text('logout'),
              onTap: () async {
                final SharedPreferences sharedpreferences =
                await SharedPreferences.getInstance();
                sharedpreferences.remove('realesteters');
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Real_Esteters_Login_Page()));
              },
            ),
          ],  ),
      ),





      // body: Center(
      //   child: Column(
      //     children: [
      //       SizedBox(
      //         height: 50,
      //       ),
      //       Row(
      //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //         children: [
      //           Text("Logout"),
      //           IconButton(
      //               onPressed: () async {
      //                 final SharedPreferences sharedpreferences =
      //                 await SharedPreferences.getInstance();
      //                 sharedpreferences.remove('realesteters_id');
      //                 Navigator.pushReplacement(
      //                     context,
      //                     MaterialPageRoute(
      //                         builder: (context) => Real_Esteters_Login_Page()));
      //               },
      //               icon: Icon(Icons.exit_to_app)),
      //         ],
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}