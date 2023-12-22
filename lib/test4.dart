import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

import 'main.dart';

class test4 extends StatefulWidget {
  const test4({super.key});

  @override
  State<test4> createState() => _test4State();
}

class _test4State extends State<test4> {
  var fileName;
  List<File> f = [];

  final ImagePicker imagepicker = ImagePicker();

  final picker = ImagePicker();

  final List<XFile>? selectedImagesList = [];

  @override
  Widget build(BuildContext context) {
    // display image selected from gallery
    return Scaffold(
      appBar: AppBar(
        title: const Text('Multiple Images test 4'),
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
                  backgroundColor: MaterialStateProperty.all(Colors.red)),
              child: const Text('Select Image from Gallery and Camera'),
              onPressed: () {
                getImages();
              },
            ),
            Expanded(
              child: SizedBox(
                width: 600.0,
                child: selectedImagesList!.isEmpty
                    ? const Center(child: Text('Sorry nothing selected!!'))
                    : GridView.builder(
                        // itemCount: selectedImages.length,
                        itemCount: selectedImagesList!.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3),
                        itemBuilder: (BuildContext context, int index) {
                          return Center(
                              child: kIsWeb
                                  ? Column(
                                    children: [
                                      Image.network(
                                            selectedImagesList![index].path),

                                      Container(
                                          height:100,
                                          color:Colors.red,
                                          // child: Text(selectedImagesList![index].name)),
                                          child: Text("jjivjfivj")),

                                    ],
                                  )
                                  : Image.file(
                                      File(selectedImagesList![index].path),
                                      width: 400,
                                      height: 400,
                                    ));
                        },
                      ),
              ),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //Text("${fileName.toString()}"),
                // Text(selectedImagesList![0].name),
                // Text(selectedImagesList![1].name),
                // Text(selectedImagesList![2].name),

              ],
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    uploadImage();
                  });
                },
                child: Text("upload")),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  Future getImages() async {
    final List<XFile>? selectedImages = await ImagePicker().pickMultiImage();
    if (selectedImages!.isNotEmpty) {
      setState(() {
        selectedImagesList!.addAll(selectedImages);
        fileName = File(selectedImages.toString());
        fileName = selectedImagesList![1].name;
      });
    }
  }

  Future uploadImage() async {

    final uri = Uri.parse("http://$ip_address/internship_crud/add_data_with_multi_image.php");

    final uri1 = Uri.parse("http://$ip_address/internship_crud/add_data_with_image.php");

    var request = http.MultipartRequest('POST', uri1);

    request.fields['price'] = 'hh';
    request.fields['name'] = 'jj';

     // var takenPicture = await http.MultipartFile.fromPath("image", selectedImagesList!.first.path,filename: selectedImagesList!.first.path);
     // request.files.add(takenPicture);

    List<http.MultipartFile> newList = <http.MultipartFile>[];

    for (int i = 0; i < selectedImagesList!.length; i++) {
      var path = selectedImagesList![i].path;
      File imageFile = File(path);

      var stream = new http.ByteStream(imageFile.openRead());
      var length = await imageFile.length();

      var multipartFile =
          new http.MultipartFile("image", stream, length,
           //   filename: path
            filename: imageFile.path.split('/').last,

          );
      newList.add(multipartFile);
    }
    request.files.addAll(newList);

    var response = await request.send();
    if (response.statusCode == 200) {
      print('Image uploaded!');
    } else {
      print('Image not uploaded');
    }
  }
}
