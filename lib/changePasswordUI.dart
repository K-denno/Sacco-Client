import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sacco/Login_ui.dart';
import 'package:sacco/WidgetUtils.dart';
import 'package:sacco/splashScreen.dart' as splash;
import 'package:sacco/Sign_ui.dart' as signIn;
import 'Sign_ui.dart';

class ChangePassword extends StatefulWidget {

  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new WidgetUtils(context).showAppBar(),
      drawer: new WidgetUtils(context).showDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Center(
              child: Container(
                child: Image(
                  image: AssetImage('assets/download.jpeg'),
                  ),
              )
            ),
            SizedBox(width:20, height: 20),
            Center(
              child:  Text(
                  "CHANGE PASSOWRD UI",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  )
                ),
              )
        ],)
      ),
      bottomNavigationBar: new WidgetUtils(context).showBottomNavBar(2),
    );
  }
}