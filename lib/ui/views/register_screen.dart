import 'package:flutter/material.dart' hide Router;
import 'package:provider_architecture/ui/router.dart';
import 'package:provider_architecture/ui/views/additional_details.dart';
import 'package:provider_architecture/ui/views/databaseWork.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fluttertoast/fluttertoast.dart';


UserCredential userInfo;
String uid;

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();

  //TextEditingController textController = TextEditingController();

  //final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  //final _repasswordController = TextEditingController();

  //TextEditingController _ageController;
  //TextEditingController _weightController;
  //TextEditingController _heightController;

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);

    final logo = Hero(
      tag: 'imageHero',
      child: Image.asset(
        "lib/assets/images/logo.png",
        fit: BoxFit.contain,
        height: 185,
      ),
    );

    // final usernameField = TextFormField(
    //   controller: _usernameController,
    //   style: TextStyle(
    //     color: Colors.white,
    //   ),
    //   cursorColor: Colors.black87,
    //   //cursorColor: Colors.white,
    //   decoration: InputDecoration(
    //     focusedBorder: UnderlineInputBorder(
    //       borderSide: BorderSide(color: Colors.black87),
    //     ),
    //     hintText: "John Doe",
    //     labelText: "Username",
    //     labelStyle: TextStyle(
    //       color: Colors.white,
    //     ),
    //     hintStyle: TextStyle(
    //       color: Colors.white,
    //     ),
    //   ),
    // );

    final emailField = TextFormField(
      controller: _emailController,
      keyboardType: TextInputType.emailAddress,
      style: TextStyle(
        color: Colors.white,
      ),
      cursorColor: Colors.black87,
      decoration: InputDecoration(
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black87),
        ),
        hintText: "something@example.com",
        labelText: "Email",
        labelStyle: TextStyle(
          color: Colors.white,
        ),
        hintStyle: TextStyle(
          color: Colors.white,
        ),
      ),
    );

    final passwordField = TextFormField(
      controller: _passwordController,
      //keyboardType: TextInputType.emailAddress,
      obscureText: true,
      style: TextStyle(
        color: Colors.white,
      ),
      cursorColor: Colors.black87,
      decoration: InputDecoration(
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        hintText: "Password",
        labelText: "Password",
        labelStyle: TextStyle(
          color: Colors.white,
        ),
        hintStyle: TextStyle(
          color: Colors.white,
        ),
      ),
    );

    // final repasswordField = TextFormField(
    //   controller: _repasswordController,
    //   //keyboardType: TextInputType.emailAddress,
    //   style: TextStyle(
    //     color: Colors.white,
    //   ),
    //   cursorColor: Colors.black87,
    //   decoration: InputDecoration(
    //     focusedBorder: UnderlineInputBorder(
    //       borderSide: BorderSide(color: Colors.black),
    //     ),
    //     hintText: "Re-Password",
    //     labelText: "Re-enter Password",
    //     labelStyle: TextStyle(
    //       color: Colors.white,
    //     ),
    //     hintStyle: TextStyle(
    //       color: Colors.white,
    //     ),
    //   ),
    // );


    // final ageField = TextFormField(
    //   controller: _ageController,
    //   style: TextStyle(
    //     color: Colors.white,
    //   ),
    //   cursorColor: Colors.black87,
    //   //cursorColor: Colors.white,
    //   decoration: InputDecoration(
    //     focusedBorder: UnderlineInputBorder(
    //       borderSide: BorderSide(color: Colors.black87),
    //     ),
    //     hintText: "Age",
    //     labelText: "Age",
    //     labelStyle: TextStyle(
    //       color: Colors.white,
    //     ),
    //     hintStyle: TextStyle(
    //       color: Colors.white,
    //     ),
    //   ),
    // );
    //
    // final weightField = TextFormField(
    //   controller: _weightController,
    //   style: TextStyle(
    //     color: Colors.white,
    //   ),
    //   cursorColor: Colors.black87,
    //   //cursorColor: Colors.white,
    //   decoration: InputDecoration(
    //     focusedBorder: UnderlineInputBorder(
    //       borderSide: BorderSide(color: Colors.black87),
    //     ),
    //     hintText: "Weight",
    //     labelText: "Weight",
    //     labelStyle: TextStyle(
    //       color: Colors.white,
    //     ),
    //     hintStyle: TextStyle(
    //       color: Colors.white,
    //     ),
    //   ),
    // );
    //
    // final heightField = TextFormField(
    //   controller: _heightController,
    //   style: TextStyle(
    //     color: Colors.white,
    //   ),
    //   cursorColor: Colors.black87,
    //   //cursorColor: Colors.white,
    //   decoration: InputDecoration(
    //     focusedBorder: UnderlineInputBorder(
    //       borderSide: BorderSide(color: Colors.black87),
    //     ),
    //     hintText: "Height",
    //     labelText: "Height",
    //     labelStyle: TextStyle(
    //       color: Colors.white,
    //     ),
    //     hintStyle: TextStyle(
    //       color: Colors.white,
    //     ),
    //   ),
    // );

    final fields = Padding(
      //padding: EdgeInsets.only(top: 10.0),
      padding: EdgeInsets.fromLTRB(0, 0, 0, 40),
      //padding: EdgeInsets.only(bottom: 40.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          //usernameField,
          emailField,
          passwordField,
          //repasswordField,
          //ageField,
          //weightField,
          //heightField,
        ],
      ),
    );

    final registerButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(25.0),
      color: Colors.white,
      child: MaterialButton(
        minWidth: mq.size.width / 1.2,
        padding: EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 15.0),
        child: Text(
          "Register",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20.0, color: Colors.black, fontWeight: FontWeight.bold),
        ),
        onPressed: () async {
          try {
            userInfo =
             await FirebaseAuth.instance.createUserWithEmailAndPassword(
              email: _emailController.text, //_emailController.text
              password: _passwordController.text,
            ); //_passwordController.text
            //uid = userInfo.user.uid;
            print("success");
            print(userInfo);//userInfo.user.uid
            //userInfo.user.displayName = _usernameController.text;

            //User updateUser =  FirebaseAuth.instance.currentUser;
            //updateUser.updateProfile(displayName: _usernameController.text);

            Fluttertoast.showToast(
                msg: "Registration Successful",
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.yellow,
                textColor: Colors.black,
                fontSize: 16.0
            );
            Navigator.of(context).pushNamed(Router.ADDITIONAL); //Router.MENU
          } on FirebaseAuthException catch (e) {
            if (e.code == 'weak-password') {
              print('The password provided is too weak.');
            } else if (e.code == 'email-already-in-use') {
              print('The account already exists for that email.');
            }
          } catch (e) {
            print(e.toString());
            Fluttertoast.showToast(
                msg: e.toString(),
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.yellow,
                textColor: Colors.black,
                fontSize: 16.0
            );
          }
        }
      ),
    );

    final bottom = Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        registerButton,
        Padding(
          padding: EdgeInsets.all(8.0),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Already have an account?",
              style: Theme.of(context).textTheme.subtitle1.copyWith(
                    color: Colors.white,
                    decoration: TextDecoration.underline,
                  ),
            ),
            MaterialButton(
              onPressed: () {
                Navigator.of(context)
                    .pushNamed(Router.AUTHLOGIN); //Router.authLogin
              },
              child: Text(
                "Login",
                style: Theme.of(context)
                    .textTheme
                    .subtitle1
                    .copyWith(color: Colors.white),
              ),
            ),
          ],
        )
      ],
    );

    return Scaffold(
      backgroundColor: Colors.orange[500],
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20), //36
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              logo,
              fields,
              bottom,
              //Padding(
              //padding: EdgeInsets.only(bottom: 70),
              //child: bottom,
              //),
            ],
          ),
        ),
      ),
    );
  }
}
