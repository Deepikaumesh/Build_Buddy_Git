import 'dart:convert' as convert;
import 'dart:convert';

import 'package:build_buddy_project/main.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;



class drop_test2 extends StatefulWidget {
  @override
  _drop_test2State createState() => _drop_test2State();
}

class _drop_test2State extends State<drop_test2> {

  List Real_esteters_usrname = [];
  List tamil = ["kkk","mjmj","jmj"];

  @override
  void initState() {
    _getStateList();
    _getTalukList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dynamic DropDownList REST API'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            alignment: Alignment.topCenter,
            margin: EdgeInsets.only(bottom: 100, top: 100),
            child: Text(
              'KDTechs',
              style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
            ),
          ),
          //======================================================== State

          Container(
            padding: EdgeInsets.only(left: 15, right: 15, top: 5),
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: DropdownButtonHideUnderline(
                    child: ButtonTheme(
                      alignedDropdown: true,
                      child: DropdownButton<String>(
                        value: _myState,
                        iconSize: 30,
                        icon: (null),
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 16,
                        ),
                        hint: Text('Select State'),
                        onChanged: <String>(newValue) {
                          setState(() {
                            _myState = newValue;
                            _getCitiesList();
                            print(_myState);
                          });
                        },
                        items: statesList?.map((item) {
                              return new DropdownMenuItem(
                                child: new Text(item['name']),
                                value: item['name'].toString(),
                              );
                            })?.toList() ??
                            [],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),

          //======================================================== City

          Container(
            padding: EdgeInsets.only(left: 15, right: 15, top: 5),
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: DropdownButtonHideUnderline(
                    child: ButtonTheme(
                      alignedDropdown: true,
                      child: DropdownButton<dynamic>(
                        value: _myCity,
                        iconSize: 30,
                        icon: (null),
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 16,
                        ),
                        hint: Text('Select City'),
                        onChanged: (newValue) {
                          setState(() {
                            _myCity = newValue;
                            print(_myCity);
                            _getTalukList();
                            taluk;
                          });
                        },
                        items: citiesList?.map((item) {
                              return DropdownMenuItem(
                                 child:_myState == 'kerala'?Text(item['name']) : _myState == 'tamil nadu' ?Text(tamil.first.toString()):Text("no"),
                                //child:_myState == 'kerala'?Text(item['name']) : _myState == 'tamil nadu' ?

                               //child: Text(item['name']),
                                 value: item['name'].toString(),


                              );
                            })?.toList()

                        // items: <String>['Monthly', 'Yearly']
                        //     .map<DropdownMenuItem<String>>((String value) {
                        //   return DropdownMenuItem<String>(
                        //     value: value,
                        //     child: Text(
                        //       value,
                        //       style: TextStyle(fontSize: 20),
                        //     ),
                        //   );
                        // }).toList(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          Text("${_myState}"),
        ],
      ),
    );
  }

  //=============================================================================== Api Calling here

  List ?statesList;
  String? _myState;


  Future _getStateList() async{
    var response = await http.get(Uri.parse("http://$ip_address/Build_buddy_Php_files/Dispay_sates.php"));
    if(response.statusCode == 200){
      var jsonResponse = convert.jsonDecode(response.body);

      setState(() {
  statesList = jsonResponse;
      });


      print(statesList);
    }
  }


  // Get State information by API
  List citiesList =[];
  String? _myCity;


  Future  _getCitiesList() async {

    var response = await http.get(Uri.parse("http://$ip_address/Build_buddy_Php_files/Dispay_cities.php"));
    if(response.statusCode == 200){
      var jsonResponse = convert.jsonDecode(response.body);

      setState(() {
        citiesList =jsonResponse;
      });
  }
}

  List talukList =[];
  List taluk = [];

  Future  _getTalukList() async {

    var response = await http.get(Uri.parse("http://$ip_address/Build_buddy_Php_files/Dispay_taluk.php"));
    if(response.statusCode == 200){
      var jsonResponse = convert.jsonDecode(response.body);

      setState(() {
        talukList =jsonResponse;
        // taluk =  talukList.map((name) {
        //   return name['name'].toString();
        //
        // }).toList();

      //  List<Map<dynamic, dynamic>> output = List.from(json.decode(jsonResponse) as List);


      // taluk =  talukList.map((name) {
      //                         return name['name'];
      //                       }).toList();
//print(talukList);

        //print("new List test ${output}");
      });
    }
  }

  // late Map<dynamic, List<dynamic>> dataset = {
  //   'tamil nadu':  Real_esteters_usrname,
  // };


}