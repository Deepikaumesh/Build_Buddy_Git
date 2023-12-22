import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import 'Admin_searchbar_data_Contractor.dart';






class Cust_Search_Bar extends StatefulWidget {
  const Cust_Search_Bar({Key? key}) : super(key: key);

  @override
  _Cust_Search_BarState createState() => _Cust_Search_BarState();
}

class _Cust_Search_BarState extends State<Cust_Search_Bar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(25.0),
      child: Material(
        elevation: 10.0,
        borderRadius: BorderRadius.circular(40.0),
        shadowColor: Color(0x55434343),
        child: TextField(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Admin_Searchbar_Data_Contractor()));
          //  context, MaterialPageRoute(builder: (context) => Cust_Searchbar_Home()));
          },
          textAlign: TextAlign.start,
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
            hintText: "Search for Contracters..",
            prefixIcon: Icon(
              Icons.search,
              color: Colors.black54,
            ),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
