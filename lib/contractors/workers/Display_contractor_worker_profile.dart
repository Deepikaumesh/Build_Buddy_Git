import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:http/http.dart' as http;

import '../../main.dart';

import '../Contracter_update.dart';
import 'Contractor_worker_update.dart';


//Creating a class user to store the data;
class Contracter_worker_profile_model {
  // final String id;
  final String id;
  final String username;
  final String age;
  final String place;
  final String experience;
  final String phone;
  final String email;
  final String description;


  Contracter_worker_profile_model({
    required this.id,
    required this.username,
    required this.age,
    required this.place,
    required this.experience,
    required this.phone,
    required this.email,
    required this.description,
  });
}

class Display_contractor_worker_profile extends StatefulWidget {
  @override
  _Display_contractor_worker_profileState createState() => _Display_contractor_worker_profileState();
}

class _Display_contractor_worker_profileState extends State<Display_contractor_worker_profile> {
//Applying get request.

  Future<List<Contracter_worker_profile_model>> getRequest() async {
    //replace your restFull API here.
    String url =
        "http://$ip_address/Build_buddy_Php_files/Contracters/Display__workers_profile.php";

    final response = await http.get(Uri.parse(url));

    var responseData = json.decode(response.body);

    //Creating a list to store input data;
    List<Contracter_worker_profile_model> users = [];
    for (var singleUser in responseData) {
      Contracter_worker_profile_model user = Contracter_worker_profile_model(
        //id:  singleUser["id"].toString(),
        id: singleUser["id"].toString(),
        username: singleUser["username"].toString(),
        age: singleUser["age"].toString(),
        place: singleUser["place"].toString(),
        experience: singleUser["experience"].toString(),
        phone: singleUser["phone"].toString(),
        email: singleUser["email"].toString(),
        description: singleUser["description"].toString(),

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
            "Display Workers Profiles",
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
                          // leading: CircleAvatar(
                          //     child: Image.network(snapshot.data![index].image)),
                          trailing: InkWell(
                              onTap: (){

                                Navigator.push(context, MaterialPageRoute(builder: (context)=>Contractor_worker_update(

                                  data_user: snapshot.data![index],)));

                              },
                              child: Icon(Icons.edit)),

                          title: Text(snapshot.data![index].username),
                          subtitle: Text(snapshot.data![index].email),
                          // trailing: Icon(Icons.delete),

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
        "http://$ip_address/Build_buddy_Php_files/Contracters/Display__workers_profile.php";
    var res = await http.post(Uri.parse(url), body: {
      "id": id,
    });
    var resoponse = jsonDecode(res.body);
    if (resoponse["success"] == "true") {
      setState(() {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => Display_contractor_worker_profile()));
      });
      print("success");
    }
  }
}
