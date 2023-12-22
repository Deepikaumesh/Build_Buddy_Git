import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';
import 'Users_Home_Page.dart';
import 'Users_Login_Page.dart';

var key_value;
var users_key;

class Users_Splash_Screen extends StatefulWidget {
  _Users_Splash_ScreenState createState() => _Users_Splash_ScreenState();
}

class _Users_Splash_ScreenState extends State<Users_Splash_Screen> {


  void initState() {
    getValidationData().whenComplete(() async {
      await Timer(Duration(seconds: 1), () {
        users_key == null
            ? Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => Users_Login_Page()))
            : Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => Users_Home_Page()));
      });
    });
    setState(() {
      getmail();
      getusername();
      getid();
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
    var obtainedemail = await sharedprefs.getString('users');
    setState(() {
      users_key = obtainedemail;
    });

  }


  getmail() async {
    final SharedPreferences sharedprefs = await SharedPreferences.getInstance();
    var obtainedemail = await sharedprefs.getString('email_user');
    setState(() {
      email_user = obtainedemail!;
    });

  }

  getusername() async {
    final SharedPreferences sharedprefs = await SharedPreferences.getInstance();
    var obtainedemail = await sharedprefs.getString('username_user');
    setState(() {
      username_user = obtainedemail!;
    });

  }
  getid() async {
    final SharedPreferences sharedprefs = await SharedPreferences.getInstance();
    var obtainedemail = await sharedprefs.getString('id_user');
    setState(() {
      id_user = obtainedemail!;
    });

  }
}
