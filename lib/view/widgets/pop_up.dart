import 'package:firebase_todo/utils/styles.dart';
import 'package:flutter/material.dart';

class SnackBarPopUp {
  static popUp(String messege, BuildContext context,
      {Color bgColor = AppStyle.redColor}) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        duration: const Duration(milliseconds: 2000),
        behavior: SnackBarBehavior.floating,
        backgroundColor: bgColor,
        margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        content: Padding(
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: Text(
            messege,
            style: const TextStyle(
              letterSpacing: 1,
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
