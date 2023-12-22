import 'package:build_buddy_project/Admin/Admin_Splash_Screen.dart';
import 'package:build_buddy_project/Real_Estaters/Real_Esteters_Splash_Screen.dart';
import 'package:build_buddy_project/User/Users_Splash_Screen.dart';
import 'package:build_buddy_project/contractors/Contractors_Splash_Screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';


class privacy_and_policy extends StatefulWidget {
  const privacy_and_policy({Key? key}) : super(key: key);

  @override
  _privacy_and_policyState createState() => _privacy_and_policyState();
}

class _privacy_and_policyState extends State<privacy_and_policy> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.cyan.shade50,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                // color:Colors.red,
                  margin: EdgeInsets.symmetric(vertical: 20),
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  height: MediaQuery.of(context).size.height / 14,
                  child: Text("Privacy And Policy",
                      style: GoogleFonts.sourceSerifPro(
                          fontSize: 30, color: Colors.blueGrey))),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child:Text("Data Collection:",
            textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 15),

              ),
        ),

              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Text("We collect user-provided information such as names, email addresses, and location data for the purpose of creating accounts and facilitating property transactions. Additionally, automatic data collection tools may gather device information to enhance user experience."
          ,
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 13),
           ),
              ),
            SizedBox(
          height: 10,
           ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child:Text("Security Measures:"
          , textAlign: TextAlign.justify,style: TextStyle(fontSize: 15),
        ),
        ),
              SizedBox(
                height: 10,
              ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Text(  "We employ industry-standard security measures, including encryption protocols, to safeguard user data from unauthorized access. Regular security audits are conducted to identify and address potential vulnerabilities."
                , textAlign: TextAlign.justify,style: TextStyle(fontSize: 13),
              ),
        ),SizedBox(
                height: 10,
              ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child:Text("Third-Party Sharing:"
                , textAlign: TextAlign.justify,style: TextStyle(fontSize: 15),
              ),
          ),
              SizedBox(
                height: 10,
              ),
                Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
    child:Text( "User data may be shared with trusted third parties, such as real estate agents or financial institutions, solely for the purpose of facilitating property transactions. Users will be notified and provide consent before any such sharing occurs."
                , textAlign: TextAlign.justify,style: TextStyle(fontSize: 13),
              ),
                ),
              SizedBox(
                height: 10,
              ),
    Padding(
    padding: const EdgeInsets.symmetric(horizontal: 30),
    child:Text( "Financial Transactions:"
                , textAlign: TextAlign.justify,style: TextStyle(fontSize: 15),
              ),
    ),

              SizedBox(
                height: 10,
              ),
              Padding(
    padding: const EdgeInsets.symmetric(horizontal: 30),
    child:Text( "All financial transactions, including payment processing and storage of financial information, are handled through secure channels with compliance to relevant financial regulations.:"
                , textAlign: TextAlign.justify,style: TextStyle(fontSize: 13),
              ),
              ),

              SizedBox(
                height: 10,
              ),
    Padding(
    padding: const EdgeInsets.symmetric(horizontal: 30),
    child:Text( "User Controls :"
                , textAlign: TextAlign.justify,style: TextStyle(fontSize: 15),
              ),
    ),

              SizedBox(
                height: 10,
              ),
    Padding(
    padding: const EdgeInsets.symmetric(horizontal: 30),
    child:Text( " Users have the ability to access, edit, or delete their data through account settings. The process for account deletion is outlined in the app, ensuring users have full control over their information :"
                , textAlign: TextAlign.justify,style: TextStyle(fontSize: 13),
              ),
    ),

              SizedBox(
                height: 10,
              ),
    Padding(
    padding: const EdgeInsets.symmetric(horizontal: 30),
    child: Text( " Updates to Policy :"
                , textAlign: TextAlign.justify,style: TextStyle(fontSize: 15),
              ),
    ),

              SizedBox(
                height: 10,
              ),
              Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
    child: Text( "This privacy policy may be updated to reflect changes in our data practices. Users will be notified of any updates, and continued use of the app constitutes acceptance of the revised policy."
                , textAlign: TextAlign.justify,style: TextStyle(fontSize: 13),
              ),
              ),

              SizedBox(
                height: 10,
              ),
    Padding(
    padding: const EdgeInsets.symmetric(horizontal: 30),
    child: Text( "Contact Information"
                , textAlign: TextAlign.justify,style: TextStyle(fontSize: 15),
              ),
    ),
              SizedBox(
                height: 10,
              ),

    Padding(
    padding: const EdgeInsets.symmetric(horizontal: 30),
    child: Text( "For privacy-related inquiries or concerns, users can contact our privacy team at privacy@buildbuddy.com."
                , textAlign: TextAlign.justify,style: TextStyle(fontSize: 13),
              ),
    ),




            ],


          ),

        ),
      ),
    );
  }
}