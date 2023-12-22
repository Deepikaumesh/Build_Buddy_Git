import 'dart:convert';

import 'package:flutter/material.dart';

import '../main.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MultiLevelDropDownExample extends StatefulWidget {
  const MultiLevelDropDownExample({Key? key}) : super(key: key);

  @override
  State<MultiLevelDropDownExample> createState() =>
      _MultiLevelDropDownExampleState();
}

class _MultiLevelDropDownExampleState extends State<MultiLevelDropDownExample> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {


      getAllCategory();

      getAllCategory_1();
    });
  }

  List contracter_username_List = [];

  List Real_esteters_usrname = [];

  Future getAllCategory() async {
    var url =
        "http://$ip_address/Build_buddy_Php_files/Contracters/Display__contracter_username.php";
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      setState(() {
        contracter_username_List = jsonData;
      //  contracter_ = contracter_username_List;
      });
    }

     print(contracter_username_List);
  }

  Future getAllCategory_1() async {
    var url =
        "http://$ip_address/Build_buddy_Php_files/Real%20Estaters/Display__real_esteters_username.php";
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      setState(() {
        Real_esteters_usrname = jsonData;
        //
        //   real_username_List =  Real_esteters_usrname.map((username) {
        //     return username['username'];
        //   }).toList();
        //   print("new List test ${real_username_List}");
      });
    }

    print(Real_esteters_usrname);
  }

  String dropdownValue = 'Monthly';

  String? receiver_type;
  String? receiver_name;

  final List<String> Contracters = [
    'C1',
    'C2',
  ];
  final List<String> Real_esteters = [
    'S1',
    'S2',
  ];

  String? selectedCardModel;
  String? selectedMake;

  // late Map<String, List<String>> dataset = {
  //   'Contracter': Contracters,
  //   'Real Esteters': Real_esteters,
  // };

  late Map<dynamic, List<dynamic>> dataset = {
    'Contracter': Contracters,
    'Real Esteters': Real_esteters,
  };

  onCarModelChanged(String? value) {
    getAllCategory();
    //dont change second dropdown if 1st item didnt change
    if (value != selectedCardModel) selectedMake = null;
    setState(() {
      selectedCardModel = value!;
      receiver_type = selectedCardModel;
      print("receiver type ${receiver_type}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(children: [
          SizedBox(
            height: 100,
          ),
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          //   child: InputDecorator(
          //     decoration: const InputDecoration(border: OutlineInputBorder()),
          //     child: DropdownButtonHideUnderline(
          //       child: DropdownButton<String>(
          //         hint: Text("Select Receiver Type"),
          //         value: selectedCardModel,
          //         isDense: true,
          //         isExpanded: true,
          //         items: contracter_username_List.map((e) {
          //           return DropdownMenuItem<String>(
          //             value: e['username'],
          //             child: Text(e['username'])
          //           );
          //         }).toList(),
          //         onChanged: onCarModelChanged,
          //       ),
          //     ),
          //   ),
          // ),
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 30),
          //   child: InputDecorator(
          //     decoration: const InputDecoration(border: OutlineInputBorder()),
          //     child: DropdownButtonHideUnderline(
          //       child: DropdownButton(
          //           hint: Text("Select Receiver Name"),
          //           value: selectedMake,
          //           isDense: true,
          //           isExpanded: true,
          //           items: (dataset[selectedCardModel] ?? []).map((e) {
          //             return DropdownMenuItem<String?>(
          //               value: e,
          //               child: Text('$e'),
          //             );
          //           }).toList(),
          //           onChanged: (val) {
          //             setState(() {
          //               selectedMake = val!;
          //               receiver_name = selectedMake;
          //
          //               print("receiver name ${receiver_name}");
          //             });
          //           }),
          //     ),
          //   ),
          // ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            child: InputDecorator(
              decoration: const InputDecoration(border: OutlineInputBorder()),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  hint: Text("Select Receiver Type"),
                  value: selectedCardModel,
                  isDense: true,
                  isExpanded: true,
                  items: dataset.keys.map((e) {
                    return DropdownMenuItem<String>(
                      value: e,
                      child: Text('$e'),
                    );
                  }).toList(),
                  onChanged: onCarModelChanged,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: InputDecorator(
              decoration: const InputDecoration(border: OutlineInputBorder()),
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                    hint: Text("Select Receiver Name"),
                    value: selectedMake,
                    isDense: true,
                    isExpanded: true,
                    items: (dataset[selectedCardModel] ?? []).map((e) {
                      getAllCategory_1();
                      return DropdownMenuItem<String?>(
                        value: e,
                        child: Text('$e'),
                      );
                    }).toList(),
                    onChanged: (val) {
                      setState(() {

                        selectedMake = val!;
                        receiver_name = selectedMake;

                        print("receiver name ${receiver_name}");
                      });
                    }),
              ),
            ),
          ),
        ]));
  }
}

// Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
//             child: InputDecorator(
//               decoration: const InputDecoration(border: OutlineInputBorder()),
//               child: DropdownButtonHideUnderline(
//                 child: DropdownButton<String>(
//                   hint: Text("Select Receiver Type"),
//                   value: selectedCardModel,
//                   isDense: true,
//                   isExpanded: true,
//                   items: dataset.keys.map((e) {
//                     return DropdownMenuItem<String>(
//                       value: e,
//                       child: Text('$e'),
//                     );
//                   }).toList(),
//                   onChanged: onCarModelChanged,
//                 ),
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 30),
//             child: InputDecorator(
//               decoration: const InputDecoration(border: OutlineInputBorder()),
//               child: DropdownButtonHideUnderline(
//                 child: DropdownButton(
//                     hint: Text("Select Receiver Name"),
//                     value: selectedMake,
//                     isDense: true,
//                     isExpanded: true,
//                     items: (dataset[selectedCardModel] ?? []).map((e) {
//                       return DropdownMenuItem<String?>(
//                         value: e,
//                         child: Text('$e'),
//                       );
//                     }).toList(),
//                     onChanged: (val) {
//                       setState(() {
//                         selectedMake = val!;
//                         receiver_name = selectedMake;
//
//                         print("receiver name ${receiver_name}");
//                       });
//                     }),
//               ),
//             ),
//           ),
