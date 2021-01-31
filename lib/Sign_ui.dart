import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:sacco/Logic/FirebaseUtils.dart';
import 'package:sacco/Logic/SignUp.dart';
import 'package:sacco/Login_ui.dart';
import 'package:sacco/WidgetUtils.dart';
import 'FormControllers.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sacco/HomePage.dart' as main;

class SignIn extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<SignIn> {
  final _globalKey = GlobalKey<FormState>();
  final GlobalKey<State> _keyLoader = new GlobalKey<State>();
  bool _isLoading = false;


  @override
  Widget build(BuildContext context) {
    // if (this._isLoading) {
    //   return new WidgetUtils(context).spinKitWave(context);
    // };
    return Scaffold(
      primary: false,
      // resizeToAvoidBottomPadding: true,
      // backgroundColor: Color.fromARGB(255, 20, 0, 100),
      body: Container(
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.only(
          bottom: 10
        ),
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height:80.0),
              Center(
                child: Container(
                  child: Text("Welcome!",
                  style: TextStyle(
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                  ) ,),)
              ),
              SizedBox(height:15.0),
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
                      controller: FormControllers.usernameconroller,
                      decoration: InputDecoration(
                        labelText: "Full Name",
                        filled: true,
                        fillColor: Colors.grey[10],
                        hoverColor: Colors.blue[100],
                        focusedBorder: OutlineInputBorder(
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
                          return 'Full name cannot be empty';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height:10.0),
                    TextFormField(
                      controller: FormControllers.emailcontroller,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: "Email Address",
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
                          return 'Email cannot be empty';
                        } else if(!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value)) {
                          return 'Please enter a valid email address';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height:10.0),
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
                          return 'Password cannot be empty';
                        }
                        if (value.length < 6) {
                          return 'Minimum characters for password is 6';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height:10.0),
                    CheckboxListTile(
                      title: Text("By selecting this box you agree to our terms and conditions",
                      style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontSize: 15.0,
                          color: Colors.grey[400]
                        )),
                      value: timeDilation != 1.0,
                      controlAffinity: ListTileControlAffinity.leading,
                      onChanged: (newValue) {
                        setState(() {
                         timeDilation = newValue ? 3.0 : 1.0;
                        });
                       },
                    ),
                     FlatButton(
                        textColor: Colors.white,
                        height: 60.0,
                        color: Colors.cyan[400],
                        onPressed: () {
                          if(_globalKey.currentState.validate()) {
                            SignUp userSignUp =
                              SignUp(
                                FormControllers.usernameconroller.text,
                                FormControllers.emailcontroller.text,
                                FormControllers.passwordcontroller.text,
                                3.0 == timeDilation);
                                this._handleSubmit(context, userSignUp);
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
                            Text('SIGN UP', )
                          ],
                        ),
                      ),
                      SignInButton(
                        Buttons.Google,
                        onPressed: () {

                        },
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget> [
                           SignInButton(
                            Buttons.Facebook,
                            mini: true,
                            onPressed: () {},
                          ),
                           SignInButton(
                            Buttons.GitHub,
                            mini: true,
                            onPressed: () {},
                          ),
                           SignInButton(
                            Buttons.Twitter,
                            mini: true,
                            onPressed: () {},
                          )
                        ]
                      )
                  ]
                ))
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).pushReplacement(
                    new MaterialPageRoute(builder:
                          (BuildContext context) => Login()));
                },
                child: Column(
                  children: <Widget>[
                  Center(
                      child: Text(
                        "Already have an account?",
                          style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 13.0
                          ),
                        ),
                      ),
                      Center(
                        child: Text(
                        "Log In \n\n\n\n",
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

  Future<void> _handleSubmit(BuildContext context, SignUp userSignUp) async {
    try {
      new WidgetUtils(context).showLoadingDialog(context);
      UserCredential userCredential = await userSignUp.saveUser();
       Navigator.of(context).pushReplacement(
          new MaterialPageRoute(builder:
              (BuildContext context) => main.MyApp()));
    } on FirebaseAuthException catch (result) {
      if (result.code == 'weak-password') {
          new WidgetUtils(context).showErrorDialog(context,
            "The password provided is too weak.");
        } else if (result.code == 'email-already-in-use') {
            new WidgetUtils(context).showErrorDialog(context,
              "An account with that email already exists.");
        }
    } catch (e) {
        print(e);
    }
  }
}