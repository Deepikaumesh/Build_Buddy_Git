import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:build_buddy_project/User/Users_View_Contractor.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:build_buddy_project/User/User_Veiw_Real_Estators.dart';
import '../main.dart';

class User_view_Real_esteters_plot_detail_page extends StatefulWidget {
  Real_Estaters_model datapass;

  User_view_Real_esteters_plot_detail_page({required this.datapass});

  @override
  _User_view_Real_esteters_plot_detail_pageState createState() =>
      _User_view_Real_esteters_plot_detail_pageState();
}

class _User_view_Real_esteters_plot_detail_pageState
    extends State<User_view_Real_esteters_plot_detail_page> {
  @override
  void initState() {
    // TODO: implement initState

    setState(() {
      getRequest();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.teal.shade400,
        centerTitle: true,
        title: Text(
          "Display Plot Data",
          style: GoogleFonts.prompt(fontSize: 22),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [

              Center(child:
                Image.network(widget.datapass.image),

              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.person,size: 30,),
                  SizedBox(width:10),
                  Text(widget.datapass.username,style: TextStyle(fontSize: 30,color: Colors.purple),)
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.email,size: 30,),
                  SizedBox(width:10),
                  Text(widget.datapass.email,style: TextStyle(fontSize: 30,color: Colors.purple),)
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.phone,size: 30,),
                  SizedBox(width:10),
                  Text(widget.datapass.phone,style: TextStyle(fontSize: 30,color: Colors.purple),)
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.place,size: 30,),
                  SizedBox(width:10),
                  Text(widget.datapass.place,style: TextStyle(fontSize: 30,color: Colors.purple),)
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.money,size: 30,),
                  SizedBox(width:10),
                  Text(widget.datapass.amount,style: TextStyle(fontSize: 30,color: Colors.purple),)
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.area_chart,size: 30,),
                  SizedBox(width:10),
                  Text(widget.datapass.area,style: TextStyle(fontSize: 30,color: Colors.purple),)
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.info,size: 30,),
                  SizedBox(width:10),
                  Text(widget.datapass.description,style: TextStyle(fontSize: 30,color: Colors.purple),)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Report_contracter() async {
    final response = await http.post(
        Uri.parse(
            "http://$ip_address/Build_buddy_Php_files/Users/Report_Contracter.php"),
        body: {
          "id": widget.datapass.id,
          "report_status": 'Yes',
        });
    if (response.statusCode == 200) {
      print('Image Uploded');

      final snackBar = await SnackBar(
        content: const Text('Reported successfully!'),
        action: SnackBarAction(
          label: 'Ok',
          onPressed: () {
            //Navigator.pop(context);
            // Some code to undo the change.
          },
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else {
      print("not");
      final snackBar = await SnackBar(
        content: const Text('Event updation failed!'),
        action: SnackBarAction(
          label: 'Ok',
          onPressed: () {
            //Navigator.pop(context);
            // Some code to undo the change.
          },
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
    setState(() {});
  }

  Future<List<workers_model>> getRequest() async {
    //replace your restFull API here.
    String url =
        "http://$ip_address/Build_buddy_Php_files/Users/Display__workers_profile_with_related_contracter.php?related_contracter=" +
            contracter_name;
    final response = await http.get(Uri.parse(url));

    var responseData = json.decode(response.body);

    //Creating a list to store input data;
    List<workers_model> users = [];
    for (var singleUser in responseData) {
      workers_model user = workers_model(
        //id:  singleUser["id"].toString(),
        id: singleUser["id"].toString(),
        username: singleUser["username"].toString(),
        email: singleUser["email"].toString(),
        phone: singleUser["phone"].toString(),
        age: singleUser["age"].toString(),
        experience: singleUser["experience"].toString(),
        place: singleUser["place"].toString(),
        description: singleUser["description"].toString(),
      );
      contracter_name = singleUser["username"].toString();
      print(contracter_name);

      //Adding user to the list.
      users.add(user);
    }
    return users;
  }
}

class workers_model {
  final String id;
  final String username;
  final String email;
  final String phone;
  final String age;
  final String experience;
  final String place;
  final String description;

  workers_model({
    required this.id,
    required this.username,
    required this.email,
    required this.phone,
    required this.age,
    required this.experience,
    required this.place,
    required this.description,
  });
}
