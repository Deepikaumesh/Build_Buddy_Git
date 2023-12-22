import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class tab_bar extends StatefulWidget {
  const tab_bar({Key? key}) : super(key: key);

  @override
  _tab_barState createState() => _tab_barState();
}

class _tab_barState extends State<tab_bar> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(tabs: [
            Tab(text: 'chats',),
            Tab(text: 'status',),
            Tab(text: 'calls',)

          ],),
        ),
        body: TabBarView(
          children: [
            Center(child: Text("chats")),
            Center(child: Text("status")),
            Center(child: Text("calls")),
          ],
        ),
      ),
    );
  }
}
