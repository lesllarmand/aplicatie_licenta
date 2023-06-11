// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, library_private_types_in_public_api, prefer_const_literals_to_create_immutables, deprecated_member_use, use_build_context_synchronously, unnecessary_this

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:service_now/Models/user_model.dart';
import 'package:service_now/Utils/next_screen.dart';
import 'package:service_now/authentification_Pages/welcome_page.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool value1 = true;
  bool value2 = true;
  bool value3 = false;
  onChange1(bool newValue1) {
    setState(() {
      value1 = newValue1;
    });
  }

  onChange2(bool newValue2) {
    setState(() {
      value2 = newValue2;
    });
  }

  onChange3(bool newValue3) {
    setState(() {
      value3 = newValue3;
    });
  }

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
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: ListView(
          children: [
            Divider(
              height: 15,
              thickness: 2,
            ),
            Text(
              "Settings",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 35,
            ),
            Row(
              children: [
                Icon(
                  Icons.person,
                  color: Colors.green,
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  "Account",
                  style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Divider(
              height: 15,
              thickness: 2,
            ),
            SizedBox(height: 7),
            Text("Email: ${loggedInUser.email}",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                )),
            SizedBox(
              height: 35,
            ),
            Row(
              children: <Widget>[
                Icon(
                  Icons.notifications,
                  color: Colors.green,
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  "Notifications",
                  style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Divider(
              height: 15,
              thickness: 2,
            ),
            SizedBox(height: 2),
            buildNotificationOptionRow("New for you", value1, onChange1),
            buildNotificationOptionRow("Account activity", value2, onChange2),
            buildNotificationOptionRow("Recommendations", value3, onChange3),
            SizedBox(
              height: 50,
            ),
            Center(
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black, // Background color
                  ),
                  onPressed: () {
                    nextScreenReplace(context, const WelcomePageScreen());
                  },
                  child: const Text("SIGN OUT",
                      style: TextStyle(
                        color: Colors.white,
                      ))),
            ),
          ],
        ),
      ),
    );
  }

  Row buildNotificationOptionRow(
      String title, bool isActive, Function onChanged) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.grey[600]),
        ),
        Transform.scale(
            scale: 0.7,
            child: CupertinoSwitch(
              trackColor: Colors.grey,
              activeColor: Colors.green,
              value: isActive,
              onChanged: (bool val) {
                onChanged(val);
              },
            ))
      ],
    );
  }

  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => WelcomePageScreen()));
  }
}
