import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:http/http.dart' as http;

import '../main.dart';
import 'Contracter_update.dart';


//Creating a class user to store the data;
class Contracter_profile_model {
  // final String id;
  final String id;
  final String name;
  final String place;
  final String phone;
  final String email;
  final String experience;
  final String image;

  Contracter_profile_model({
    required this.id,
    required this.name,
    required this.place,
    required this.phone,
    required this.email,
    required this.experience,
    required this.image,
  });
}

class Display_Contracter_Profiles extends StatefulWidget {
  @override
  _Display_Contracter_ProfilesState createState() => _Display_Contracter_ProfilesState();
}

class _Display_Contracter_ProfilesState extends State<Display_Contracter_Profiles> {
//Applying get request.

  Future<List<Contracter_profile_model>> getRequest() async {
    //replace your restFull API here.
    String url =
        "http://$ip_address/Build_buddy_Php_files/Contracters/Display__Contractors_profile.php";

    final response = await http.get(Uri.parse(url));

    var responseData = json.decode(response.body);

    //Creating a list to store input data;
    List<Contracter_profile_model> users = [];
    for (var singleUser in responseData) {
      Contracter_profile_model user = Contracter_profile_model(
        //id:  singleUser["id"].toString(),
        id: singleUser["id"].toString(),
        name: singleUser["name"].toString(),
        place: singleUser["place"].toString(),
        email: singleUser["email"].toString(),
        phone: singleUser["phone"].toString(),
        experience: singleUser["experience"].toString(), 
        image: singleUser["image"].toString(),

      );

      //Adding user to the list.
      users.add(user);
    }
    return users;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            "Display Contracter Profiles",
            style: GoogleFonts.prompt(fontSize: 22, color: Colors.blueGrey),
          ),
        ),
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
                        return Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Card(
                            elevation: 5,
                            child: ListTile(
                              trailing: InkWell(
                                  onTap: (){

                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Contracter_Update(

                                      data_user: snapshot.data![index],)));

                                  },
                                  child: Icon(Icons.edit)),

                              title: Text(snapshot.data![index].username),
                              subtitle: Text(snapshot.data![index].email),
                              leading: CircleAvatar(
                                  child: Image.network(snapshot.data![index].image)),
                            ),
                          ),
                        );
                      })
                  : Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ),
    );
  }

  Future<void> delrecord(String id) async {
    String url =
        "http://$ip_address/Build_buddy_Php_files/Contracters/delete_Contracter_profile.php";
    var res = await http.post(Uri.parse(url), body: {
      "id": id,
    });
    var resoponse = jsonDecode(res.body);
    if (resoponse["success"] == "true") {
      setState(() {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => Display_Contracter_Profiles()));
      });
      print("success");
    }
  }
}



