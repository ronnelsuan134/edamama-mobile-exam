import 'package:flutter/material.dart';
import 'package:ecommerce/res/color.dart';

class AppTheme {

  ThemeData appTheme() {
    return ThemeData(
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        scrolledUnderElevation: 2,
        iconTheme: IconThemeData(color: AppColors.whiteColor),
        elevation: 0
      ),
    );
  }
}
