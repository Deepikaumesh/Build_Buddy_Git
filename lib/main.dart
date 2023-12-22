// @dart=2.9

import 'package:flutter/material.dart';

import 'Main_Screen/Main_Screen.dart';

var id_user;
var id_contra;
var id_real;

var contracter_name;

var ip_address ="192.168.29.64";

List contracter_=[];

var email_contracter='';
var username_contracter='';

var email_user='';
var username_user='';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   //MyApp();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  Main_screen(),
    );
  }
}


