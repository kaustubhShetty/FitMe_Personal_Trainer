import 'dart:async';
import 'dart:core';
import 'dart:io';

import 'package:provider_architecture/ui/views/register_screen.dart';
import 'package:provider_architecture/ui/views/additional_details.dart';
import 'package:provider_architecture/ui/views/register_screen.dart';
import 'package:provider_architecture/ui/views/login_screen.dart';
import 'package:provider_architecture/ui/views/opening_screen.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;
FirebaseAuth auth = FirebaseAuth.instance;

class DB {
  Future<void> addUser(
      String uid, String username, double age, double weight, double height) {
    firestore.collection('User').doc(auth.currentUser.uid).set({
      "Username": username,
      "Age": age,
      "Weight": weight,
      "Height": height
    }).catchError((error) => print("Failed to add User: $error"));
  }

  Future<Map<String,dynamic>> getData(String uid) async{
    DocumentSnapshot details =  await firestore.collection('User').doc(uid).get();
    //print(uid);
    //print(details.data());
    return details.data();
  }

  // Future<double> getWeight() async {
  //   DocumentSnapshot details = await firestore.collection('User')
  //       .doc(uid)
  //       .get();
  //   return details.data()['Weight'];
  // }
  //
  // Future<double> getHeight() async {
  //   DocumentSnapshot details = await firestore.collection('User')
  //       .doc(uid)
  //       .get();
  //   return details.data()['Height'];
  // }
}
