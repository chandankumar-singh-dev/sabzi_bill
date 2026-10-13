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
        backgroundColor: AppColor.primaryColor,
        titleTextStyle: GoogleFonts.inter(
          fontWeight: FontWeight.bold,
          textStyle: TextStyle(color: Colors.white, fontSize: 20),
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
      ),
    );
  }
}
