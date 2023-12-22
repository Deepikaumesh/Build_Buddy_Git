import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../main.dart';
import 'Real_Profile_update.dart';



class real_esteters_mode{
  final String id;
  final String username;
  final String email;
  final String phone;
  final String password;

  real_esteters_mode({
    required this.id,
    required this.username,
    required this.email,
    required this.phone,
    required this.password,


});

}

class Real_esteters_Profile_update_Display_Page extends StatefulWidget {
  // final user_mode data_user;
  //
  // Contractor_worker_update_Display_Page({required this.data_user});

  @override
  _Real_esteters_Profile_update_Display_PageState createState() =>
      _Real_esteters_Profile_update_Display_PageState();
}

class _Real_esteters_Profile_update_Display_PageState extends State<Real_esteters_Profile_update_Display_Page> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Update My Profile",
          style: GoogleFonts.prompt(color: Colors.blueGrey.shade400),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,

      ),
      // body: SingleChildScrollView(
      //   child: Column(
      //     children: [
      //       Center(
      //         child: CircleAvatar(
      //           radius: 150,
      //           backgroundImage: AssetImage("assets/images/no_user.jpg"),
      //         ),
      //       ),
      //       Center(
      //         child: Text(),
      //       )
      //     ],
      //   ),
      //
      // ),

      body: Scaffold(
        body: FutureBuilder<List>(
          future: getRequest(),
          builder: (context, snapshot) {
            if (snapshot.hasError)
              Fluttertoast.showToast(
                  msg: 'Error',
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  textColor: Colors.white,
                  webPosition: 1,
                  backgroundColor: Colors.blueGrey);



            return snapshot.hasData
                ? ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: (context, index) {
                  return Column(
                      children: [
                        Center(
                          child: CircleAvatar(
                            radius: 150,
                            backgroundImage: AssetImage("assets/images/no_user.jpg"),
                          ),
                        ),
                        SizedBox(height: 30,),
                        Center(

                        child:  Text(snapshot.data![index].username,style: TextStyle(fontSize: 30),),

                        ),
                        SizedBox(height: 30,),
                        Center(

                          child:  Text(snapshot.data![index].email,style: TextStyle(fontSize: 30),),

                        ),
                        SizedBox(height: 30,),
                        Center(

                          child:  Text(snapshot.data![index].phone,style: TextStyle(fontSize: 30),),

                        ),
                        SizedBox(height: 30,),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: StadiumBorder(),
                            backgroundColor: Colors.blueGrey.shade400,
                            padding: EdgeInsets.only(
                                left: 110, right: 110, top: 20, bottom: 20),
                          ),
                          onPressed: () {
                            setState(() {
Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Real_Profile_update(data_user: snapshot.data![index],)));
                            });
                            // updateImage();
                            // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Display_Data_with_image()));
                          },
                          child: Text('Update'),
                        ),
                      ],
                    );
                })
                : Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }


  Future<List<real_esteters_mode>> getRequest() async {
    //replace your restFull API here.
    String url =
        "http://$ip_address/Build_buddy_Php_files/Real_Estaters/Dispay_real_esteters_profile.php?id="+id_real;

    final response = await http.get(Uri.parse(url));

    var responseData = json.decode(response.body);

    //Creating a list to store input data;
    List<real_esteters_mode> users = [];
    for (var singleUser in responseData) {
      real_esteters_mode user = real_esteters_mode(
        //id:  singleUser["id"].toString(),
        id: singleUser["id"].toString(),
        username: singleUser["username"].toString(),
        email: singleUser["email"].toString(),
        phone: singleUser["phone"].toString(),
        password: singleUser["password"].toString(),




      );

      //Adding user to the list.
      users.add(user);
    }
    return users;
  }
}
