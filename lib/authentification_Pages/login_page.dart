// ignore_for_file: unnecessary_new, avoid_unnecessary_containers, prefer_const_constructors, sort_child_properties_last, body_might_complete_normally_catch_error, avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:service_now/User_Logged_In/homepageEmailAndPassword.dart';
import 'package:service_now/Utils/next_screen.dart';
import 'package:service_now/authentification_Pages/registration_page.dart';
import 'package:service_now/Utils/showSnackBar.dart';
import 'package:service_now/authentification_Pages/welcome_page.dart';

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

  //calling our firebase
  final _authLogin = FirebaseAuth.instance;

  // inside this widget I have created the email and password fields (functionalities + design for each one)
  @override
  Widget build(BuildContext context) {
    //
    // create email field
    final emailField = TextFormField(
      controller: emailController,
      autofocus: false,
      keyboardType: TextInputType.emailAddress,
      // this validator will have a value that will be later used in some if conditions
      validator: (value) {
        if (value!.isEmpty) {
          return ("Please enter your Email address!");
        }
        // RegExp for email validation --> desired format for an email to be considered valid
        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
          return ("Please enter a valid Email address!");
        }
        return null;
      },
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

    //
    // create password field
    //
    final passwordField = TextFormField(
      controller: passwordController,
      obscureText: true,
      autofocus: false,
      validator: (value) {
        // I added this here so that the user MUST enter a password of minimum 6 characters.
        RegExp regexp = new RegExp(r'^.{6,}$');
        // if no password written, show message
        if (value!.isEmpty) {
          return ("Please enter your password!");
        }
        // if not enough characters for a valid password, show message
        if (!regexp.hasMatch(value)) {
          return ("Wrong format. Minimum 6 characters.");
        }
        return null;
      },
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
        onPressed: () {
          login(emailController.text, passwordController.text);
        },
        child: Text(
          "Login",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 15.5),
        ),
        padding: EdgeInsets.fromLTRB(21, 16, 21, 16),
      ),
    );

    return Scaffold(
      // THIS IS USED TO REMOVE THE SPACE BETWEEN THE APPBAR and the BODY
      extendBodyBehindAppBar: true,
      // create an appBar which will contain a functional button to go back
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        // arrow button to redirect to previous page
        leading: IconButton(
            icon: Icon(Icons.arrow_back_rounded, color: Colors.green),
            onPressed: () {
              nextScreenReplace(context, const WelcomePageScreen());
            }),
      ),
      backgroundColor: Colors.white,
      // backgroundColor: Color.fromRGBO(131, 133, 187, 133),
      body: Center(
        child: SingleChildScrollView(
            child: Container(
          color: Colors.white,
          //color: Color.fromARGB(131, 133, 187, 133),
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
                    height: 215,
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
                        // this should redirect the user to the registration page, whenever he clicks the SignUp text
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RegisterScreen()));
                        },
                        child: Text(
                          " SignUp",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
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

  // here I have my functions for this file
  //
  // login function
  void login(String email, String password) async {
    try {
      await _authLogin
          .signInWithEmailAndPassword(
            email: email,
            password: password,
          )
          .then(
              // if the login is successfull we will parse the value uid - userd id
              (uid) => {
                    Fluttertoast.showToast(msg: "Login was Successfull !"),
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => HomePageEP()),
                    )
                  });
    } on FirebaseAuthException catch (e) {
      if (e.message == 'Given String is empty or null') {
        showSnackBar(context, 'Please fill in all the required fields!');
      } else if (e.message ==
          'There is no user record corresponding to this identifier. The user may have been deleted.') {
        showSnackBar(context, 'This email is not registered !');
      } else if (e.message ==
          'The password is invalid or the user does not have a password.') {
        showSnackBar(context,
            'The password is not correct. Please try again or Sign In with another method!');
      } else {
        showSnackBar(context, e.message!); // Displaying the error message
      }
    }
  }
}
