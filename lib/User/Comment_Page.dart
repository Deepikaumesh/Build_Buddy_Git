import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Comment_Page extends StatefulWidget {
  const Comment_Page({Key? key}) : super(key: key);

  @override
  State<Comment_Page> createState() => _Comment_PageState();
}

class _Comment_PageState extends State<Comment_Page> {
  TextEditingController comment_controller = TextEditingController();

  @override
  void initState() {
    comment_controller = TextEditingController();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextFormField(
            controller: comment_controller,
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
                hintText: "Write your review",
                hintStyle: TextStyle(color: Colors.black),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                )),
          ),
        ],
      ),
    );
  }
}
