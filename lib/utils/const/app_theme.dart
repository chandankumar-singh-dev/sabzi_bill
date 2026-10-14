import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sabzi_bill/utils/const/app_color.dart';

class AppTheme {
  static ThemeData baseTheme() {
    final labelMedium = GoogleFonts.inter(
      textStyle: TextStyle(
        color: AppColor.textPrimary,
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
    );

    final labelSmall = GoogleFonts.inter(
      textStyle: TextStyle(color: AppColor.textSecondary, fontSize: 14),
    );
    return ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColor.background,
      appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(color: AppColor.surface),
        backgroundColor: AppColor.primaryColor,
        titleTextStyle: GoogleFonts.inter(
          fontWeight: FontWeight.bold,
          textStyle: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
      inputDecorationTheme: InputDecorationThemeData(
        filled: true,
        fillColor: AppColor.surface,
        hintStyle: labelSmall,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColor.inputFieldBorder, width: 0.1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColor.inputFieldBorder, width: 0.1),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColor.inputFieldBorder, width: 0.1),
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        elevation: 10,
        selectedItemColor: AppColor.primaryColor,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        unselectedLabelStyle: labelSmall,
        selectedLabelStyle: labelMedium,
      ),
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
        labelMedium: GoogleFonts.inter(
          textStyle: TextStyle(color: AppColor.textPrimary, fontSize: 16),
        ),
        labelSmall: GoogleFonts.inter(
          textStyle: TextStyle(color: AppColor.textSecondary, fontSize: 16),
        ),
        bodySmall: GoogleFonts.inter(
          textStyle: TextStyle(color: Colors.black, fontSize: 16),
        ),
      ),
    );
  }
}
