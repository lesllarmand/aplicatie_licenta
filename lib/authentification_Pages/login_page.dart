// ignore_for_file: unnecessary_new, avoid_unnecessary_containers, prefer_const_constructors, sort_child_properties_last

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
      obscureText: true,
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

    // after entering email and password for an existing account, have a button that logs the user into that account
    final loginButton = Material(
      color: Colors.greenAccent,
      elevation: 5,
      borderRadius: BorderRadius.circular(25),
      child: MaterialButton(
        onPressed: () {},
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
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
            child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(50.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  // add the logo of the application when the user wants to login
                  SizedBox(
                    // this is the actual size of the logo ( how big or how small it is )
                    height: 230,
                    child: Image.asset(
                      "assets/attractiveServiceLogo.png",
                      fit: BoxFit.contain,
                    ),
                  ),
                  // give space between boxes, images or other stuff in the page
                  SizedBox(height: 40),
                  emailField,
                  // give space between boxes, images or other stuff in the page
                  SizedBox(height: 22),
                  passwordField,
                  // give space between boxes, images or other stuff in the page
                  SizedBox(height: 50),
                  loginButton,
                  // give space between boxes, images or other stuff in the page
                  SizedBox(height: 15),
                  // SignUp
                  // below login button: add message for not having an account yet and a SignUp that redirects user to register page
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Don't have an account?"),
                      // this will detect when an user will click on it
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          " SignUp",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        )),
      ),
    );
  }
}
