import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';



class rating_fluttre extends StatefulWidget {
  @override
  _rating_fluttreState createState() => _rating_fluttreState();
}

class _rating_fluttreState extends State<rating_fluttre> {

  var rating = 0.0;

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
                      print(rating);
                    });
                  },
                ),
                SizedBox(height: 20,),
                Text("Rate This App"),
                SizedBox(height: 300,),
                rating == 0.0 ? SizedBox(): Text("Your Rating is ${rating}",style: TextStyle(color: Colors.green.shade500),),

              ],
            ),

           ),
      ),
    );
  }
}