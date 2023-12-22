import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:fluttertoast/fluttertoast.dart';

import 'package:http/http.dart' as http;
import 'package:smooth_star_rating/smooth_star_rating.dart';

import '../main.dart';
import 'Edit_data.dart';

//Creating a class user to store the data;
class Rating_model {
  // final String id;
  final String id;
  final String rating_value;
  final String username;

  Rating_model({
    // required this.id,
    required this.id,
    required this.rating_value,
    required this.username,
  });
}

class Admin_View_Customer_Rating extends StatefulWidget {
  @override
  _Admin_View_Customer_RatingState createState() => _Admin_View_Customer_RatingState();
}

class _Admin_View_Customer_RatingState extends State<Admin_View_Customer_Rating> {
//Applying get request.

  Future<List<Rating_model>> getRequest() async {
    //replace your restFull API here.
    String url = "http://$ip_address/Build_buddy_Php_files/Admin/Dispay_User_ratings.php";

    final response = await http.get(Uri.parse(url));

    var responseData = json.decode(response.body);

    //Creating a list to store input data;
    List<Rating_model> users = [];
    for (var singleUser in responseData) {
      Rating_model user = Rating_model(
        //id:  singleUser["id"].toString(),
        id: singleUser["id"].toString(),
        rating_value: singleUser["rating_value"].toString(),
        username: singleUser["username"].toString(),
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
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text(
            "Customer Rating",
          ),
        ),
      //  body: Scaffold(
          body: Container(
            padding: EdgeInsets.all(16.0),
            child: FutureBuilder(
              future: getRequest(),
              builder: (BuildContext ctx, AsyncSnapshot snapshot) {
                if (snapshot.data == null) {
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
                            "Data Loading Please Wait!",
                            style: TextStyle(),
                          ),
                        ],
                      ),
                    ),
                  );
                } else {
                  return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (ctx, index) => Column(
                      children: [
                        Card(
                          color: Colors.blue.shade100,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: ListTile(
                                  title: Text(
                                    snapshot.data[index].username,
                                  ),

                                  subtitle:    SmoothStarRating(
                                    rating: double.parse(snapshot.data[index].rating_value),
                                    size: 30,
                                    starCount: 5,
                                    borderColor: Colors.teal.shade900,
                                    color: Colors.green.shade900,
                                    onRated: (value){
                                      setState(() {
                                      });
                                    },
                                  ),

                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  );
                }
              },
            ),
          ),
        ),
    //  ),
    );
  }


}


