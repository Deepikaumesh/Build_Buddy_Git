// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
//
// import 'package:shared_preferences/shared_preferences.dart';
//
// import 'Admin-Login_Page.dart';
// import 'Admin_View_Contractors.dart';
// import 'Admin_View_Real_Estaters.dart';
// import 'Admin_View_user.dart';
// import 'Display_Data.dart';
// import 'Add_worker.dart';
//
// class Admin_HomePage extends StatefulWidget {
//   const Admin_HomePage({Key? key}) : super(key: key);
//
//   @override
//   _Admin_HomePageState createState() => _Admin_HomePageState();
// }
//
// class _Admin_HomePageState extends State<Admin_HomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: Text("Admin Dashboard"),
//         actions: [
//           IconButton(
//               onPressed: () async {
//                 final SharedPreferences sharedpreferences =
//                 await SharedPreferences.getInstance();
//                 sharedpreferences.remove('admin_id');
//                 Navigator.pushReplacement(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) => AdminLogin_Page()));
//               },
//               icon: Icon(Icons.exit_to_app)),
//
//         ],
//       ),
//       body: Center(
//         child: Column(
//           children: [
//             SizedBox(
//               height: 50,
//             ),
//
//             SizedBox(height: 30,),
//
//
//             SizedBox(
//               height: 60,
//               width: 200,
//               child: ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   primary: Colors.red, // background
//                   onPrimary: Colors.yellow, // foreground
//                 ),
//                 onPressed: () {
//
//                   Navigator.push(context, MaterialPageRoute(builder: (context)=>Admin_View_User()));
//
//                 },
//                 child: Text('View users'),
//               ),
//             ),
//             SizedBox(height: 30,),
//
//
//
//
//             SizedBox(
//               height: 60,
//               width: 200,
//               child: ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   primary: Colors.red, // background
//                   onPrimary: Colors.yellow, // foreground
//                 ),
//                 onPressed: () {
//                   Navigator.push(context, MaterialPageRoute(builder: (context)=>Admin_View_Contractors()));
//                 },
//                 child: Text('View Contractors'),
//               ),
//             ),
//
//             SizedBox(height: 30,),
//
//
//
//
//             SizedBox(
//               height: 60,
//               width: 200,
//               child: ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   primary: Colors.red, // background
//                   onPrimary: Colors.yellow, // foreground
//                 ),
//                 onPressed: () {
//
//                   Navigator.push(context, MaterialPageRoute(builder: (context)=>Admin_View_Real_Estaters()));
//                 },
//                 child: Text('View Real Estaters'),
//               ),
//             ),
//
//
//
//
//
//
//             CircleAvatar(
//               backgroundColor: Colors.yellow,
//               child: Image.asset("assets/building_construction.png",height: 100,),
//               radius: 70,
//             )
//           ],
//         ),
//       ),
//     );
//
//
//     // appBar: AppBar(title: const Text('KindaCode.com')),
//     //   body: Center(
//     //     child: IconButton(
//     //       splashRadius: 100,
//     //       iconSize: 200,
//     //       icon: Ink.image(
//     //         image: const NetworkImage(
//     //             'https://www.kindacode.com/wp-content/uploads/2022/07/lemon.png'),
//     //       ),
//     //       onPressed: () {
//     //         // do something when the button is pressed
//     //         debugPrint('Hi there');
//     //       },
//     //     ),
//     //   ),
//     // );
//
//   }
// }
