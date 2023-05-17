// ignore_for_file: unnecessary_new, unused_field, unused_local_variable, prefer_const_constructors

import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
// form key
  final _formKey = GlobalKey<FormState>();

// editing controllers for fistName, lastName, email, password and confirmPassword
  final firstNameController = new TextEditingController();
  final lastNameController = new TextEditingController();
  final emailController = new TextEditingController();
  final passwordController = new TextEditingController();
  final confirmPasswordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    //
    // --------  create first name field  --------
    final firstNameField = TextFormField(
      controller: firstNameController,
      autofocus: false,
      keyboardType: TextInputType.name,
      //validator: () {},
      // this onSaved function will be saving the value whenever a user types in something
      onSaved: (value) {
        firstNameController.text = value!;
      },
      // create an input action - definition: an input action is when a user clicks on the email field and on the
      // right bottom side of the keyboard there will be an option of clicking next.
      textInputAction: TextInputAction.next,
      // design for the email field
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        prefixIcon: Icon(Icons.account_circle_sharp),
        hintText: "First Name",
        contentPadding: EdgeInsets.fromLTRB(21, 16, 21, 16),
      ),
    );

    // --------  create last name field  --------
    final lastNameField = TextFormField(
      controller: lastNameController,
      keyboardType: TextInputType.name,
      autofocus: false,
      //validator: () {},
      onSaved: (value) {
        lastNameController.text = value!;
      },
      textInputAction: TextInputAction.next,
      // design for the password field
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        prefixIcon: Icon(Icons.account_circle_sharp),
        hintText: "Last Name",
        contentPadding: EdgeInsets.fromLTRB(21, 16, 21, 16),
      ),
    );

    // --------  create email field  --------
    final emailField = TextFormField(
      controller: emailController,
      autofocus: false,
      keyboardType: TextInputType.emailAddress,
      //validator: () {},
      // this onSaved function will be saving the value whenever a user types in something
      onSaved: (value) {
        emailController.text = value!;
      },
      // create an input action
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

    // --------  create password field  --------
    final passwordField = TextFormField(
      controller: passwordController,
      obscureText: true,
      autofocus: false,
      //validator: () {},
      onSaved: (value) {
        passwordController.text = value!;
      },
      textInputAction: TextInputAction.next,
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

    // --------  create confirm password field  --------
    final confirmPasswordField = TextFormField(
      controller: confirmPasswordController,
      obscureText: true,
      autofocus: false,
      //validator: () {},
      onSaved: (value) {
        confirmPasswordController.text = value!;
      },
      textInputAction: TextInputAction.done,
      // design for the password field
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        prefixIcon: Icon(Icons.vpn_key_rounded),
        hintText: "Confirm Password",
        contentPadding: EdgeInsets.fromLTRB(21, 16, 21, 16),
      ),
    );

    return Scaffold(
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
                    height: 210,
                    child: Image.asset(
                      "assets/attractiveServiceLogo.png",
                      fit: BoxFit.contain,
                    ),
                  ),
                  // give space between boxes, images or other stuff in the page
                  SizedBox(height: 10),
                  firstNameField,
                  // give space between boxes, images or other stuff in the page
                  SizedBox(height: 22),
                  lastNameField,
                  // give space between boxes, images or other stuff in the page
                  SizedBox(height: 22),
                  emailField,
                  // give space between boxes, images or other stuff in the page
                  SizedBox(height: 22),
                  passwordField,
                  // give space between boxes, images or other stuff in the page
                  SizedBox(height: 22),
                  confirmPasswordField,
                  // give space between boxes, images or other stuff in the page
                  SizedBox(height: 55),
                  // SignUp
                  // below login button: add message for not having an account yet and a SignUp that redirects user to register page
                ],
              ),
            ),
          ),
        )),
      ),
    );
  }
}
