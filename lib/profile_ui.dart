import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sacco/WidgetUtils.dart';


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProfilePage(),
      theme: ThemeData(
        primaryColor: Color(0xFF34495E),
      )
    );
  }
}

class ProfilePage extends StatefulWidget {

  @override
  _ProfilePagState createState() => _ProfilePagState();
}

class _ProfilePagState extends State<ProfilePage> {


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
                  "WORK IN PROGRESS",
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

