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
import 'Contracter_Profile_update.dart';


class contra_mode{
  final String id;
  final String username;
  final String email;
  final String phone;
  final String password;
  final String place;
  final String experience;
  final String image;

  contra_mode({
    required this.id,
    required this.username,
    required this.email,
    required this.phone,
    required this.password,
    required this.place,
    required this.experience,
    required this.image,


});

}

class Contracter_Profile_update_Display_Page extends StatefulWidget {
  // final user_mode data_user;
  //
  // Contractor_worker_update_Display_Page({required this.data_user});

  @override
  _Contracter_Profile_update_Display_PageState createState() =>
      _Contracter_Profile_update_Display_PageState();
}

class _Contracter_Profile_update_Display_PageState extends State<Contracter_Profile_update_Display_Page> {


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
                            backgroundImage: NetworkImage(snapshot.data![index].image),
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
Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Contracter_Profile_update(data_user: snapshot.data![index],)));
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


  Future<List<contra_mode>> getRequest() async {
    //replace your restFull API here.
    String url =
        "http://$ip_address/Build_buddy_Php_files/Contracters/Display__Contractors_profile.php?id="+id_contra;

    final response = await http.get(Uri.parse(url));

    var responseData = json.decode(response.body);

    //Creating a list to store input data;
    List<contra_mode> users = [];
    for (var singleUser in responseData) {
      contra_mode user = contra_mode(
        //id:  singleUser["id"].toString(),
        id: singleUser["id"].toString(),
        username: singleUser["username"].toString(),
        email: singleUser["email"].toString(),
        phone: singleUser["phone"].toString(),
        password: singleUser["password"].toString(),
        place: singleUser["place"].toString(),
        experience: singleUser["experience"].toString(),
        image: singleUser["image"].toString(),




      );

      //Adding user to the list.
      users.add(user);
    }
    return users;
  }
}
