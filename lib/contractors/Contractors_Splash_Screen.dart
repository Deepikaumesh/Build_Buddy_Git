import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../main.dart';
import 'Contractors_Home_Page.dart';
import 'Contractors_Login_Page.dart';

var key_value;
var contracter_key;

class Contracters_Splash_Screen extends StatefulWidget {
  _Contracters_Splash_ScreenState createState() => _Contracters_Splash_ScreenState();
}

class _Contracters_Splash_ScreenState extends State<Contracters_Splash_Screen> {


  void initState() {
    getValidationData().whenComplete(() async {
      await Timer(Duration(seconds: 1), () {
        contracter_key == null
            ? Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => Contracters_Login_Page()))
            : Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => Contracters_HomePage()));
      });
    });
    setState(() {

      getmail();

      getusername();

      getId();

    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Loading......",
            ),
            SizedBox(
              height: 20,
            ),
            CircularProgressIndicator(
              color: Colors.lightBlue,
            ),
          ],
        ),
      ),
    );
  }


  Future getValidationData() async {
    final SharedPreferences sharedprefs = await SharedPreferences.getInstance();
    var obtainedemail = await sharedprefs.getString('contracter_id');
    setState(() {
      contracter_key = obtainedemail;
    });

  }

  getmail() async {
    final SharedPreferences sharedprefs = await SharedPreferences.getInstance();
    var obtainedemail = await sharedprefs.getString('email_contr');
    setState(() {
      email_contracter = obtainedemail!;
    });

  }

  getusername() async {
    final SharedPreferences sharedprefs = await SharedPreferences.getInstance();
    var obtainedemail = await sharedprefs.getString('usernamecontr');
    setState(() {
      username_contracter = obtainedemail!;
    });

  }

  getId() async {
    final SharedPreferences sharedprefs = await SharedPreferences.getInstance();
    var obtainedemail = await sharedprefs.getString('useridcontr');
    setState(() {
      id_contra = obtainedemail!;
    });

  }

}
