import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

import 'main.dart';

class MultipleImageSelector extends StatefulWidget {
  const MultipleImageSelector({super.key});

  @override
  State<MultipleImageSelector> createState() => _MultipleImageSelectorState();
}

class _MultipleImageSelectorState extends State<MultipleImageSelector> {
  var cc;
var _image;
  List<File> f = [];

  List<File> files = [];

  final ImagePicker imagepicker = ImagePicker();

  List<File> selectedImages = [];
  List<File> selectedImages2 = [];

  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    // display image selected from gallery
    return Scaffold(
      appBar: AppBar(
        title: const Text('Multiple Images Select'),
        backgroundColor: Colors.green,
        actions: const [],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green)),
              child: const Text('Select Image from Gallery and Camera'),
              onPressed: () {
                getImages();
              },
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 18.0),
              child: Text(
                "GFG",
                textScaleFactor: 3,
                style: TextStyle(color: Colors.green),
              ),
            ),
            Expanded(
              child: SizedBox(
                width: 600.0,
                child: selectedImages.isEmpty
                    ? const Center(child: Text('Sorry nothing selected!!'))
                    : GridView.builder(
                        itemCount: selectedImages.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3),
                        itemBuilder: (BuildContext context, int index) {
                          print(selectedImages[index].path);

                          return Center(
                              child: kIsWeb
                                  ? Image.network(selectedImages[index].path)
                                  : Image.file(selectedImages[index]));

                          // return Center(
                          //     child: kIsWeb
                          //         ? Image.network(selectedImages[index].path)
                          //         : Image.file(selectedImages[index]));
                        },
                      ),
              ),
            ),
            ElevatedButton(
              child: Text("Pick Image"),
              onPressed: () async {
                FilePickerResult? result = await FilePicker.platform.pickFiles(
                  allowMultiple: true,
                  type: FileType.custom,
                  allowedExtensions: ['jpg', 'png', 'jpeg'],
                );

                if (result != null) {



                  f = result.paths.map((path) => File(path!)).toList();
                  setState(() {});
                  // print(f);
                  print("result of image is${result.names}");
                  cc = result.names;

                }
              },
            ),
            // Row(
            //   children: [
            //     Text(cc[0].toString()),
            //   ],
            // ),
         // Container(
         //   height: 100,
         //   child: ListView.builder(
         //     itemCount: 3,
         //
         //     itemBuilder: (BuildContext context, int index,) {
         //     return ListTile(
         //       leading: Text(cc[0].toString()),
         //       subtitle: Text(cc[1].toString()),
         //       title: Text(cc[2].toString()),
         //
         //     );
         //   },
         //
         //   ),
         // ),

            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    sendFiles();
                  });
                },
                child: Text("Send files"))
          ],
        ),
      ),
    );
  }

  Future getImages() async {
    final pickedFile = await picker.pickMultiImage(
        imageQuality: 100, maxHeight: 1000, maxWidth: 1000);
    List<XFile> xfilePick = pickedFile;

    setState(
      () {
        if (xfilePick.isNotEmpty) {
          for (var i = 0; i < xfilePick.length; i++) {
            selectedImages.add(File(xfilePick[i].path));

            print("heloooo selected images ${selectedImages.toList()}");

          }
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Nothing is selected')));
        }
      },
    );
  }

  Future sendFiles() async {
    try {
      var token = 'hello';
      var uri = Uri.parse(
          'http://$ip_address/internship_crud/add_data_with_multi_image.php"');
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
      await Future.forEach(
        files,
        (file) async => {
          request.files.add(
            http.MultipartFile(
              'image',
              (http.ByteStream(file.openRead())).cast(),
              await file.length(),
              //filename: basename(file.path),
            ),
          ),
        },
      );
      var response = request.send();

      return await request.send();
    } catch (err) {
      print(err);

      return null;
    }
  }


  Future uploadImage() async {
    final uri = Uri.parse(
        "http://$ip_address/internship_crud/add_data_with_image.php");
    var request = http.MultipartRequest('POST', uri);
    request.fields['price'] = '100';
    request.fields['name'] = 'deeps';
    var pic = await http.MultipartFile.fromPath("image", _image.path);
    request.files.add(pic);
    var response = await request.send();

    if (response.statusCode == 200) {
      print('Image Uploded');



      final snackBar = await SnackBar(
        content: const Text('data send Successfully!'),
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

//   Future<void> uploadImages(List<XFile> imageFiles) async {
//     var request = http.MultipartRequest(
//       'POST',
//       Uri.parse('http://10.0.2.2:8000/api/photo/uploadImages'),
//     );
//
//     for (var imageFile in imageFiles) {
//       var stream = http.ByteStream(
//         imageFile.openRead().cast(),
//       ); // Convert the file to byte stream.
//       var length = await imageFile.length(); // get image size
//       var multipartFile = http.MultipartFile(
//         'images', // ? or images[]. To you really need to label the parameter with a array definition at the end ?
//         stream, //File as a stream
//         length, //File size
//         filename: imageFile.path.split('/').last, //File name without path.
//       );
//       request.files.add(multipartFile);
//     }
//
//     var response = await request.send();
//     if (response.statusCode == 200) {
//       print('Images uploaded successfully');
//     } else {
//       print('Error uploading images: ${response.reasonPhrase}');
//     }
// }}
