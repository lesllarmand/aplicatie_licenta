// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:service_now/authentification_Pages/login_page.dart';
import 'package:service_now/authentification_Pages/registration_page.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  @override
  Widget build(BuildContext context) {
    // create buttons so that the user will have options to choose from:
    // login, create account or signUp via facebook, gmail etc..
    //
    // crate account button which will redirect the user tot the register page
    final createAccountButton = Material(
      color: Colors.greenAccent,
      elevation: 5,
      borderRadius: BorderRadius.circular(25),
      child: MaterialButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => RegisterScreen()));
        },
        child: Text(
          "SignUp",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 15.5),
        ),
        padding: EdgeInsets.fromLTRB(21, 16, 21, 16),
        //minWidth: MediaQuery.of(context).size.width,
      ),
    );

    // login button which will redirect the user to the login page
    final logInButton = Material(
      color: Colors.greenAccent,
      elevation: 5,
      borderRadius: BorderRadius.circular(25),
      child: MaterialButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => LoginScreen()));
        },
        child: Text(
          "Login",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 15.5),
        ),
        padding: EdgeInsets.fromLTRB(21, 16, 21, 16),
        //minWidth: MediaQuery.of(context).size.width,
      ),
    );

    return Scaffold(
        extendBodyBehindAppBar: true,
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 200,
                  child: Image.asset(
                    "assets/attractiveServiceLogo.png",
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  "Welcome to Service Now !",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 40),
                // we use row here in order to have the buttons side by side
                Row(
                  children: <Widget>[
                    SizedBox(width: 62),
                    createAccountButton,
                    SizedBox(width: 10),
                    Text(" OR  ",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold)),
                    SizedBox(width: 10),
                    logInButton,
                    //SizedBox(width: 45),
                  ],
                ),
                SizedBox(height: 200)
              ],
            ),
          ),
        ));
  }
}
