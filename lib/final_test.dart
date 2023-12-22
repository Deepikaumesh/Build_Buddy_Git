// // @dart=2.9
//
// import 'dart:convert';
// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:flutter_absolute_path/flutter_absolute_path.dart';
// import 'package:multi_image_picker/multi_image_picker.dart';
// import 'package:http/http.dart' as http;
// import 'dart:async';
// import 'package:path/path.dart';
//
// import 'main.dart';
//
// class fn extends StatefulWidget {
//   @override
//   _fnState createState() => _fnState();
// }
//
// class _fnState extends State<fn> {
//   List<Asset> imagesList = <Asset>[];
//   String _error = 'No Error Dectected';
//
//   var resp;
//
//   @override
//   void initState() {
//     super.initState();
//   }
//
//   Widget buildGridView() {
//     return GridView.count(
//       crossAxisCount: 3,
//       children: List.generate(imagesList.length, (index) {
//         Asset asset = imagesList[index];
//         return AssetThumb(
//           asset: asset,
//           width: 300,
//           height: 300,
//         );
//       }),
//     );
//   }
//
//   Future<void> loadAssets() async {
//     List<Asset> resultList = <Asset>[];
//     String error = 'No Error Detected';
//
//     try {
//       resultList = await MultiImagePicker.pickImages(
//         maxImages: 300,
//         enableCamera: true,
//         selectedAssets: imagesList,
//         cupertinoOptions: CupertinoOptions(takePhotoIcon: "chat"),
//         materialOptions: MaterialOptions(
//           actionBarColor: "#abcdef",
//           actionBarTitle: "Example App",
//           allViewTitle: "All Photos",
//           useDetailsView: false,
//           selectCircleStrokeColor: "#000000",
//         ),
//       );
//     } on Exception catch (e) {
//       error = e.toString();
//     }
//
//     // If the widget was removed from the tree while the asynchronous platform
//     // message was in flight, we want to discard the reply rather than calling
//     // setState to update our non-existent appearance.
//     if (!mounted) return;
//
//     setState(() {
//       imagesList = resultList;
//
//
//       _error = error;
//     });
//   }
//
//   Future uploadImageToServer(BuildContext context) async {
//     try {
//       setState(() {});
//
//       var uri = Uri.parse('http://$ip_address/internship_crud/add_data_with_multi_image.php');
//       http.MultipartRequest request = http.MultipartRequest('POST', uri);
//
//       request.fields['name'] = 'piza';
//       request.fields['price'] = '700';
//
//
//       List<http.MultipartFile> newList = <http.MultipartFile>[];
//
//       for (int i = 0; i < imagesList.length; i++) {
//
//         //the length of image list
//         resp = imagesList[i];
//         print("the response is ${resp.toString()}");
//
//         var path = await FlutterAbsolutePath.getAbsolutePath(imagesList[i].identifier);
//         File imageFile = File(path);
//
//         var stream = new http.ByteStream(imageFile.openRead());
//         var length = await imageFile.length();
//
//         var multipartFile = new http.MultipartFile("image", stream, length,
//             filename: basename(imageFile.path));
//         newList.add(multipartFile);
//       }
//
//      // request.files.addAll(newList);
//       var response = await request.send();
//
//
//
//
//
//       response.stream.transform(utf8.decoder).listen((value) {
//
//         print("the value is  ${value}");
//       });
//
//       if (response.statusCode == 200) {
//         setState(() {});
//
//         print('uploaded');
//       } else {
//         setState(() {});
//         print('failed');
//       }
//     } catch (e) {
//       setState(() {});
//       print(e.toString());
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: Center(
//         child: Column(
//           children: <Widget>[
//             Center(child: Text('Error: $_error')),
//             ElevatedButton(
//               child: Text("Pick images"),
//
//               onPressed: loadAssets,
//             ),
//             Expanded(
//               child: buildGridView(),
//             ),
//
//
//             Visibility(
//               visible: imagesList.isEmpty ? false : true,
//               child: ElevatedButton(
//                 child: Text("Upload"),
//                 onPressed: () async {
//                   uploadImageToServer(context);
//
//                   print("the lenghth is ${resp.toString()}");
//
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
