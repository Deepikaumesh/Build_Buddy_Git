import 'dart:convert' as convert;

import 'package:build_buddy_project/main.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DropdownScreen extends StatefulWidget {

  @override
  State<DropdownScreen> createState() => _DropdownScreenState();
}

class _DropdownScreenState extends State<DropdownScreen> {

  String url = "http://$ip_address/Build_buddy_Php_files/Real%20Estaters/Display__real_esteters_username.php";

  var _countries = [];
  var _states = [];
  var _cities = [];

// these will be the values after selection of the item
  String? country;
  String? city;
  String? state;

// this will help to show the widget after
  bool isCountrySelected = false;
  bool isStateSelected = false;

  //http get request to get data from the link
  Future getWorldData()async{
    var response = await http.get(Uri.parse(url));
    if(response.statusCode == 200){
      var jsonResponse = convert.jsonDecode(response.body);

      setState(() {
        _countries = jsonResponse;
      });


      print(_countries);
    }
  }

  @override
  void initState() {

    getWorldData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Multiple Dynamic Dependent Dropdown")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            //========================Country

            if (_countries.isEmpty) const Center(child: CircularProgressIndicator()) else Card(
              color: Colors.purple.withOpacity(0.5),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: DropdownButton<String>(
                    underline: Container(),
                    hint: Text("Select Country"),
                    icon: const Icon(Icons.keyboard_arrow_down),
                    isDense: true,
                    isExpanded: true,
                    // items: _countries.map((ctry){
                    //   return DropdownMenuItem<String>(
                    //       value: ctry["Type"],
                    //       child: Text(ctry["Type"])
                    //   );
                    // }).toList(),
                    items: <String>['Contracter', 'Real esteters']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                         value: value,
                        child: Text(
                          value,
                          style: TextStyle(fontSize: 20),
                        ),
                      );
                    }).toList(),

                    value: country,
                    onChanged: (value){
                      setState(() {
                        _states = [];
                        country = value!;
                        print(country);
                        for(int i =0; i<_countries.length; i++){
                          if(_countries[i]["Type"] == value){
                            _states = _countries[i]["Type"];
                            print("username is ${_countries[i]["username"]}");
                          }
                        }
                        isCountrySelected = true;
                      });
                    }),
              ),
            ),

//======================================= State
            if(isCountrySelected)
              Card(
                color: Colors.purple.withOpacity(0.5),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                child: Container(

                  padding: const EdgeInsets.all(15.0),
                  child: DropdownButton<String>(
                      underline: Container(),
                      hint: Text("Select State"),
                      icon: const Icon(Icons.keyboard_arrow_down),
                      isDense: true,
                      isExpanded: true,
                      items: _states.map((st){
                        return DropdownMenuItem<String>(
                            value: st["username"],
                            child: Text(st["username"])
                        );
                      }).toList(),
                      value: state,
                      onChanged: (value){
                        setState(() {

                          _cities = [];
                          state = value!;
                          // for(int i =0; i<_states.length; i++){
                          //   if(_states[i]["username"] == value){
                          //     _cities = _states[i]["cities"];
                          //   }
                          // }
                          isStateSelected = true;
                        });
                      }),
                ),
              ) else Container(),


            //=============================== City
           // if(isStateSelected)
              // Card(
              //   color: Colors.purple.withOpacity(0.5),
              //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              //   child: Container(
              //     padding: EdgeInsets.all(15),
              //     child: DropdownButton<String>(
              //         underline: Container(),
              //         hint: Text("Select City"),
              //         icon: const Icon(Icons.keyboard_arrow_down),
              //         isDense: true,
              //         isExpanded: true,
              //         items: _cities.map((ct){
              //           return DropdownMenuItem<String>(
              //               value: ct["name"],
              //               child: Text(ct["name"])
              //           );
              //         }).toList(),
              //         value: city,
              //         onChanged: (value){
              //           setState(() {
              //
              //
              //             city = value!;
              //
              //           });
              //         }),
              //   ),
              // ) else Container(),

          ],),
      ),
    );
  }
}