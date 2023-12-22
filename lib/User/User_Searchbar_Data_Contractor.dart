import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

import '../main.dart';




class Admin_Searchbar_Data_Contractor extends StatefulWidget {
  const Admin_Searchbar_Data_Contractor({Key? key}) : super(key: key);

  @override
  _Admin_Searchbar_Data_ContractorState createState() => _Admin_Searchbar_Data_ContractorState();
}

class _Admin_Searchbar_Data_ContractorState extends State<Admin_Searchbar_Data_Contractor> {


  List<Note> _notes = [];
  List<Note> _notesForDisplay =[];

  Future <List<Note>> fetchNotes() async{
    var url ="http://$ip_address/Build_buddy_Php_files/Admin/Admin_View_Contractors.php";
    var response = await http.get(Uri.parse(url));


    List <Note> notes = [];


    if (response.statusCode ==200) {
      var notesjson =json.decode(response.body);
      for(var notejson in notesjson){
        notes.add(Note.fromJson(notejson));
      }
    }return notes;
  }


  @override
  void initState(){
    fetchNotes().then((value) {
      setState(() {
        _notes.addAll(value);
        _notesForDisplay = _notes;
      });

    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Search Real Esteters",style: GoogleFonts.prompt(color: Colors.red.shade900),),
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          leading: GestureDetector(
            onTap: () { Navigator.pop(context);},
            child: Icon(
              Icons.arrow_back_rounded,color: Colors.red.shade900, size: 30,
            ),
          ), ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return index == 0 ? _searchBar() :_listitem(index-1);

          },
          itemCount: _notesForDisplay.length+1,
        )
    );
  }

  _searchBar(){
    return Padding(padding: EdgeInsets.only(top: 5,left: 20,right: 20,bottom: 10),
      child: TextField(
        textAlign: TextAlign.start,
        textAlignVertical: TextAlignVertical.center,
        decoration: new InputDecoration(
          border: new OutlineInputBorder(
            borderSide: new BorderSide(color: Colors.teal),
            borderRadius: BorderRadius.circular(40),

          ),
          hintText: 'Search....',
        ),
        // decoration: InputDecoration(
        //     prefixIcon:Icon(Icons.search),
        //     hintText: 'Search Catagory....',
        //   border: InputBorder.none,
        // ),
        onChanged: (text) {
          text= text.toLowerCase();
          setState(() {
            _notesForDisplay = _notes.where((note) {
              var noteOther_pro =note.username.toLowerCase();
              return noteOther_pro.contains(text);
            }).toList();
          });
        },
      ),
    );
  }


  _listitem(index){

    return   Card(
      elevation: 5,
      color: Colors.grey.shade200,
      margin: EdgeInsets.symmetric(horizontal: 25,vertical: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: ListTile(
          contentPadding: EdgeInsets.all(4.0),
          // leading: Container(
          //   height: 50,
          //   width: 50,
          //   decoration: BoxDecoration(
          //     shape: BoxShape.circle,
          //     border: Border.all(color: Colors.red.shade900),
          //     image: DecorationImage(
          //       image: NetworkImage(_notesForDisplay[index].image),
          //     ),
          //   ),
          // ),
          title: Text(
            _notesForDisplay[index].username,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.lora(
                fontSize: 15, color: Colors.pink.shade700,fontWeight: FontWeight.bold),
          ),
          subtitle: Text(_notesForDisplay[index].email,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.lora(
                fontSize: 10, color: Colors.pink.shade700,fontWeight: FontWeight.bold),
          ),
          onTap: () {
            // Navigator.push(context,
            //     MaterialPageRoute(builder: (context) {
            //       return Vie_More_Detail(_notesForDisplay[index]);
            //     }
            //     )
            // );
          }
      ),
    );
  }
}






List<Note> userModelFromJson(String str) => List<Note>.from(json.decode(str).map((x) => Note.fromJson(x)));

String userModelToJson(List<Note> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Note {
  Note({
    required this.username,
    required this.phone,
    required this.email,
  });


  String username;
  String phone;
  String email;


  factory Note.fromJson(Map<String, dynamic> json) => Note(
    username: json["username"],
    phone: json["phone"],
    email: json["email"],
  );

  Map<String, dynamic> toJson() => {
    "username": username,
    "phone": phone,
    "email": email,
  };
}