import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sacco/Logic/FirebaseUtils.dart';
import 'package:sacco/profile_ui.dart';
import 'HomePage.dart' as main;
import 'Login_ui.dart' as login;
import 'reports_ui.dart' as reports;
import 'changePasswordUI.dart' as changePassword;
import 'profile_ui.dart' as prof;
import 'package:select_form_field/select_form_field.dart' as selectBox;
import 'package:flutter_spinkit/flutter_spinkit.dart' as spinkit;

class WidgetUtils {

  BuildContext context;
  User cUser;
  WidgetUtils(BuildContext con) {
    this.context = con;
    this.cUser = new FirebaseUtils().getUser();

  }

  Widget showDrawer() {
    return Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountEmail:  Text((() {
                if(cUser!=null && cUser.email != null){
                  return cUser.email;
                }
                return "---";
              })()),
              accountName: Text((() {
                if(cUser!=null && cUser.displayName != null){
                  return cUser.displayName;
                }
                return "---";
              })()),
              currentAccountPicture: CircleAvatar(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image(
                    image: AssetImage("assets/download.jpeg")
                    ),
                ),
              ),
            ),
            ListTile(
              title: Text("Home"),
              onTap: () {}
            ),

            ListTile(
              title: Text("Change Password"),
              onTap: () {
                Navigator.of(context)
                  .pushReplacement(MaterialPageRoute(builder:
                    (context) => changePassword.ChangePassword()));
              }
            ),

            ListTile(
              title: Text("Email us"),
              onTap: () {}
            ),

            ListTile(
              title: Text("Call us"),
              onTap: () {}
            ),

            ListTile(
              title: Text("log Out"),
              onTap: () async {
                loginGuard();
                Navigator.of(context).pushReplacement(
                  new MaterialPageRoute(builder:
                  (BuildContext context) => login.Login()));
                await FirebaseAuth.instance.signOut();
              }
            ),
          ],
        ),
      );
  }

  Widget showBottomNavBar(int page) {
    return BottomNavigationBar(
        items: [
        BottomNavigationBarItem(
          icon: Icon(
            FontAwesomeIcons.home,
          ),
          title:Text("Wallet")
        ),
        BottomNavigationBarItem(
          icon: Icon(
            FontAwesomeIcons.receipt,
          ),
          title:Text("Reports")
        ),
        BottomNavigationBarItem(
          icon: Icon(
            FontAwesomeIcons.user,
          ),
          title:Text("Account")
        ),
      ],

      onTap: (i) {
        this.navSwitch(i);
      },
      currentIndex: page,
      type: BottomNavigationBarType.fixed,
      unselectedItemColor: Colors.white,
      selectedItemColor: Color(0xFFe67e22),
      backgroundColor: Color.fromARGB(255, 20, 0, 100),
      );
  }

  Widget showCard(IconData leadingIcon, String title,
      Color color, String trailing) {
    return Card(
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
            leadingIcon,
            color: color,
          ),
        ),
        title: Text(title),
        trailing: Text(trailing),
      ),
    );
  }

  Widget showAppBar() {
    return AppBar(
        title: Center(
          child: Text("Wallet"),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(FontAwesomeIcons.bell),
            onPressed: (){},
            )
        ],
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 20, 0, 100),
        brightness: Brightness.dark,
        textTheme: TextTheme(
          title: TextStyle(
            color: Colors.white,
            fontSize: 20
          )
        ),
        iconTheme:IconThemeData(
          color:Colors.white,

        ),
      );
  }

  void navSwitch(int i) {
    switch (i) {
      case 0:
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => main.MyApp()));
        break;
      case 1:
         Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => reports.MyApp()));
        break;
      case 2:
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => prof.ProfilePage()));
        break;
    }
  }

  Widget showDropDown(String label,
    List<Map<String, dynamic>> values) {
      return selectBox.SelectFormField(
        initialValue: values[1]["value"],
        // icon: Icon(Icons.format_shapes),
        labelText: label,
        items: values,
        onChanged: (val) => print(val),
        onSaved: (val) => print(val),
        );
  }

  Widget showReports() {
    return Container(
        alignment: Alignment.topLeft,
        child:Container(
            child: Column(
              children: <Widget>[
                new WidgetUtils(context).showCard(
                  Icons.account_balance_wallet, "Deposit",
                  Color(0xFFf1c40f), "\$8000"),

                new WidgetUtils(context).showCard(
                  Icons.account_balance_wallet, "Desposit",
                  Color(0xFFf1c40f), "\$18000"),

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
        );
      }

    Widget startUpError(context,message) {
      // flutter defined function
      return AlertDialog(
        elevation:1.0,
        title: new Text("Error"),
        content: new Text(message),
        actions: <Widget>[
        // usually buttons at the bottom of the dialog
          new FlatButton(
            child: new Text("Wait"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          new FlatButton(
            child: new Text("Close"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    }

  Widget spinKitWave(context) {
    return Scaffold(
      body:Center(
          child:  spinkit.SpinKitWave(
          color: Colors.blue[400],
          size: 50.0,
          itemCount: 5,
          duration: Duration(milliseconds: 1200),
        )
      )
    );
  }

  static loginGuard() {
    FirebaseUtils.getFirebaseInstance()
     .authStateChanges()
    .listen((User user) {
      if (user == null) {
        return login.Login();
      }
    });
  }

  void showErrorDialog(context, message, ) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        Future.delayed(Duration(seconds: 10), () {
          Navigator.of(context).pop(true);
        });
        // return object of type Dialog
        return AlertDialog(
          elevation:1.0,
          title: new Text("Error"),
          content: new Text(message),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

    void showLoadingDialog(context) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        Future.delayed(Duration(seconds: 3), () {
          Navigator.of(context).pop(true);
        });
        // return object of type Dialog
        return spinKitWave(context);
      },
    );
  }

  // Future<void> showLoadingDialog(
  //     BuildContext context, GlobalKey key) async {
  //   return showDialog<void>(
  //       context: context,
  //       barrierDismissible: false,
  //       builder: (BuildContext context) {
  //         Future.delayed(Duration(seconds: 5), () {
  //           Navigator.of(context).pop(true);
  //         });
  //         return new WillPopScope(
  //             onWillPop: () async => false,
  //             child: SimpleDialog(
  //                 key: key,
  //                 backgroundColor: Colors.black54,
  //                 children: <Widget>[
  //                   Center(
  //                     child: Column(children: [
  //                       spinkit.SpinKitWave(
  //                         color: Colors.blue[400],
  //                         size: 50.0,
  //                         itemCount: 5,
  //                         duration: Duration(milliseconds: 1200),
  //                       ),
  //                       SizedBox(height: 10,),
  //                       Text("Please Wait....",style: TextStyle(color: Colors.blueAccent),)
  //                     ]),
  //                   )
  //                 ]));
  //       });
  // }
}
