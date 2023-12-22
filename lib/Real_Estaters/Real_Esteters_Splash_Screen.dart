import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';
import 'Real_Esteters_Home_Page.dart';
import 'Real_Esteters_Login_Page.dart';

var key_value;
var realesterters_key;

class Real_Esteters_plash_Screen extends StatefulWidget {
  _Real_Esteters_plash_ScreenState createState() => _Real_Esteters_plash_ScreenState();
}

class _Real_Esteters_plash_ScreenState extends State<Real_Esteters_plash_Screen> {


  void initState() {
    getValidationData().whenComplete(() async {
      await Timer(Duration(seconds: 1), () {
        realesterters_key == null
            ? Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => Real_Esteters_Login_Page()))
            : Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => Real_Esteters_HomePage()));
      });
    });
    setState(() {
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
    var obtainedemail = await sharedprefs.getString('realesteters');
    setState(() {
      realesterters_key = obtainedemail;
    });

  }

  getid() async {
    final SharedPreferences sharedprefs = await SharedPreferences.getInstance();
    var obtainedemail = await sharedprefs.getString('id_real');
    setState(() {
      id_real = obtainedemail!;
    });

  }
}
