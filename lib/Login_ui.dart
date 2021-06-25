import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:sacco/Sign_ui.dart';
import 'Logic/Log_in.dart';
import 'HomePage.dart' as main;
import 'FormControllers.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'WidgetUtils.dart';


class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _globalKey = GlobalKey<FormState>();
  final GlobalKey<State> _keyLoader = new GlobalKey<State>();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    if (this._isLoading) {
      return new WidgetUtils(context).spinKitWave(context);
    }
    return Scaffold(
      primary: false,
      resizeToAvoidBottomPadding: true,
      // backgroundColor: Color.fromARGB(255, 20, 0, 100),
      body: Container(
        height: MediaQuery.of(context).size.height * 1.5,
        padding: EdgeInsets.only(
          bottom: 10
        ),
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height:100.0),
              Center(
                child: Container(
                  child: Text("LOG IN!",
                  style: TextStyle(
                    fontSize: 50.0,
                    fontWeight: FontWeight.bold,
                  ) ,),)
              ),
              SizedBox(height:10.0),
               Center(
                child: Container(
                  child: Text("Please provide the following ",
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 15.0,
                    color: Colors.grey[400]
                  ) ,),)
              ),
              Center(
                child: Container(
                  child: Text("details  for your new account!",
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 15.0,
                    color: Colors.grey[400]
                  ) ,),)
              ),
              SizedBox(height:20.0),
              Form(
                key: _globalKey,
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.fromLTRB(30.0, 10.0, 40.0, 10.0),
                  child: Column(
                  children: <Widget>[
                    TextFormField(
                      controller: FormControllers.emailcontroller,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: "Email",
                        filled: true,
                        fillColor: Colors.grey[10],
                        focusedBorder:OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue[100], width: 2.0),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue[100], width: 2.0),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Username cannot be empty';
                        } else if(!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value)) {
                          return 'Please enter a valid email address';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height:20.0),
                    TextFormField(
                      obscureText: true,
                      controller: FormControllers.passwordcontroller,
                      decoration: InputDecoration(
                        suffixIcon: Icon(Icons.remove_red_eye),
                        filled: true,
                        fillColor: Colors.grey[10],
                        labelText: "Password",
                        focusedBorder:OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue[100], width: 2.0),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue[100], width: 2.0),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),
                       validator: (value) {
                        if (value.isEmpty) {
                          return 'password cannot be empty';
                        }
                        if (value.length < 6) {
                          return 'Minimum character for password is 6';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height:20.0),
                     FlatButton(
                        textColor: Colors.white,
                        height: 60.0,
                        color: Colors.cyan[400],
                        onPressed: () {
                          if(_globalKey.currentState.validate()) {

                            Log_in loginUser = new Log_in(
                              FormControllers.emailcontroller.text.trim(),
                              FormControllers.passwordcontroller.text.trim()
                            );
                            this._handleSubmit(context, loginUser);
                            print(
                              "Username ->" + FormControllers.usernameconroller.text + "\n"
                              "Email ->" + FormControllers.emailcontroller.text + "\n"
                              "Password ->" + FormControllers.passwordcontroller.text + "\n"
                              "Checkbox -> " + timeDilation.toString()
                              );
                          }
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(Icons.input_rounded, color: Colors.white,),
                            ),
                            Text('LOG IN', )
                          ],
                        ),
                      ),
                      // SignInButton(
                      //   Buttons.Google,
                      //   onPressed: () {},
                      //   text: "Log in With Google",
                      // ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: <Widget> [
                      //      SignInButton(
                      //       Buttons.GitHub,
                      //       mini: true,
                      //       onPressed: () {},
                      //     ),
                      //      SignInButton(
                      //       Buttons.Twitter,
                      //       mini: true,
                      //       onPressed: () {},
                      //     )
                      //   ]
                      // )
                  ]
                ))
              ),
              InkWell(
                  onTap: () {
                    Navigator.of(context).pushReplacement(
                      new MaterialPageRoute(builder:
                            (BuildContext context) => SignIn()));
                  },
                  child: Column(
                    children: <Widget>[
                    Center(
                        child: Text(
                          "Don't have an account?",
                            style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 13.0
                            ),
                          ),
                        ),
                        Center(
                          child: Text(
                          "Sign In \n\n\n\n",
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                            fontSize: 15.0
                          ),
                        ),
                        )
                    ]
                  ),
              ),
            ],
          ),
        )
      ),
    );
  }

    Future<void> _handleSubmit(BuildContext context, Log_in userLogin) async {
      setState(() {
        this._isLoading = true;
      });
    try {
      // new WidgetUtils(context).showLoadingDialog(context);
      UserCredential userCredential = await userLogin.loginUserWithEmailAndPassword();
       Navigator.of(context).pushReplacement(
          new MaterialPageRoute(builder:
            (BuildContext context) => main.MyApp()));
      setState(() {
        this._isLoading = false;
      });
    } on FirebaseAuthException catch (result) {
      if (result.code == 'user-not-found') {
          new WidgetUtils(context).showErrorDialog(context,
            "User not found.");
        } else if (result.code == 'wrong-password') {
            new WidgetUtils(context).showErrorDialog(context,
              "Wrong credentials.");
        }
    } catch (e) {
        print(e);
    }
  }
}