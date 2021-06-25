import 'dart:developer';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// Import the firebase_core plugin
import 'package:firebase_core/firebase_core.dart';
import 'package:sacco/Logic/FirebaseUtils.dart';
import 'package:sacco/Sign_ui.dart';
import 'package:sacco/WidgetUtils.dart';
import 'package:sacco/HomePage.dart' as mainPage;
import 'package:sacco/splashScreen.dart' as splash;
import 'Login_ui.dart' as login;
import 'package:flutter_config/flutter_config.dart';



// void main() async {
//   FirebaseAnalytics analytics = FirebaseAnalytics();
//   WidgetsFlutterBinding.ensureInitialized();
//   await FlutterConfig.loadEnvVariables();
//   runApp( new MaterialApp(
//     // home: splash.MyApp()
//     // home: signIn.SignIn()
//     home: MainApp(),
//     navigatorObservers: [
//       // FirebaseAnalyticsObserver(analytics: analytics),
//     ],
//   ));
// }

class MainApp extends StatefulWidget {
  _AppState createState() => _AppState();
}

class _AppState extends State<MainApp> {
  // Set default `_initialized` and `_error` state to false
  bool _initialized = false;
  bool _error = false;
  String _startUpError = "";

  // Define an async function to initialize FlutterFire
  void initializeFlutterFire() async {
    try {
      // Wait for Firebase to initialize and set `_initialized` state to true
      await Firebase.initializeApp();
      setState(() {
        _initialized = true;
      });
    } catch(e) {
      print("Initialise Firebase Exception -> " + e.toString());
      // Set `_error` state to true if Firebase initialization fails
      setState(() {
        _error = true;
        _startUpError = e.toString();
      });
    }
  }

  @override
  void initState() {
    initializeFlutterFire();
    // loginGuard();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Show error message if initialization failed
    if(_error) {
      return new WidgetUtils(context).startUpError(context,
        _startUpError);
    }

    // Show a loader until FlutterFire is initialized
    if(!_initialized) {
      return splash.MyApp();
    }

    print("Start Up was a success");
    User user = new FirebaseUtils().getUser();
    if (user != null) {
      print("user is not null + " + user.email);
      return mainPage.MyApp();
    } else {
      print("user is null");
      return login.Login();
    }
    // return SignIn();
  }

  loginGuard() {
    FirebaseUtils.getFirebaseInstance()
     .authStateChanges()
    .listen((User user) {
      if (user == null) {
        return login.Login();
      }
    });
  }
}
