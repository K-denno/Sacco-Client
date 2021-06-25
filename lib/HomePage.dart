import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sacco/Login_ui.dart';
import 'package:sacco/WidgetUtils.dart';
import 'package:sacco/splashScreen.dart' as splash;
import 'package:sacco/Sign_ui.dart' as signIn;
import 'Sign_ui.dart';

void main() {
  runApp( new MaterialApp(
    // home: splash.MyApp()
    // home: signIn.SignIn()
    home: MyHomePage(),
  ));
}

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



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: new WidgetUtils(context).showAppBar(),
      drawer: new WidgetUtils(context).showDrawer(),
    body: Container(
      height: MediaQuery.of(context).size.height*1.5,
      color: Color(0xFFbdc3c7),
      padding: EdgeInsets.only(
        bottom: 10
      ),
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height*0.350,
              padding: EdgeInsets.only(
                bottom: 10
              ),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 20, 0, 100),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40)
                )
              ),
              child: Container(
                child: Column(
                  children: <Widget>[
                    Container(
                      height: MediaQuery.of(context).size.height*0.0300,
                      margin: EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "Current Balance",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            )
                          ),
                          Text("KSH",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          )
                        ]
                      ),
                    ),

                      Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "\$32,675",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold
                            )
                          ),

                          Container(
                            decoration: BoxDecoration(
                              color: Color(0xFF2ecc71),
                              borderRadius: BorderRadius.circular(16)
                            ),
                            padding: EdgeInsets.symmetric(
                              horizontal: 8, vertical: 2
                            ),
                            child: Text(
                              "+ 3.5%",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                          )
                        ]
                      ),
                    ),
                    SizedBox(height:80),

                    Container(
                      margin: EdgeInsets.symmetric(
                        horizontal:20, vertical: 10
                      ),
                      child: Row (
                        children: <Widget>[
                          Text(
                            "3.4557662 BTC",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16

                            ),
                          )
                        ]
                      ),
                    )

                  ]
                ),
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                // width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height*0.26,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFFe67e22),
                      Color(0xFFf1c40f),
                    ]
                  )
                ),
              ),
            ),

            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 20, vertical:10
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                Expanded(
                  child: RaisedButton.icon(
                    label: Text(
                      "Deposit"
                    ),
                    icon: Icon(
                      FontAwesomeIcons.levelUpAlt,
                      color: Color(0xFF3498db),
                    ),
                    onPressed: () {},
                     shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)
                    ),
                  ),
                ),
              SizedBox(width:20),
                Expanded(
                  child: RaisedButton.icon(
                    label: Text(
                      "Withdraw"
                    ),
                    icon: Icon(
                      FontAwesomeIcons.levelDownAlt,
                      color: Color(0xFF2ecc71),
                    ),
                    onPressed: () {},
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)
                    ),
                  ),
                ),

              ],
            )
          ),

          Container(
            margin: EdgeInsets.symmetric(
              horizontal: 20
            ),
            alignment: Alignment.topLeft,
            child:Text(
              "Currency",
              style: TextStyle (
                fontSize: 22,

              ),
            )
          ),


          Container(
            margin: EdgeInsets.symmetric(
              horizontal: 20, vertical: 10
            ),
            alignment: Alignment.topLeft,
            child:Container(
                child: Column(
                  children: <Widget>[
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)
                      ),
                      child: ListTile(
                        contentPadding: EdgeInsets.symmetric(
                          horizontal:20, vertical:10
                        ),
                        leading: CircleAvatar(
                          backgroundColor: Color(0xFFe67e22),
                          child:Icon(
                            Icons.input,
                            color: Color(0xFFf1c40f),
                          ),
                        ),
                        title: Text("Deposit"),
                        trailing: Text("\$8000"),
                      ),
                    ),

                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)
                      ),
                      child: ListTile(
                        contentPadding: EdgeInsets.symmetric(
                          horizontal:20, vertical:10
                        ),
                        leading: CircleAvatar(
                          backgroundColor: Color(0xFFe67e22),
                          child:Icon(
                            Icons.input,
                            color: Color(0xFFf1c40f),
                          ),
                        ),
                        title: Text("Deposit"),
                        trailing: Text("\$18000"),
                      ),
                    ),
                    new WidgetUtils(context).showCard(
                      Icons.ac_unit, "Withdraw",
                      Color(0xFF474025), "\$7000"),

                    new WidgetUtils(context).showCard(
                      Icons.ac_unit, "Withdraw",
                      Color(0xFF474025), "\$7000"),

                    new WidgetUtils(context).showCard(
                      Icons.ac_unit, "Withdraw",
                      Color(0xFF474025), "\$7000"),
                  ],
                ),

                )
              ),

            ],
          )
        )
      ),

      bottomNavigationBar: new WidgetUtils(context).showBottomNavBar(0) ,
    );
  }
}

