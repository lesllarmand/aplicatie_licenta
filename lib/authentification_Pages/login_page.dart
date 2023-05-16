// ignore_for_file: unnecessary_new, avoid_unnecessary_containers, prefer_const_constructors

import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //
  // form key, helpful in validating the email and password field when an user clicks the Login button
  final _formKey = GlobalKey<FormState>();

  // editing controllers for email and password
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

  // inside this widget I have created the email and password fields (functionalities + design for each one)
  @override
  Widget build(BuildContext context) {
    //
    // create email field
    final emailField = TextFormField(
      controller: emailController,
      autofocus: false,
      keyboardType: TextInputType.emailAddress,
      //validator: () {},
      // this onSaved function will be saving the value whenever a user types in something
      onSaved: (value) {
        emailController.text = value!;
      },
      // create an input action - definition: an input action is when a user clicks on the email field and on the
      // right bottom side of the keyboard there will be an option of clicking next.
      textInputAction: TextInputAction.next,
      // design for the email field
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        prefixIcon: Icon(Icons.mail),
        hintText: "Email",
        contentPadding: EdgeInsets.fromLTRB(21, 16, 21, 16),
      ),
    );

    // create password field
    final passwordField = TextFormField(
      controller: passwordController,
      autofocus: false,
      //validator: () {},
      onSaved: (value) {
        passwordController.text = value!;
      },
      textInputAction: TextInputAction.done,
      // design for the password field
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        prefixIcon: Icon(Icons.vpn_key_rounded),
        hintText: "Password",
        contentPadding: EdgeInsets.fromLTRB(21, 16, 21, 16),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
            child: Container(
          color: Colors.white,
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[emailField, passwordField],
            ),
          ),
        )),
      ),
    );
  }
}
