import 'package:flutter/material.dart' hide Router;
import 'package:provider_architecture/ui/router.dart';
import 'package:provider_architecture/ui/views/register_screen.dart';
import 'package:provider_architecture/ui/views/opening_screen.dart';
import 'package:provider_architecture/ui/views/login_screen.dart';
import 'package:provider_architecture/ui/views/databaseWork.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class AdditionalDetails extends StatefulWidget {
  @override
  _AdditionalDetailsState createState() => _AdditionalDetailsState();
}

class _AdditionalDetailsState extends State<AdditionalDetails> {
  final _formKey = GlobalKey<FormState>();

  //TextEditingController textController = TextEditingController();

  final _usernameController = TextEditingController();
  final _ageController = TextEditingController();
  final _weightController = TextEditingController();
  final _heightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);

    final usernameField = TextFormField(
      controller: _usernameController,
      style: TextStyle(
        color: Colors.black87,
      ),
      cursorColor: Colors.black87,
      //cursorColor: Colors.white,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(       //New////////
        borderSide: BorderSide(
            color: Colors.black87,
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black87),
        ),
        hintText: "John Doe",
        labelText: "Username",
        labelStyle: TextStyle(
          color: Colors.black87,
        ),
        hintStyle: TextStyle(
          color: Colors.black87,
        ),
      ),
    );

    final ageField = TextFormField(
      controller: _ageController,
      style: TextStyle(
        color: Colors.black87,
      ),
      cursorColor: Colors.black87,
      //cursorColor: Colors.white,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          //New////////
          borderSide: BorderSide(
            color: Colors.black87,
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black87),
        ),
        hintText: "(in years)",
        labelText: "Age",
        labelStyle: TextStyle(
          color: Colors.black87,
        ),
        hintStyle: TextStyle(
          color: Colors.black87,
        ),
      ),
    );

    final weightField = TextFormField(
      controller: _weightController,
      style: TextStyle(
        color: Colors.black87,
      ),
      cursorColor: Colors.black87,
      //cursorColor: Colors.white,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          //New////////
          borderSide: BorderSide(
            color: Colors.black87,
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black87),
        ),
        hintText: "(in kg)",
        labelText: "Weight",
        labelStyle: TextStyle(
          color: Colors.black87,
        ),
        hintStyle: TextStyle(
          color: Colors.black87,
        ),
      ),
    );

    final heightField = TextFormField(
      controller: _heightController,
      style: TextStyle(
        color: Colors.black87,
      ),
      cursorColor: Colors.black87,
      //cursorColor: Colors.white,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          //New////////
          borderSide: BorderSide(
            color: Colors.black87,
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black87),
        ),
        hintText: "(in meters)",
        labelText: "Height",
        labelStyle: TextStyle(
          color: Colors.black87,
        ),
        hintStyle: TextStyle(
          color: Colors.black87,
        ),
      ),
    );

    final sendButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(25.0),
      color: Color(0xffF39A6E),
      child: MaterialButton(
          minWidth: mq.size.width / 1.2,
          padding: EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 15.0),
          child: Text(
            "Send",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20.0,
                color: Colors.black,
                fontWeight: FontWeight.bold),
          ),
          onPressed: () async {
            DB().addUser(
                uid,
                _usernameController.text,
                double.parse(_ageController.text),
                double.parse(_weightController.text),
                double.parse(_heightController.text));
            //Firebase
            Fluttertoast.showToast(
                msg: "Registration Successful",
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.yellow,
                textColor: Colors.black,
                fontSize: 16.0);
            Navigator.of(context).pushNamed(Router.MENU); //Router.MENU
          }),
    );

    final fields = Padding(
      //padding: EdgeInsets.only(top: 10.0),
      padding: EdgeInsets.fromLTRB(0, 0, 0, 40),
      //padding: EdgeInsets.only(bottom: 40.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 22),
          usernameField,
          SizedBox(height: 22),
          ageField,
          SizedBox(height: 22),
          weightField,
          SizedBox(height: 22),
          heightField,
          SizedBox(height: 15),
        ],
      ),
    );
    return SafeArea(
      child: Scaffold(
        //backgroundColor: Colors.purple,
        appBar: AppBar(
          title: Text("Additional Details"),
          centerTitle: true,
        ),
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            padding: EdgeInsets.all(20), //36
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // logo,
                fields,
                sendButton,
                // bottom,
                //Padding(
                //padding: EdgeInsets.only(bottom: 70),
                //child: bottom,
                //),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
