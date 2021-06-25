import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sacco/Logic/FirebaseUtils.dart';
import 'package:sacco/HomePage.dart' as main;
import 'package:sacco/Sign_ui.dart' as sign;

import '../WidgetUtils.dart';

class Log_in {

  String email;
  String password;

  Log_in (String mail, String pass) {
    this.email = mail;
    this.password = pass;
  }

  loginUserWithEmailAndPassword() async {
     UserCredential userCredential =
        await FirebaseUtils.getFirebaseInstance().signInWithEmailAndPassword(
        email: this.email,
        password: this.password);

      return userCredential;
  }
}