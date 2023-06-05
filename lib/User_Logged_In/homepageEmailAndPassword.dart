// ignore_for_file: library_private_types_in_public_api, unnecessary_this, prefer_const_constructors, file_names, use_build_context_synchronously, deprecated_member_use

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:service_now/Models/user_model.dart';
import 'package:service_now/User_Logged_In/mainNavigationScreen.dart';
import 'package:service_now/Utils/next_screen.dart';
import 'package:service_now/authentification_Pages/welcome_page.dart';

class HomePageEP extends StatefulWidget {
  const HomePageEP({Key? key}) : super(key: key);

  @override
  State<HomePageEP> createState() => _HomePageEPState();
}

class _HomePageEPState extends State<HomePageEP> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(
                height: 70,
              ),
              SizedBox(
                // this is the actual size of the logo ( how big or how small it is )
                height: 190,
                child: Image.asset(
                  "assets/avatarLoggedIn.png",
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Welcome back ${loggedInUser.firstName} ${loggedInUser.lastName}",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text("${loggedInUser.email}",
                  style: TextStyle(
                    fontSize: 15.5,
                    color: Colors.black54,
                    fontWeight: FontWeight.w500,
                  )),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.orangeAccent, // Background color
                  ),
                  onPressed: () {
                    nextScreen(context, const MainNavigationScreen());
                  },
                  child: const Text("NEXT",
                      style: TextStyle(
                        color: Colors.black,
                      ))),
              SizedBox(
                height: 190,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.orangeAccent, // Background color
                  ),
                  onPressed: () {
                    logout(context);
                    nextScreenReplace(context, const WelcomePageScreen());
                  },
                  child: const Text("SIGN OUT",
                      style: TextStyle(
                        color: Colors.black,
                      ))),
            ],
          ),
        ),
      ),
    );
  }

  // the logout function
  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => WelcomePageScreen()));
  }
}
