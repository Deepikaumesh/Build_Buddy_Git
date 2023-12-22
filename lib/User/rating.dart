import 'package:build_buddy_project/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';



class rating_fluttre extends StatefulWidget {
  @override
  _rating_fluttreState createState() => _rating_fluttreState();
}

class _rating_fluttreState extends State<rating_fluttre> {


  var rating ;


  @override
  void initState() {
    rating = 0.0;
    // TODO: implement initState
    super.initState();
  }
  var getrate;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rating bar demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
            child:Column(
              children: [
                SizedBox(height: 400,),
                SmoothStarRating(
                  rating: rating,
                  size: 45,
                  starCount: 5,
                  onRated: (value){
                    setState(() {
                      rating = value;
                     // print(rating);
                      getrate = rating;
                      print(getrate);

                    });
                  },
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Rate This App->"),
                    TextButton(onPressed: (){
                      setState(() {
                       getrate;
                        Submit();
                      });
                    }, child: Text("Ok",style: TextStyle(color: Colors.red.shade900),))
                  ],
                ),
                SizedBox(height: 100,),
                // rating == 0.0 ? SizedBox(): Text("Your Rating is ${rating}",style: TextStyle(color: Colors.green.shade500),),
                Text("Your Rating is ${rating}",style: TextStyle(color: Colors.green.shade500),),


              ],
            ),

           ),
      ),
    );
  }
  Future Submit() async {
    var APIURL = "http://$ip_address/Build_buddy_Php_files/Users/Customer_Rating.php";

    //json maping user entered details
    Map maped_data = {
      'rating_value':getrate.toString(),
      'username' :username_user,
    };
    //send  data using http post to our php code
    http.Response reponse =
    await http.post(Uri.parse(APIURL), body: maped_data);

    //getting response from php code, here
    var data = jsonDecode(reponse.body);
    var responseMessage = data["message"];
    var responseError = data["error"];

    // print("DATA: ${data}");
    print(data);

    if (responseError) {
      setState(() {

      });
    } else {


      setState(() {

      });
     // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>User_View_Contracter()));

      Fluttertoast.showToast(
          msg: "App rated successfully!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.SNACKBAR,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.blueGrey);
    }
  }
}