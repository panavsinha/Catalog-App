import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practice/pages/register.dart';
import 'package:flutter_practice/utils/routes.dart';
import 'package:google_fonts/google_fonts.dart';
// ignore: unused_import
import 'package:flutter_practice/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? name = "";
  bool changeButton = false;
  final _formKey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });
      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        changeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Material(
        color: context.canvasColor,
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(height: 15.0),
                Image.asset(
                  "assets/images/hey.png",
                  fit: BoxFit.cover,
                  //height: 1000,
                ),
                SizedBox(
                  height: 20,
                ),
                Text("Welcome $name",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    )),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 32.0),
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: "Enter Username",
                          labelText: "Username",
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Enter a valid input";
                          }
                          return null;
                        },
                        onChanged: (value) {
                          name = value;
                          setState(() {});
                        },
                      ),
                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: "Enter Password",
                          labelText: "Password",
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Enter a valid input";
                          } else if (value.length < 6) {
                            return "Password length must be at least 6 characters";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Material(
                        color: context.theme.buttonColor,
                        borderRadius:
                            BorderRadius.circular(changeButton ? 20 : 10),
                        child: InkWell(
                          onTap: () => moveToHome(context),
                          child: AnimatedContainer(
                            duration: Duration(seconds: 1),
                            width: changeButton ? 42 : 110,
                            height: 40,
                            alignment: Alignment.center,
                            child: changeButton
                                ? Icon(Icons.done, color: Colors.white)
                                : Text(
                                    "Login",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    text: "If you don't have an account, click on ",
                    style: GoogleFonts.lato(
                      fontSize: 15.0,
                      color: context.accentColor,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: "Register",
                        style: GoogleFonts.lato(
                          decoration: TextDecoration.underline,
                          color: Colors.indigo,
                          fontSize: 15.0,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () async {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => RegPage()));
                          },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
