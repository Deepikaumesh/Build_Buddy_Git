import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Admin_Searchbar_Data_RS.dart';
import 'Admin_searchbar_data_Contractor.dart';









class Admin_Searchbar_RS extends StatefulWidget {
  const Admin_Searchbar_RS({Key? key}) : super(key: key);

  @override
  _Admin_Searchbar_RSState createState() => _Admin_Searchbar_RSState();
}

class _Admin_Searchbar_RSState extends State<Admin_Searchbar_RS> {
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
                context, MaterialPageRoute(builder: (context) => Admin_Searchbar_Data_RS()));
            //  context, MaterialPageRoute(builder: (context) => Cust_Searchbar_Home()));
          },
          textAlign: TextAlign.start,
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
            hintText: "Search for Real Estaters..",
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