import 'package:flutter/material.dart';

class AppUtils {
  static void hideKeyboard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  static void showErrorDialog(
      {String title = "Error", String message = "Something went wrong"}) {}

  static void showSuccessDialog(
      {String title = "Success", required String message}) {}
}
