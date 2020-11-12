import 'package:flutter/material.dart' hide Router;
import 'opening_screen.dart';
import 'package:provider_architecture/ui/router.dart';
import 'package:provider_architecture/ui/views/register_screen.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);

    final logo = Hero(
      tag: 'imageHero',
      child: Image.asset(
        "lib/assets/images/logo.png",
        fit: BoxFit.contain,
      ),
    );

    final emailField = TextFormField(
      controller: _emailController,
      keyboardType: TextInputType.emailAddress,
      style: TextStyle(
        color: Colors.white,
      ),
      decoration: InputDecoration(
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.blueAccent),
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

    final passwordField = Column(children: [
      TextFormField(
        controller: _passwordController,
        //keyboardType: TextInputType.emailAddress,
        obscureText: true,
        style: TextStyle(
          color: Colors.white,
        ),
        cursorColor: Colors.black87,
        decoration: InputDecoration(
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black87),
          ),
          hintText: "password",
          labelText: "password",
          labelStyle: TextStyle(
            color: Colors.white,
          ),
          hintStyle: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.all(2.0),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          MaterialButton(
            child: Text(
              "Forgot Password",
              style: Theme.of(context)
                  .textTheme
                  .caption
                  .copyWith(color: Colors.white),
            ),
            onPressed: () {
              //TODO: Create forgot password popup
            },
          ),
        ],
      ),
    ]);

    final fields = Padding(
      //padding: EdgeInsets.only(top: 10.0),
      padding: EdgeInsets.zero,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          emailField,
          passwordField,
        ],
      ),
    );

    final loginButton = Material(
        elevation: 5.0,
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.white,
        child: MaterialButton(
          minWidth: mq.size.width / 1.2,
          padding: EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 15.0),
          child: Text(
            "Login",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20.0,
                color: Colors.black,
                fontWeight: FontWeight.bold),
          ),
          onPressed: () async {
            try {
              //UserCredential user =
              await FirebaseAuth.instance.signInWithEmailAndPassword(
                email: _emailController.text,
                password: _passwordController.text,
              );
              Fluttertoast.showToast(
                  msg: "Login Successful",
                  toastLength: Toast.LENGTH_LONG,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.yellow,
                  textColor: Colors.black,
                  fontSize: 16.0
              );
              Navigator.of(context).pushNamed(Router.MENU);
              print(userInfo);
            } on FirebaseAuthException catch (e) {
              if (e.code == 'weak-password') {
                print('The password provided is too weak.');
              } else if (e.code == 'email-already-in-use') {
                print('The account already exists for that email.');
              }
            } catch (e) {
              print(e);
            }
            //TODO: Alert Dialog with Error
          },
        ));

    final bottom = Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        loginButton,
        Padding(
          padding: EdgeInsets.all(8.0),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Not a member?",
              style: Theme.of(context).textTheme.subtitle1.copyWith(
                    color: Colors.white,
                    decoration: TextDecoration.underline,
                  ),
            ),
            MaterialButton(
              onPressed: () {
                Navigator.of(context)
                    .pushNamed(Router.AUTHREGISTER); //Router.authRegister
              },
              child: Text(
                "Sign Up",
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
          padding: EdgeInsets.all(36),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              logo,
              fields,
              Padding(
                padding: EdgeInsets.only(bottom: 70),
                child: bottom,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
