import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sacco/Logic/FirebaseUtils.dart';
import 'package:sacco/HomePage.dart' as main;
import 'package:sacco/Sign_ui.dart' as sign;

import '../WidgetUtils.dart';

class SignUp {

  String fullname;
  String email;
  String password;
  bool isTermsAccepted;

  SignUp (String name, String mail, String password, bool terms) {
    this.fullname = name;
    this.email = mail;
    this.password = password;
    this.isTermsAccepted = terms;
  }

  saveUser() async {
     UserCredential userCredential =
          await FirebaseUtils.getFirebaseInstance().createUserWithEmailAndPassword(
            email: this.email,
            password: this.password
        );
    return userCredential;
  }
}