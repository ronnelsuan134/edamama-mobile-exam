import 'package:ecommerce/res/color.dart';
import 'package:flutter/material.dart';

class Utils {
  static snackBar(String message, BuildContext context) {
    var snackBar = SnackBar(
      content:  Text(
        message,
        textAlign: TextAlign.center,
      ),
      backgroundColor: AppColors.lightGreenColor,
      shape: const StadiumBorder(),
      behavior: SnackBarBehavior.floating,
      duration: const Duration(milliseconds: 1000),
      padding: const EdgeInsets.all(15),
      margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).size.height - 100,
          right: 100,
          left: 100),
    );
    return ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
