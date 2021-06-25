import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sacco/WidgetUtils.dart';


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      theme: ThemeData(
        primaryColor: Color.fromARGB(255, 20, 0, 100),
      )
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

    final List<Map<String, dynamic>> _items = [
        {
          'value': 'boxValue',
          'label': 'Box Label',
          'icon': Icon(Icons.stop),
        },
        {
          'value': 'circleValue',
          'label': 'Circle Label',
          'icon': Icon(Icons.fiber_manual_record),
          'textStyle': TextStyle(color: Colors.red),
        },
        {
          'value': 'starValue',
          'label': 'Star Label',
          'enable': true,
          'icon': Icon(Icons.grade),
        },
        ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new WidgetUtils(context).showAppBar(),
      drawer: new WidgetUtils(context).showDrawer(),
      body: Container(
        color: Color(0xFFbdc3c7),
        height: MediaQuery.of(context).size.height*1.5,
        // padding: EdgeInsets.only(
        //   bottom: 10
        // ),
        width: MediaQuery.of(context).size.width,
      child: Container(
        margin: EdgeInsets.symmetric(
              horizontal: 20, vertical: 10
        ),
          child: SingleChildScrollView(
        child: Column(
          children: <Widget> [
            Row (
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget> [
                new SizedBox(
                width: MediaQuery.of(context).size.width / 2.4,
                child: new WidgetUtils(context).showDropDown("From", _items)
                ),

                new SizedBox(
                width: MediaQuery.of(context).size.width / 20,
                ),

                new SizedBox(
                width: MediaQuery.of(context).size.width / 2.4,
                child: new WidgetUtils(context).showDropDown("To", _items)
                )
              ]
            ),
              new SizedBox(
                  height:MediaQuery.of(context).size.height * 0.02,
                  // width: MediaQuery.of(context).size.width / 20,
              ),

              new SizedBox(
                // width: MediaQuery.of(context).size.width / 2.4,
                child: new WidgetUtils(context).showDropDown("Transaction Type",
                  _items)
              ),

              new SizedBox(
                  height:MediaQuery.of(context).size.height * 0.03,
                  // width: MediaQuery.of(context).size.width / 20,
              ),

            new WidgetUtils(context).showReports(),
          ]
        ),
      )
      )
      ),
      bottomNavigationBar: new WidgetUtils(context).showBottomNavBar(1) ,
    );
  }
}

