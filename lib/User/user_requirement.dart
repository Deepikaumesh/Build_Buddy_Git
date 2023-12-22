import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

import '../../main.dart';

class user_requirement extends StatefulWidget {
  const user_requirement({Key? key}) : super(key: key);

  @override
  State<user_requirement> createState() => _user_requirementState();
}

class _user_requirementState extends State<user_requirement> {
  var _image;
//  final picker = ImagePicker();
  ImagePicker picker = ImagePicker();
  String Selected_category = 'Contracters';

  TextEditingController categorycontroller = TextEditingController();
  TextEditingController placecontroller = TextEditingController();
  TextEditingController workcontroller = TextEditingController();

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  Future choose_image_gallery() async {
    try {
      //final image = await picker.getImage(source: ImageSource.camera);

      final image = await picker.pickImage(source: ImageSource.gallery);

      if (image == null) return;

      final imageTemp = File(image.path);

      setState(() => this._image = imageTemp);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  late bool status;
  late String message;

  Future choose_image_camera() async {
    try {
      //final image = await ImagePicker.pickImage(source: ImageSource.camera);
      //final image = await picker.pickImage(source: ImageSource.camera);
      final image = await ImagePicker.platform.pickImage(source: ImageSource.camera);

      if (image == null) return;

      final imageTemp = File(image.path);

      setState(() => this._image = imageTemp);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  @override
  void initState() {
    // categorycontroller = TextEditingController();
    placecontroller = TextEditingController();
    workcontroller = TextEditingController();

    status = false;
    message = "";

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("POST WORK"),
        backgroundColor: Colors.grey,
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                  child: TextFormField(
                    controller: placecontroller,
                    keyboardType: TextInputType.text,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                        ),
                        hintText: "Enter address",
                        hintStyle: TextStyle(color: Colors.black),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                  ),
                ),

                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                  child: TextFormField(
                    controller: workcontroller,
                    keyboardType: TextInputType.text,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                        ),
                        hintText:
                            "Enter your work description/plot description",
                        hintStyle: TextStyle(color: Colors.black),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                  ),
                ),

                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "Select category",
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                ),

                ListTile(
                  leading: Radio<String>(
                    value: 'Contracters',
                    groupValue: Selected_category,
                    onChanged: (value) {
                      setState(() {
                        Selected_category = value!;
                      });
                    },
                  ),
                  title: Text("Contracters"),
                ),
                // ),
                ListTile(
                  leading: Radio<String>(
                    value: 'Real Esteters',
                    groupValue: Selected_category,
                    onChanged: (value) {
                      setState(() {
                        Selected_category = value!;
                      });
                    },
                  ),
                  title: Text("Real Esteters"),
                ),

                SizedBox(
                  height: 20,
                ),
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 20),
                //   child: Text(
                //     "You have selected :",
                //     textAlign: TextAlign.left,
                //     style: TextStyle(fontSize: 15, color: Colors.black),
                //   ),
                // ),

               // Text("${Selected_category}"),
                SizedBox(
                  height: 20,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Choose Image",
                      style: GoogleFonts.hindVadodara(
                        fontSize: 20,
                        color: Colors.cyan,
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.photo_outlined,
                        size: 35,
                        color: Colors.cyan,
                      ),
                      onPressed: () {
                        choose_image_gallery();
                      },
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.camera_alt_outlined,
                        size: 35,
                        color: Colors.cyan,
                      ),
                      onPressed: () {
                        choose_image_camera();
                      },
                    ),
                  ],
                ),
                Center(
                  child: Container(
                      height: 100,
                      width: 200,
                      //decoration: BoxDecoration(borderRadius: BorderRadius.circular(40),  color: Colors.grey,
                      //),

                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: _image != null
                            ? Image.file(
                                _image,
                                fit: BoxFit.cover,
                              )
                            : Center(
                                child: Text(
                                "No image selected",
                                style: GoogleFonts.hindVadodara(
                                    fontSize: 13, color: Colors.red.shade900),
                              )),
                      )),
                ),
                SizedBox(
                  height: 15,
                ),


                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          uploadImage();
                        });
                      },
                      child: Text(
                        'Submit',
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                    ),
                    //  Text(status ? message : message,style: TextStyle(color: Colors.red.shade900),),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future uploadImage() async {
    final uri = Uri.parse(

        "http://$ip_address/Build_buddy_Php_files/Users/user_requirement.php");

    var request = http.MultipartRequest('POST', uri);


    request.fields['place'] = placecontroller.text;
    request.fields['work'] = workcontroller.text;
    request.fields['category'] = Selected_category;
    request.fields['name']=username_user;





    var pic = await http.MultipartFile.fromPath("image", _image.path);
    request.files.add(pic);
    var response = await request.send();
    print(response);

    if (response.statusCode == 200) {
      print('Image Uploded');
      placecontroller.clear();
      workcontroller.clear();



      final snackBar = await SnackBar(
        content: const Text('Requirement posted Successfully!'),
        action: SnackBarAction(
          label: 'Ok',
          onPressed: () {
          },
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else {
      print('Image Not Uploded');
    }
    setState(() {});
  }
}
