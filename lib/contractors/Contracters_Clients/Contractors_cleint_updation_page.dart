import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:shared_preferences/shared_preferences.dart';

// import '../Admin/Admin_view_Contracter.dart';
// import 'Add_Profile.dart';
// import 'Contractors_Login_Page.dart';
// import 'Display_Contracter_profiles.dart';
// import 'Display_contractor_user.dart';
// import 'workers/Display_contractor_worker_profile.dart';





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
        "updation....",
        style: GoogleFonts.cookie(color: Colors.grey.shade600, fontSize: 30),
    ),
    ),


    backgroundColor: Colors.blueGrey.shade100,
    body: SingleChildScrollView(
    child: Column(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
    InkWell(
    onTap: () {
    // Navigator.push(
    // context,
    // MaterialPageRoute(
    // builder: (context) => Display_contractor_worker_profile()));
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
    "update clients",
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
    ],
    ),
    ),
    );
  }
}