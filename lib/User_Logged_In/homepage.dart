// ignore_for_file: deprecated_member_use

import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:service_now/Utils/next_screen.dart';
import 'package:service_now/authentification_Pages/welcome_page.dart';
import 'package:service_now/provider/sign_in_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future getData() async {
    final sp = context.read<SignInProvider>();
    sp.getDataFromSharedPreferences();
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    // here I changed read to watch!!!!
    // the read only will not fetch the data again and again while watch keeps track of everything that has changed regarding the data
    final sp = context.watch<SignInProvider>();
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              // this is the actual size of the logo ( how big or how small it is )
              height: 190,
              child: Image.asset(
                "assets/avatarLoggedIn.png",
                fit: BoxFit.contain,
              ),
            ),
            // CircleAvatar(
            //   backgroundColor: Colors.white,
            //   backgroundImage: NetworkImage("${sp.imageUrl}"),
            //   radius: 50,
            // ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Welcome ${sp.name}",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              "${sp.email}",
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 10,
            ),

            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("PROVIDER:"),
                const SizedBox(
                  width: 5,
                ),
                Text("${sp.provider}".toUpperCase(),
                    style: const TextStyle(color: Colors.red)),
              ],
            ),
            // const SizedBox(
            //   height: 10,
            // ),
            // const Text("This is your unique user ID:"),
            // const SizedBox(
            //   height: 10,
            // ),
            // Text(
            //   " ${sp.uid}",
            //   style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
            // ),
            // const SizedBox(
            //   height: 10,
            // ),
            const SizedBox(
              height: 27,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.orangeAccent, // Background color
                ),
                onPressed: () {
                  sp.signOutUser();
                  nextScreenReplace(context, const WelcomePageScreen());
                },
                child: const Text("SIGN OUT",
                    style: TextStyle(
                      color: Colors.black,
                    )))
          ],
        ),
      ),
    );
  }
}
