import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:http/http.dart' as http;

import '../main.dart';



//Creating a class user to store the data;
class contractor_payment_model {
  final String id;
  final String customer_name;
  final String email_id;
  final String phone_no;
  final String account_no;
  final String amount;
  final String bank_name;

  contractor_payment_model({
    required this.id,
    required this.customer_name,
    required this.email_id,
    required this.phone_no,
    required this.account_no,
    required this.amount,
    required this.bank_name,

  });
}
class contractor_payment extends StatefulWidget {
  @override
  _contractor_paymentState createState() => _contractor_paymentState();
}

class _contractor_paymentState extends State<contractor_payment> {
//Applying get request.

  Future<List<contractor_payment_model>> getRequest() async {
    //replace your restFull API here.
    String url =
        "http://$ip_address/Build_buddy_Php_files/Contracters/view_payment.php?reciever_name="+username_contracter;

    final response = await http.get(Uri.parse(url));

    var responseData = json.decode(response.body);

    //Creating a list to store input data;
    List<contractor_payment_model> users = [];
    for (var singleUser in responseData) {
      contractor_payment_model user = contractor_payment_model(
        id:  singleUser["id"].toString(),
        customer_name: singleUser["customer_name"].toString(),
        email_id: singleUser["email_id"].toString(),
        phone_no: singleUser["phone_no"].toString(),
        account_no: singleUser["account_no"].toString(),
        amount: singleUser["amount"].toString(),
        bank_name: singleUser["bank_name"].toString(),
      );

      //Adding user to the list.
      users.add(user);
    }
    return users;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            "Payment History",
            style: GoogleFonts.prompt(fontSize: 22, color: Colors.blueGrey),
          ),
        ),
          body:FutureBuilder<List>(
            future: getRequest(),
            builder: (context, snapshot) {
              if (snapshot.hasError)
                Fluttertoast.showToast(
                    msg: 'Error',
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    textColor: Colors.white,
                    webPosition: 1,
                    backgroundColor: Colors.blueGrey);

              //   return snapshot.hasData ? Display_Data_Items(list: snapshot.data ?? [])  : Center(child: CircularProgressIndicator(),

              return snapshot.hasData
                  ? ListView.builder(
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, index) {



                    return Padding(
                      padding: EdgeInsets.all(10),
                      child: InkWell(
                        onTap: (){
//Navigator.push(context, MaterialPageRoute(builder: (context)=>User_View_Contracter_Detail_Page(data_user: snapshot.data![index],)));

                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 30, right: 30),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                (snapshot.data![index].customer_name),
                                style: GoogleFonts.lora(
                                    fontSize: 20,
                                    color: Colors.teal),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(snapshot.data![index].email_id),
                              SizedBox(
                                height: 5,
                              ),
                              Text(snapshot.data![index].phone_no),
                              SizedBox(
                                height: 5,
                              ),

                              Divider(
                                thickness: 2,
                                color: Colors.grey,
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  })
                  : Center(child: CircularProgressIndicator());
            },
          ),
        ),
    );
  }

  // Future<void> delrecord(String id) async {
  //   String url =
  //       "http://$ip_address/Build_buddy_Php_files/Admin/Admin_Contracters_delete_data.php";
  //   var res = await http.post(Uri.parse(url), body: {
  //     "id": id,
  //   });
  //   var resoponse = jsonDecode(res.body);
  //   if (resoponse["success"] == "true") {
  //     setState(() {
  //       Navigator.pushReplacement(context,
  //           MaterialPageRoute(builder: (context) => Admin_View_Contracter()));
  //     });
  //     print("success");
  //   }
  // }
}