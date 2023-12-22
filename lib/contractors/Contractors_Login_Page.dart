import 'dart:convert';

import '../main.dart';
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import 'Contractors_Registration_Page.dart';
import 'Contractors_Home_Page.dart';
import 'Contractors_Registration_Page2.dart';
import 'Contractors_Splash_Screen.dart';

class Contracters_Login_Page extends StatefulWidget {
  const Contracters_Login_Page({Key? key}) : super(key: key);

  @override
  _Contracters_Login_PageState createState() => _Contracters_Login_PageState();
}

class _Contracters_Login_PageState extends State<Contracters_Login_Page> {

  getemail()async{
    final shrdprfs = await SharedPreferences.getInstance();
    await shrdprfs.setString("email_contr", email_contracter);

  }

  getusername()async{
    final shrdprfs = await SharedPreferences.getInstance();
    await shrdprfs.setString("usernamecontr", username_contracter);

  }

  getId()async{
    final shrdprfs = await SharedPreferences.getInstance();
    await shrdprfs.setString("useridcontr", id_contra);

  }





  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(

        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: 50,),


            Center(
              child: Container(
                height: 200,
                width: 200,
                child: Image.asset("assets/contracters_login.png"),
              ),
            ),

            Form(
              key: formkey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 15.0, right: 15.0, top: 15, bottom: 0),
                    child: TextFormField(
                      controller: username,
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter username";
                        }
                        return null;
                      },
                      onSaved: (username) {},
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          // labelText: 'Email',
                          hintText: 'username'),
                    ),
                  ),

          Padding(
            padding: const EdgeInsets.only(
                left: 15.0, right: 15.0, top: 15, bottom: 0),
            child: TextFormField(
              controller: email,
              keyboardType: TextInputType.text,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Please enter  email";
                }
                if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                    .hasMatch(value)) {
                  return "Please enter a valid email";
                }
                return null;
              },
              onSaved: (email) {},
              obscureText: false,
              decoration: InputDecoration(
                label: Text("email"),
                contentPadding:
                EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    // color: Colors.grey[400],
                    color: Colors.grey.shade500,
                  ),
                ),
                border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey.shade500,
                    )),
              ),
            ),
          ),


                  Padding(
                    padding: const EdgeInsets.only(
                        left: 15.0, right: 15.0, top: 15, bottom: 0),
                    //padding: EdgeInsets.symmetric(horizontal: 15),
                    child: TextFormField(
                      controller: password,
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter password";
                        }
                        return null;
                      },
                      onSaved: (name) {},
                      style: TextStyle(),
                      obscureText: true,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Password',
                          hintText: 'Enter secure password'),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 15,
              width: MediaQuery.of(context).size.width / 1.3,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.cyan.shade400,
                ),
                onPressed: ()
                //async
                {
                  setState(() {
                    Contractors_Login();
                  });

                  if (formkey.currentState!.validate()) {
                    print("session id is $key_value");

                  }
                },
                child: Text(
                  'Login',
                  style: TextStyle(color: Colors.white, fontSize: 35),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'New User?',
                  style: TextStyle(color: Colors.black87, fontSize: 15),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>   Contracter_Registration2()));

                    },
                    child: Text("Create Account"))
              ],
            )
          ],
        ),
      ),
    );
  }

  Future Contractors_Login() async {
    var url = "http://$ip_address/Build_buddy_Php_files/Contracters/Login.php";
    var response = await http.post(Uri.parse(url), headers: {
      'Accept': 'application/json'
    }, body: {
      "username": username.text,
      "email": email.text,
      "password": password.text,
    });

    var data = json.decode(response.body);
    // if (data.toString() == "Success") {
    if (data != null) {
      //var responseData = json.decode(response.body);

      for (var singleUser in data) {
        final SharedPreferences sharedpreferences =
        await SharedPreferences.getInstance();

        await sharedpreferences.setString('contracter_id', singleUser["id"]);
        email_contracter=singleUser["email"];
        username_contracter=singleUser["username"];
        id_contra =singleUser["id"];
        getemail();
        getusername();
        getId();

      }

      final snackBar = SnackBar(
        content: Text('Login Successfull'),
        action: SnackBarAction(
          label: 'Ok',
          onPressed: () {
            // Some code to undo the change.
          },
        ),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);

      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) =>
                  Contracters_HomePage()));
    } else {
      final snackBar = SnackBar(
        content: Text('Username and password invalid'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            // Some code to undo the change.
          },
        ),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}