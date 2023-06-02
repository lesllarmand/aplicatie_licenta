// ignore_for_file: unnecessary_new, unused_field, unused_local_variable, prefer_const_constructors, sort_child_properties_last, unrelated_type_equality_checks

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:service_now/Models/user_model.dart';
import 'package:service_now/User_Logged_In/homepage.dart';
import 'package:service_now/Utils/showSnackBar.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
// form key
  final _formKey = GlobalKey<FormState>();

// editing controllers for firstName, lastName, email, password and confirmPassword
  final firstNameController = new TextEditingController();
  final lastNameController = new TextEditingController();
  final emailController = new TextEditingController();
  final passwordController = new TextEditingController();
  final confirmPasswordController = new TextEditingController();

  //calling our firebase
  final _authRegister = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    //
    // --------  create first name field  --------
    final firstNameField = TextFormField(
      controller: firstNameController,
      autofocus: false,
      keyboardType: TextInputType.name,
      validator: (value) {
        // I added this here so that the user MUST enter a password of minimum 6 characters.
        RegExp regexp = new RegExp(r'^.{3,}$');
        // if no password written, show message
        if (value!.isEmpty) {
          return ("First name can't be empty!");
        }
        // if not enough characters for a valid password, show message
        if (!regexp.hasMatch(value)) {
          return ("Not a valid name. Minimum 3 characters.");
        }
        return null;
      },
      // this onSaved function will be saving the value whenever a user types in something
      onSaved: (value) {
        firstNameController.text = value!;
      },
      // create an input action - definition: an input action is when a user clicks on the email field and on the
      // right bottom side of the keyboard there will be an option of clicking next.
      textInputAction: TextInputAction.next,
      // design for the first name field
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
      validator: (value) {
        // I added this here so that the user MUST enter a password of minimum 6 characters.
        RegExp regexp = new RegExp(r'^.{1,}$');
        // if no password written, show message
        if (value!.isEmpty) {
          return ("Second name can't be empty!");
        }
        // if not enough characters for a valid password, show message
        if (!regexp.hasMatch(value)) {
          return ("Not a valid name. Minimum 1 character.");
        }
        return null;
      },
      onSaved: (value) {
        lastNameController.text = value!;
      },
      textInputAction: TextInputAction.next,
      // design for the last name field
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
      validator: (value) {
        if (confirmPasswordController.text != passwordController.text) {
          return "Passwords don't match !";
        }
        return null;
      },
      onSaved: (value) {
        confirmPasswordController.text = value!;
      },
      textInputAction: TextInputAction.done,
      // design for the confirm password field
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        prefixIcon: Icon(Icons.vpn_key_rounded),
        hintText: "Confirm Password",
        contentPadding: EdgeInsets.fromLTRB(21, 16, 21, 16),
      ),
    );

    // button for SignUp after entering the required information to create an account
    final registerButton = Material(
      color: Colors.greenAccent,
      elevation: 5,
      borderRadius: BorderRadius.circular(25),
      child: MaterialButton(
        onPressed: () {
          signUp(emailController.text, passwordController.text);
        },
        child: Text(
          "Sign Up",
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
            Navigator.of(context).pop();
          },
        ),
      ),
      // added this so that the appbar has the same color as the body
      backgroundColor: Colors.white,
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
                  SizedBox(height: 20),
                  //add the logo of the application when the user wants to create a new account
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
                  SizedBox(height: 30),
                  registerButton,
                  // give space between boxes, images or other stuff in the page
                  //SizedBox(height: 50)
                  // TO DO
                  // below login button: add message for not having an account yet and a SignUp that redirects user to register page
                ],
              ),
            ),
          ),
        )),
      ),
    );
  }

  void signUp(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      try {
        await _authRegister
            .createUserWithEmailAndPassword(
              email: email,
              password: password,
            )
            .then(
                // if the register is succesfull we will store the value uid - userd id
                (value) => {postNewRegistrationToFirestore()});
      } on FirebaseAuthException catch (e) {
        if (e.message == 'Given String is empty or null') {
          showSnackBar(context, 'Please fill in all the required fields!');
        } else if (e.message ==
            ' The given password is invalid. [ Password should be at least 6 characters ]') {
          showSnackBar(
              context, 'The password must have at least 6 characters !');
        } else {
          showSnackBar(context, e.message!); // Displaying the error message
        }
      }
    }
  }

  postNewRegistrationToFirestore() async {
    // calling firestore, calling user model and then send these values

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _authRegister.currentUser;

    UserModel userModel = UserModel();

    // write all the values to our DataBase
    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.firstName = firstNameController.text;
    userModel.lastName = lastNameController.text;

    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toMap());
    Fluttertoast.showToast(msg: "Account created successfully!");

    Navigator.pushAndRemoveUntil((context),
        MaterialPageRoute(builder: (context) => HomePage()), (route) => false);
  }
}
