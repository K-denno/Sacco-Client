import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:sacco/HomePage.dart' as home;
// void main(){
//   runApp(new MaterialApp(
//     home: new MyApp(),
//   ));
// }


class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image(
            image: AssetImage('assets/splash.jpg'),
            fit: BoxFit.cover,
            color: Colors.black87,
            colorBlendMode: BlendMode.darken,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: Image(
                  image: AssetImage('assets/download.jpeg'),
                  width: 800,
                  height: 650,
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(
                  top: 10
                ),
              ),
              Center(
                child: new LinearProgressIndicator(
                  backgroundColor: Colors.blueAccent,
                  valueColor: new AlwaysStoppedAnimation<Color>(Colors.blue),

                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}