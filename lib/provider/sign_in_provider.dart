// ignore_for_file: prefer_final_fields, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignInProvider extends ChangeNotifier {
  // instance of firebase auth for google and facebook
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
//final FacebookAuth facebookAuth = FacebookAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  // initially set to false, if user is already signed in, it will be set to TRUE
  bool _isAlreadySignedIn = false;
  bool get isAlreadySignedIn => _isAlreadySignedIn;

  // create the following instances: hasError, errorCode, provider(Google Provider or Facebook Provider), uid, name, imageUrl
  bool _hasError = false;
  bool get hasError => _hasError;

  String? _errorCode;
  String? get errorCode => _errorCode;

  String? _provider;
  String? get provider => _provider;

  String? _uid;
  String? get uid => _uid;

  String? _name;
  String? get name => _name;

  String? _email;
  String? get email => _email;

  String? _imageUrl;
  String? get imageUrl => _imageUrl;

  SignInProvider() {
    checkSignInUser();
  }

  // with this function I check wheter the user is signed in or not
  Future checkSignInUser() async {
    final SharedPreferences s = await SharedPreferences.getInstance();
    _isAlreadySignedIn = s.getBool("signed_in") ?? false;
    notifyListeners();
  }

  // function to tell if the user have successfully signed in or not
  Future setSignInUser() async {
    final SharedPreferences s = await SharedPreferences.getInstance();
    s.setBool("signed_in", true);
    _isAlreadySignedIn = true;
    notifyListeners();
  }

  // sign in with Google Provider function
  Future signInWithGoogleProvider() async {
    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();

    if (googleSignInAccount != null) {
      // execute our authentification
      try {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;
        // after the authentication we will store all the auth credentials
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );

        // signing to firebase user instance
        final User userDetails =
            (await firebaseAuth.signInWithCredential(credential)).user!;

        // save all the values that we get in the userDetails instance
        _name = userDetails.displayName;
        _email = userDetails.email;
        _imageUrl = userDetails.photoURL;
        _provider = "GOOGLE";
        _uid = userDetails.uid;
        notifyListeners();
      } on FirebaseAuthException catch (e) {
        // some error handling with a switch and different cases
        switch (e.code) {
          case "account-exists-with-different-credential":
            _errorCode = "You already have an account. Use correct provider!";
            _hasError = true;
            notifyListeners();
            break;

          case "null":
            _errorCode = "Unexcpexted error while trying to sign in.";
            _hasError = true;
            notifyListeners();
            break;

          default:
            _errorCode = e.toString();
            _hasError = true;
            notifyListeners();
        }
      }
    } else {
      _hasError = true;
      notifyListeners();
    }
  }

  // entry for cloud firestore, this is for the case when user exists
  Future getUserDataFromFirestore(uid) async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(uid)
        .get()
        .then((DocumentSnapshot snapshot) => {
              _uid = snapshot['uid'],
              _name = snapshot['name'],
              _email = snapshot['email'],
              _imageUrl = snapshot.get('image_url'),
              _provider = snapshot.get('provider'),
            });
  }

  // when a user does not exist
  Future saveDataToFirestore() async {
    final DocumentReference r =
        FirebaseFirestore.instance.collection("users").doc(uid);
    await r.set({
      "name": _name,
      "email": _email,
      "uid": _uid,
      "image_url": _imageUrl,
      "provider": _provider,
    });
    notifyListeners();
  }

  // function to check if the user exists or not in the firestore
  Future<bool> checkUserExists() async {
    DocumentSnapshot snap =
        await FirebaseFirestore.instance.collection('users').doc(_uid).get();
    if (snap.exists) {
      print("This user already exists!");
      return true;
    } else {
      print("NEW USER");
      return false;
    }
  }

  // save all the data we have until now in the SharedPreferences so that later on, when the user is redirected to the homeScreen and
  // he/she exists the app, the data wil be fetched automatically when the user reenters the application.
  Future saveDataToSharedPreferences() async {
    final SharedPreferences s = await SharedPreferences.getInstance();
    await s.setString('name', _name!);
    await s.setString('email', _email!);
    await s.setString('uid', _uid!);
    await s.setString('imageUrl', _imageUrl!);
    await s.setString('provider', _provider!);
    notifyListeners();
  }

  // here I get the needed data from SharedPreferences
  Future getDataFromSharedPreferences() async {
    final SharedPreferences s = await SharedPreferences.getInstance();
    _name = s.getString('name');
    _email = s.getString('email');
    _imageUrl = s.getString('image_url');
    _uid = s.getString('uid');
    _provider = s.getString('provider');
    notifyListeners();
  }

  // sign out function
  Future signOutUser() async {
    await firebaseAuth.signOut();
    await googleSignIn.signOut();
    _isAlreadySignedIn = false;
    notifyListeners();
    // now clear all the stored information
    clearStoredData();
  }

  // clear function
  Future clearStoredData() async {
    final SharedPreferences s = await SharedPreferences.getInstance();
    // clear everything that has been stored here
    s.clear();
  }
}
