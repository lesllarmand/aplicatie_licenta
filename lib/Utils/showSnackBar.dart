// ignore_for_file: file_names

import 'package:flutter/material.dart';

// this function is created in this separate file because I need to use it for register and login cases when the user tries to create
// or login into an account and he/she encounters different problems.
// having this implemented will result in a small window popping up in the application when something is not ok. This will happen when
// the user is trying to access or register an account incorrectly
void showSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(text),
    ),
  );
}
