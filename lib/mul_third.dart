import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

import '../main.dart';



class post extends StatefulWidget {
  const post({Key? key}) : super(key: key);

  @override
  _postState createState() => _postState();
}

class _postState extends State<post> {

  var tt;



  List<File> files = [];

  final ImagePicker imagepicker = ImagePicker();
  List<XFile> imageFileList = [];

  Future select_Images() async {
    final List<XFile>? selectedImages = await imagepicker.pickMultiImage();

    if (selectedImages!.isNotEmpty) {
      imageFileList.addAll(selectedImages);

    }

    setState(() {});
  }

  // Future<http.StreamedResponse?> sendFiles() async {
  Future  sendFiles() async {
    try {
      var token ='hello';
      var uri = Uri.parse('http://$ip_address/internship_crud/add_data_with_multi_image.php');
      var request = http.MultipartRequest('POST', uri);

      // Headers
      request.headers.addAll({
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      });

      // Fields
      request.fields['name'] = 'test';
      request.fields['price'] = 'test';


      // Files
      await Future.forEach(files, (file) async => {request.files.add(http.MultipartFile(
              'image',
              (http.ByteStream(file.openRead())).cast(),
              await file.length(),
              filename: basename(file.path),


            ),

          ),


        },

      );
var response =request.send();
print("test image ${response}");
      return await request.send();

    } catch (err) {
      print(err);


      return null;
    }
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: GridView.builder(
                  itemCount: imageFileList.length,
                  itemBuilder: (BuildContext context, int index) {

                     tt = imageFileList[index].path.toString();
                    return Image.file(
                      File(imageFileList[index].path),
                      fit: BoxFit.cover,
                    );

                  },
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                ),
              ),
            ),


            SizedBox(height: 20),

            Text("${tt.toString()}"),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    select_Images();
                  });
                },
                child: Text("pick")),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    //   uploadImageToServer(context);
                    //uploadImage();
                    sendFiles();



                  });
                },
                child: Text("upload"))
          ],
        ),
      ),
    );
  }
}
