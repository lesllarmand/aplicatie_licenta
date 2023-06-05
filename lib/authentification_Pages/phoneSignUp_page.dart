// ignore_for_file: use_build_context_synchronously, file_names, deprecated_member_use

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:service_now/User_Logged_In/homepage.dart';
import 'package:service_now/Utils/config.dart';
import 'package:service_now/Utils/next_screen.dart';
import 'package:service_now/Utils/snack_bar.dart';
import 'package:service_now/authentification_Pages/welcome_page.dart';
import 'package:service_now/provider/internet_provider.dart';
import 'package:service_now/provider/sign_in_provider.dart';

class PhoneSignUpScreen extends StatefulWidget {
  const PhoneSignUpScreen({Key? key}) : super(key: key);

  @override
  State<PhoneSignUpScreen> createState() => _PhoneSignUpScreenState();
}

class _PhoneSignUpScreenState extends State<PhoneSignUpScreen> {
  final formKey = GlobalKey<FormState>();
  // add the following text editing controllers: phone, email, name and otp code
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  // after the user enters the mobile number and registers an account, a verification must be done, he will receive a code on
  // his mobile number and he must enter it in the application in order to access his account
  TextEditingController otpCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        // top left icon that will redirect the user to the welcome page if he wants to go back and choose another sign in method
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            nextScreenReplace(context, const WelcomePageScreen());
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image(
                    image: AssetImage(Config.phone_login_icon),
                    height: 70,
                    width: 70),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  "Phone SignIn",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 25,
                ),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Name cannot be empty!";
                    }
                    return null;
                  },
                  controller: nameController,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.account_circle),
                      hintText: "Full Name",
                      hintStyle: TextStyle(color: Colors.grey[600]),
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(color: Colors.red)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(color: Colors.grey)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(color: Colors.grey))),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Email address cannot be empty!";
                    }
                    return null;
                  },
                  controller: emailController,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.email),
                      hintText: "something@email.com",
                      hintStyle: TextStyle(color: Colors.grey[600]),
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(color: Colors.red)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(color: Colors.grey)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(color: Colors.grey))),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Phone Number cannot be empty!";
                    }
                    return null;
                  },
                  controller: phoneController,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.phone),
                      hintText: "+00-123456789",
                      hintStyle: TextStyle(color: Colors.grey[600]),
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(color: Colors.red)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(color: Colors.grey)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(color: Colors.grey))),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () {
                      login(context, phoneController.text.trim());
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                    ),
                    child: const Text(
                      "Register",
                      style: TextStyle(fontSize: 16),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future login(BuildContext context, String mobile) async {
    final sp = context.read<SignInProvider>();
    final ip = context.read<InternetProvider>();
    await ip.checkInternetConnection();

    if (ip.hasInternet == false) {
      openSnackbar(context, "Check your internet connection", Colors.black);
    } else {
      if (formKey.currentState!.validate()) {
        FirebaseAuth.instance.verifyPhoneNumber(
            phoneNumber: mobile,
            verificationCompleted: (AuthCredential credential) async {
              await FirebaseAuth.instance.signInWithCredential(credential);
            },
            verificationFailed: (FirebaseAuthException e) {
              if (e.toString() ==
                  "The format of the phone number provided is incorrect. Please enter the phone number in a format that can be parsed into E.164 format. E.164 phone numbers are written in the format [+][country code][subscriber number including area code]. [ Invalid format. ]") {
                openSnackbar(
                    context, "Phone number format is wrong!", Colors.black);
              } else {
                openSnackbar(
                    context, "Phone number format is wrong", Colors.black);
              }
            },
            codeSent: (String verificationId, int? forceResendingToken) {
              showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text("Enter Code"),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextField(
                            controller: otpCodeController,
                            decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.code),
                                errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide:
                                        const BorderSide(color: Colors.black)),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide:
                                        const BorderSide(color: Colors.grey)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide:
                                        const BorderSide(color: Colors.grey))),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          ElevatedButton(
                            onPressed: () async {
                              final code = otpCodeController.text.trim();
                              AuthCredential authCredential =
                                  PhoneAuthProvider.credential(
                                      verificationId: verificationId,
                                      smsCode: code);
                              User user = (await FirebaseAuth.instance
                                      .signInWithCredential(authCredential))
                                  .user!;
                              //save the values
                              sp.phoneNumberUser(user, emailController.text,
                                  nameController.text);
                              // checking whether user exists,
                              sp.checkUserExists().then((value) async {
                                if (value == true) {
                                  // user exists
                                  await sp
                                      .getUserDataFromFirestore(sp.uid)
                                      .then((value) => sp
                                          .saveDataToSharedPreferences()
                                          .then((value) =>
                                              sp.setSignInUser().then((value) {
                                                nextScreenReplace(
                                                    context, const HomePage());
                                              })));
                                } else {
                                  // user does not exist
                                  await sp.saveDataToFirestore().then((value) =>
                                      sp.saveDataToSharedPreferences().then(
                                          (value) =>
                                              sp.setSignInUser().then((value) {
                                                nextScreenReplace(
                                                    context, const HomePage());
                                              })));
                                }
                              });
                            },
                            child: const Text("Confirm"),
                          )
                        ],
                      ),
                    );
                  });
            },
            codeAutoRetrievalTimeout: (String verification) {});
      }
    }
  }
}
