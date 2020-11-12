import 'package:flutter/material.dart' hide Router;
import 'package:provider_architecture/ui/router.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

class OpeningView extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();


  @override
  Widget build(BuildContext context) {
    //return Container();
    final mq = MediaQuery.of(context);

    final logo = Hero(
      tag: 'imageHero',
      child: Image.asset(
        "lib/assets/images/logo.png",
        fit: BoxFit.contain,
        //height: 250,
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
          onPressed: () {
            Navigator.of(context)
                .pushNamed(Router.AUTHLOGIN); //Router.authLogin
          },
        ));

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
                fontSize: 20.0,
                color: Colors.black,
                fontWeight: FontWeight.bold),
          ),
          onPressed: () {
            Navigator.of(context)
                .pushNamed(Router.AUTHREGISTER); //Router.authRegister
          },
        ));

    final buttons = Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        loginButton,
        Padding(
          padding: EdgeInsets.all(14),
        ),
        registerButton,
      ],
    );

    return Scaffold(
      backgroundColor: Colors.orangeAccent,
      body: Padding(
        padding: EdgeInsets.all(45), //36
        //padding: EdgeInsets.fromLTRB(0, 15, 0, 70),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 0), //3
            ),
            logo,
            Text(
              "FitMe Personal Coach",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24,fontFamily: 'quicksand_bold'),
            ),
            buttons,
          ],
        ),
      ),
    );
  }
}
