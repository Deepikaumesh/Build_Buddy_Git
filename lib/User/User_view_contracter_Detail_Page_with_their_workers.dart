import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:build_buddy_project/User/Users_View_Contractor.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../main.dart';
import 'User_Add_Review.dart';


class User_view_contracter_Detail_page_with_their_workers extends StatefulWidget {

  User_contracter_model datapass;
  User_view_contracter_Detail_page_with_their_workers({required this.datapass});



  @override
  _User_view_contracter_Detail_page_with_their_workersState createState() => _User_view_contracter_Detail_page_with_their_workersState();
}

class _User_view_contracter_Detail_page_with_their_workersState extends State<User_view_contracter_Detail_page_with_their_workers> {




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
          "Display Contracters",
          style: GoogleFonts.prompt(fontSize: 22),
        ),
        actions: [
          TextButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>User_Add_Review()));

          },child: Text("Add\nReview->",style: TextStyle(color: Colors.yellow),),)
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [

            CircleAvatar(radius: 100,
              backgroundImage: NetworkImage(widget.datapass.image),
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Name"),
                    Text("Email"),
                    Text("Phone"),
                    Text("Place"),
                    Text("Experiance"),

                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.datapass.username),
                    Text(widget.datapass.email),
                    Text(widget.datapass.phone),
                    Text(widget.datapass.place),
                    Text(widget.datapass.experience),


                  ],
                )

              ],
            ),
            SizedBox(height: 30,),
            Align(
                alignment: Alignment.bottomCenter,
                child: GestureDetector(
                  child: Container(
                    alignment: Alignment.center,
                    height: 50,
                    width:250,
                    color: Colors.red,
                    child: Text(
                      "Report this account",
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                          color: Colors.pink.shade900),
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      Report_contracter();
                    });
                  },
                )),

            // Align(
            //     alignment: Alignment.bottomCenter,
            //     child: GestureDetector(
            //       child:Row(
            //         children: [
            //
            //           Expanded(
            //             child: TextField(
            //               obscureText: true,
            //               autofocus: false,
            //               style: TextStyle(fontSize: 15.0, color: Colors.black),
            //               decoration: InputDecoration(
            //                 border: InputBorder.none,
            //                 hintText: 'Type Review',
            //                 filled: true,
            //                 fillColor: Colors.grey.shade400,
            //                 contentPadding: const EdgeInsets.only(
            //                     left: 14.0, bottom: 6.0, top: 8.0),
            //                 focusedBorder: OutlineInputBorder(
            //                   borderSide: BorderSide(color: Colors.red),
            //                   borderRadius: BorderRadius.circular(10.0),
            //                 ),
            //                 enabledBorder: UnderlineInputBorder(
            //                   borderSide: BorderSide(color: Colors.grey),
            //                   borderRadius: BorderRadius.circular(10.0),
            //                 ),
            //               ),
            //             ),
            //           ),
            //           TextButton(onPressed: (){}, child:Text("Send"))
            //         ],
            //       ),
            //
            //
            //     ),
            // ),


            SizedBox(
              height: 20,
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: GestureDetector(
                  child: Container(
                    alignment: Alignment.center,
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.orange.shade200,
                    child: Text(
                      "My Workers",
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                          color: Colors.pink.shade900),
                    ),
                  ),
                  onTap: () {
                    // Navigator.push(context, MaterialPageRoute(builder: (context)=>Payment_User(cart_data: access_total_amt,)));
                  },
                )),
            FutureBuilder(
              future: getRequest(),
              builder: (BuildContext ctx, AsyncSnapshot snapshot) {


                if (snapshot.data == null || snapshot.data == false) {
                  return Container(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircularProgressIndicator(
                            color: Colors.red.shade900,
                            strokeWidth: 5,
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                            "Loading...",
                            style: TextStyle(),
                          ),
                        ],
                      ),
                    ),
                  );
                } else {


                  //print("test 2"+access_total_amt);

                  return
                    Flexible(
                      child: Column(
                        children: [
                          // Text("hai"),
                          Flexible(
                              child: ListView.builder(


                                  itemCount: snapshot.data?.length,
                                  itemBuilder: (context, index) {
                                    contracter_name =snapshot.data[index].username;



                                    return Padding(
                                      padding: EdgeInsets.all(10),
                                      child: InkWell(
                                        onTap: (){
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>User_view_contracter_Detail_page_with_their_workers(datapass: snapshot.data![index],)));

                                        },
                                        child: Container(
                                          height: 200,
                                          decoration: BoxDecoration(
                                              color: Colors.grey.shade300,
                                              borderRadius: BorderRadius.circular(10),
                                              border: Border.all(width: 2,color: Colors.orange.shade200)),
                                          margin: EdgeInsets.symmetric(vertical: 10),

                                          child: Padding(
                                            padding: const EdgeInsets.only(left: 30, right: 30),
                                            child: Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                  children: [
                                                    Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        SizedBox(height: 5,),
                                                        Text(
                                                          ("Name"),
                                                          style: GoogleFonts.lora(
                                                              color: Colors.teal),
                                                        ),
                                                        SizedBox(
                                                          height: 5,
                                                        ),
                                                        Text("Email_id"),
                                                        SizedBox(
                                                          height: 5,
                                                        ),
                                                        Text("Phone No"),
                                                        SizedBox(
                                                          height: 5,
                                                        ),
                                                        Text("Age"),
                                                        SizedBox(
                                                          height: 5,
                                                        ),
                                                        Text("Place"),
                                                        SizedBox(
                                                          height: 5,
                                                        ),
                                                        Text("Experiance"),






                                                      ],
                                                    ),
                                                    Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          (snapshot.data![index].username),
                                                          style: GoogleFonts.lora(
                                                              color: Colors.teal),
                                                        ),
                                                        SizedBox(
                                                          height: 5,
                                                        ),
                                                        Text(snapshot.data![index].email),
                                                        SizedBox(
                                                          height: 5,
                                                        ),
                                                        Text(snapshot.data![index].phone),
                                                        SizedBox(
                                                          height: 5,
                                                        ),
                                                        Text(snapshot.data![index].age),
                                                        SizedBox(
                                                          height: 5,
                                                        ),
                                                        Text(snapshot.data![index].place),
                                                        SizedBox(
                                                          height: 10,
                                                        ),
                                                        Text(snapshot.data![index].experience),




                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(height: 5,),
                                                Text("Description",style: TextStyle(color: Colors.red),),
                                                Text(snapshot.data![index].description),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  })
                          ),





                        ],),
                    );
                }
              },
            ),
            // Text("${contracter_name}"),




          ],
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
          "report_status":'Yes',

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
    setState(() {

    });
  }

  Future<List<workers_model>> getRequest() async {
    //replace your restFull API here.
    String url =
        "http://$ip_address/Build_buddy_Php_files/Users/Display__workers_profile_with_related_contracter.php?related_contracter="+contracter_name;
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
      contracter_name =singleUser["username"].toString();
      print(contracter_name);

      //Adding user to the list.
      users.add(user);
    }
    return users;
  }
}

class workers_model{
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
