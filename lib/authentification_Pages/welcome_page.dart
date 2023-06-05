// ignore_for_file: prefer_const_constructors, sort_child_properties_last, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:service_now/User_Logged_In/homepage.dart';
import 'package:service_now/Utils/next_screen.dart';
import 'package:service_now/Utils/snack_bar.dart';
import 'package:service_now/authentification_Pages/login_page.dart';
import 'package:service_now/authentification_Pages/phoneSignUp_page.dart';
import 'package:service_now/authentification_Pages/registration_page.dart';
import 'package:service_now/provider/internet_provider.dart';

import '../provider/sign_in_provider.dart';

class WelcomePageScreen extends StatefulWidget {
  const WelcomePageScreen({super.key});

  @override
  State<WelcomePageScreen> createState() => _WelcomePageScreenState();
}

class _WelcomePageScreenState extends State<WelcomePageScreen> {
  // google sign in button
  final RoundedLoadingButtonController googleController =
      RoundedLoadingButtonController();
  // twitter sign in button
  final RoundedLoadingButtonController twitterController =
      RoundedLoadingButtonController();
  // phone sign in button
  final RoundedLoadingButtonController phoneController =
      RoundedLoadingButtonController();

  @override
  Widget build(BuildContext context) {
    // create buttons so that the user will have options to choose from:
    // login, create account or signUp via facebook, gmail etc..
    //
    // create account button which will redirect the user to the register page
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
                SizedBox(height: 15),
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
                SizedBox(height: 170),
                Column(
                  children: <Widget>[
                    //
                    // PHONE SIGN UP BUTTON
                    //
                    RoundedLoadingButton(
                      onPressed: () {
                        nextScreenReplace(context, const PhoneSignUpScreen());
                        phoneController.reset();
                      },
                      controller: phoneController,
                      successColor: Colors.black,
                      width: MediaQuery.of(context).size.width * 0.80,
                      elevation: 0,
                      borderRadius: 25,
                      color: Colors.black,
                      child: Wrap(
                        children: const [
                          Icon(
                            FontAwesomeIcons.phone,
                            size: 20,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text("Sign in with Phone",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500)),
                        ],
                      ),
                    ),
                    SizedBox(height: 15),
                    //
                    // GOOGLE SIGN UP BUTTON
                    //
                    RoundedLoadingButton(
                      onPressed: () {
                        handleGoogleSignIn();
                      },
                      controller: googleController,
                      successColor: Colors.red,
                      width: MediaQuery.of(context).size.width * 0.80,
                      elevation: 0,
                      borderRadius: 25,
                      color: Colors.red,
                      child: Wrap(
                        children: const [
                          Icon(
                            FontAwesomeIcons.google,
                            size: 20,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text("Sign in with Google",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500)),
                        ],
                      ),
                    ),
                    SizedBox(height: 15),
                    //
                    // TWITTER SIGN UP BUTTON
                    //
                    RoundedLoadingButton(
                      onPressed: () {
                        handleTwitterSignIn();
                      },
                      controller: twitterController,
                      successColor: Colors.lightBlue,
                      width: MediaQuery.of(context).size.width * 0.80,
                      elevation: 0,
                      borderRadius: 25,
                      color: Colors.lightBlue,
                      child: Wrap(
                        children: const [
                          Icon(
                            FontAwesomeIcons.twitter,
                            size: 20,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text("Sign in with Twitter",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500)),
                        ],
                      ),
                    ),
                  ],
                ),
                //SizedBox(height: 10)
              ],
            ),
          ),
        ));
  }

  // create function for handling google sign in
  // everything is written here will only be activated when the user clicks the Sign in with google button
  Future handleGoogleSignIn() async {
    final sp = context.read<SignInProvider>();
    final ip = context.read<InternetProvider>();
    // it needs to wait until the internet connection is available
    await ip.checkInternetConnection();

    if (ip.hasInternet == false) {
      openSnackbar(
          context, "Check your internet connection!", Colors.greenAccent);
      googleController.reset();
    } else {
      await sp.signInWithGoogleProvider().then((value) {
        if (sp.hasError == true) {
          openSnackbar(context, sp.errorCode.toString(), Colors.greenAccent);
          googleController.reset();
        }
        // if there is no error
        else {
          // check whether the user exists or not
          sp.checkUserExists().then((value) async {
            if (value == true) {
              // user exists
              await sp.getUserDataFromFirestore(sp.uid).then((value) => sp
                  .saveDataToSharedPreferences()
                  .then((value) => sp.setSignInUser().then((value) {
                        googleController.success();
                        handleAfterUserSignIn();
                      })));
            } else {
              // user does not exist
              sp.saveDataToFirestore().then((value) => sp
                  .saveDataToSharedPreferences()
                  .then((value) => sp.setSignInUser().then((value) {
                        googleController.success();
                        handleAfterUserSignIn();
                      })));
            }
          });
        }
      });
    }
  }

  // handling twitter auth
  Future handleTwitterSignIn() async {
    final sp = context.read<SignInProvider>();
    final ip = context.read<InternetProvider>();
    await ip.checkInternetConnection();

    if (ip.hasInternet == false) {
      openSnackbar(
          context, "Check your Internet connection!", Colors.lightBlue);
      googleController.reset();
    } else {
      await sp.signInWithTwitterProvider().then((value) {
        if (sp.hasError == true) {
          openSnackbar(context, sp.errorCode.toString(), Colors.lightBlue);
          twitterController.reset();
        } else {
          // checking whether user exists or not
          sp.checkUserExists().then((value) async {
            if (value == true) {
              // user exists
              await sp.getUserDataFromFirestore(sp.uid).then((value) => sp
                  .saveDataToSharedPreferences()
                  .then((value) => sp.setSignInUser().then((value) {
                        twitterController.success();
                        handleAfterUserSignIn();
                      })));
            } else {
              // user does not exist
              sp.saveDataToFirestore().then((value) => sp
                  .saveDataToSharedPreferences()
                  .then((value) => sp.setSignInUser().then((value) {
                        twitterController.success();
                        handleAfterUserSignIn();
                      })));
            }
          });
        }
      });
    }
  }

  // handleAfterUserSignIn - common function used for every authentification like: google, facebook, twitter, phone
  handleAfterUserSignIn() {
    Future.delayed(const Duration(milliseconds: 1000)).then((value) {
      nextScreenReplace(context, const HomePage());
    });
  }
}
