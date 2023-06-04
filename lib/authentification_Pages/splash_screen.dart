import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:service_now/User_Logged_In/homepage.dart';
import 'package:service_now/Utils/config.dart';
import 'package:service_now/authentification_Pages/welcome_page.dart';
import 'package:service_now/provider/sign_in_provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // init state
  @override
  @override
  void initState() {
    // this is the signInProvider
    final sp = context.read<SignInProvider>();
    super.initState();

    // here I will create a timer of 2 seconds to fetch the boolean value and then migrate to a particular screen
    // also, if the user is already signed in, redirect to loginScreen, otherwise create account and redirect to HomePage
    Timer(const Duration(seconds: 2), () {
      sp.isAlreadySignedIn == false
          ? Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => const WelcomePageScreen()))
          : Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const HomePage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
            child: Image(
          image: AssetImage(Config.app_icon),
          height: 80,
          width: 80,
        )),
      ),
    );
  }
}
