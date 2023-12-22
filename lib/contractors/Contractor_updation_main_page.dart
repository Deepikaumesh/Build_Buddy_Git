import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../Admin/Admin_view_Contracter.dart';
import 'Add_Profile.dart';
import 'Contractors_Login_Page.dart';
import 'Display_Contracter_profiles.dart';
import 'Display_contractor_user.dart';
import 'workers/Display_contractor_worker_profile.dart';





class Contractors_updation_page extends StatefulWidget {
  const Contractors_updation_page({Key? key}) : super(key: key);

  @override
  _Contractors_updation_pageState createState() => _Contractors_updation_pageState();
}

class _Contractors_updation_pageState extends State<Contractors_updation_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        backgroundColor: Colors.blueGrey.shade100,
        centerTitle: true,


        toolbarHeight: 90,
        elevation: 0,
        title: Text(
          "updation...",
          style: GoogleFonts.cookie(color: Colors.grey.shade600, fontSize: 30),
        ),
      ),


      backgroundColor: Colors.blueGrey.shade100,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // InkWell(
            //   onTap: () {
            //     Navigator.push(
            //         context,
            //         MaterialPageRoute(
            //             builder: (context) => Display_Contracter_Profiles()));
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
            //               "update profile",
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
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Display_contractor_worker_profile()));
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
                          "update worker",
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
            //     Navigator.push(
            //         context,
            //         MaterialPageRoute(
            //             builder: (context) => Display_contractor_user()));
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
            //               "update user",
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
        // title: Text("Home Page"),
        //
        // backgroundColor: Colors.blueGrey.shade100,
        // centerTitle: true,
        // actions: [
        //   IconButton(
        //       onPressed: () async {
        //         final SharedPreferences sharedpreferences =
        //         await SharedPreferences.getInstance();
        //         sharedpreferences.remove('admin_id');
        //         Navigator.pushReplacement(context,
        //             MaterialPageRoute(builder: (context) => Contracters_HomePage()));
        //       },
        //       icon: Icon(Icons.exit_to_app)),
        // ],
        // toolbarHeight: 90,
        // elevation: 0,

//     ),
//
//
//     ],
//         ),
//       ),
//     );
//   }
// }

    //   body: Center(
    //   child: Column(
    //   children: [
    //   SizedBox(
    //   height: 50,
    // ),
    //
    // Padding(
    // padding: EdgeInsets.symmetric(
    // horizontal: 40,
    // ),
    // child: SizedBox(
    // width: 330.0,
    // height: 70.0,
    // child: ElevatedButton(
    // style: ElevatedButton.styleFrom(
    // //  shape: StadiumBorder(),
    // // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    // backgroundColor: Colors.blueGrey.shade100,
    // ),
    // child: Row(
    // mainAxisAlignment: MainAxisAlignment.start,
    // children: [
    // SizedBox(
    // height: MediaQuery.of(context).size.height / 2,
    // width: MediaQuery.of(context).size.width / 7,
    // child: Container(
    // height: MediaQuery.of(context).size.height / 2,
    // width: MediaQuery.of(context).size.width / 7,
    // decoration: BoxDecoration(
    // borderRadius: BorderRadius.circular(6),
    // // color: Colors.teal,
    // image: DecorationImage(
    // image:
    // AssetImage("assets/contracter_images/profile_contractor.jpg"),
    // fit: BoxFit.contain),
    // ),
    // ),
    // ),
    // Spacer(),
    // // Text("----------------------------------"),
    // Text(
    // 'Add Profile',
    // style: TextStyle(
    // fontSize: 20,
    // fontWeight: FontWeight.w700,
    // color: Colors.black,
    // ),
    // ),
    // ],
    // ),
    // onPressed: () {
    // Navigator.push(
    // context,
    // MaterialPageRoute(
    // builder: (BuildContext context) =>
    // Add_Profile()));
    // },
    // ),
    // ),
    // ),




