import 'package:build_buddy_project/Admin/Admin_Splash_Screen.dart';
import 'package:build_buddy_project/Real_Estaters/Real_Esteters_Splash_Screen.dart';
import 'package:build_buddy_project/User/Users_Splash_Screen.dart';
import 'package:build_buddy_project/contractors/Contractors_Splash_Screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';


class about_us extends StatefulWidget {
  const about_us({Key? key}) : super(key: key);

  @override
  _about_usState createState() => _about_usState();
}

class _about_usState extends State<about_us> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueGrey,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                // color:Colors.red,
                  margin: EdgeInsets.symmetric(vertical: 20),
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  height: MediaQuery.of(context).size.height / 14,
                  child: Text("About Us",
                      style: GoogleFonts.sourceSerifPro(
                          fontSize: 30, color: Colors.yellow))),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child:Text("Welcome to BuildBuddy, where innovation meets construction and real estate. We are a dynamic team passionate about transforming the way projects come to life and properties find their perfect match.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 17),

                ),
              ),

              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Text("➝ Our Mission:"
                  ,
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 20),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child:Text("At BuildBuddy, our mission is to simplify the construction and real estate experience. We believe in empowering users with cutting-edge technology that streamlines processes, enhances communication, and fosters seamless collaboration within the industry."
                  , textAlign: TextAlign.justify,style: TextStyle(fontSize: 17),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Text( "➝ What Sets Us Apart ?"
                  , textAlign: TextAlign.justify,style: TextStyle(fontSize: 20),
                ),
              ),SizedBox(
                height: 10,
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child:Text("◈ Efficiency: We understand the value of time in the fast-paced world of construction and real estate. Our app is designed to optimize workflows, ensuring that tasks are completed with precision and speed."
                  , textAlign: TextAlign.justify,style: TextStyle(fontSize: 17),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child:Text( "◈ Transparency: Trust is the foundation of successful projects and property transactions. BuildBuddy promotes transparency at every step, providing users with real-time updates, insights, and data to make informed decisions."
                  , textAlign: TextAlign.justify,style: TextStyle(fontSize: 17),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child:Text( "◈ Innovation: Embracing the latest technological advancements, we bring you features that redefine the construction and real estate landscape. From augmented reality property tours to smart project management tools, we are committed to staying ahead of the curve."
                  , textAlign: TextAlign.justify,style: TextStyle(fontSize: 17),
                ),
              ),

              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child:Text( "➝ How We Make a Difference:"
                  , textAlign: TextAlign.justify,style: TextStyle(fontSize: 20),
                ),
              ),

              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child:Text( "◈ For Construction Professionals: BuildBuddy empowers contractors, architects, and builders with tools that enhance project efficiency, collaboration, and communication. Stay on top of timelines, manage resources effectively, and deliver exceptional results."
                  , textAlign: TextAlign.justify,style: TextStyle(fontSize: 17),
                ),
              ),

              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child:Text( "◈ For Real Estate Enthusiasts: Whether you're buying or selling, BuildBuddy is your go-to platform for a hassle-free real estate experience. Discover properties by connecting with reliable agents, and make informed decisions about your next home or investment."
                  , textAlign: TextAlign.justify,style: TextStyle(fontSize: 17),
                ),
              ),

              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Text("➝ Join Us on the Journey:"
                  , textAlign: TextAlign.justify,style: TextStyle(fontSize: 20),
                ),
              ),

              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Text( "As we continue to revolutionize the construction and real estate landscape, we invite you to be a part of our journey. Download BuildBuddy today and experience the future of building and living."
                  , textAlign: TextAlign.justify,style: TextStyle(fontSize: 17),
                ),
              ),

              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Text( "BuildBuddy - Building Dreams, Connecting Lives"
                  , textAlign: TextAlign.justify,style: TextStyle(fontSize: 20,color: Colors.amberAccent),
                ),
              ),
              SizedBox(
                height: 15,
              ),

              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 30),
              //   child: Text( "For privacy-related inquiries or concerns, users can contact our privacy team at privacy@buildbuddy.com."
              //     , textAlign: TextAlign.justify,style: TextStyle(fontSize: 13),
              //   ),
              // ),




            ],


          ),

        ),
      ),
    );
  }
}