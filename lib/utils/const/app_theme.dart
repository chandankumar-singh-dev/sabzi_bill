import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sabzi_bill/utils/const/app_color.dart';

class AppTheme {
  static ThemeData baseTheme() {
    return ThemeData(
      brightness: Brightness.light,
      textTheme: TextTheme(
        displayLarge: GoogleFonts.inter(
          textStyle: TextStyle(
            fontSize: 40,
            color: AppColor.primaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        displaySmall: GoogleFonts.inter(
          textStyle: TextStyle(color: AppColor.primaryColor, fontSize: 16),
        ),
      ),
    );
  }
}
