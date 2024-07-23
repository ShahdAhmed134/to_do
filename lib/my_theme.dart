import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_app/app_colors.dart';

class MyThemeData {
  static ThemeData lightMode = ThemeData(
      primaryColor: AppColors.primaryColor,
      scaffoldBackgroundColor: AppColors.backgroundLightColor,
      appBarTheme:
          AppBarTheme(elevation: 0, backgroundColor: AppColors.primaryColor),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: AppColors.primaryColor,
          unselectedItemColor: AppColors.grayColor,
          backgroundColor: Colors.transparent,
          elevation: 0),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: AppColors.primaryColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(35),
              side: BorderSide(color: AppColors.whiteColor, width: 4))),
      bottomSheetTheme: BottomSheetThemeData(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20)))),
      textTheme: TextTheme(
        titleLarge: GoogleFonts.poppins(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: AppColors.whiteColor),
        titleMedium: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppColors.blackColor),
        bodyLarge: GoogleFonts.inter(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: AppColors.blackColor),
        bodyMedium: GoogleFonts.inter(
            fontSize: 18,
            fontWeight: FontWeight.w400,
            color: AppColors.blackColor),
      ));
  static ThemeData darkMode = ThemeData(
      primaryColor: AppColors.primaryColor,
      scaffoldBackgroundColor: AppColors.backgroundDarkColor,
      appBarTheme:
          AppBarTheme(elevation: 0, backgroundColor: AppColors.primaryColor),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: AppColors.primaryColor,
          unselectedItemColor: AppColors.grayColor,
          backgroundColor: AppColors.blackDarkColor,
          elevation: 0),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: AppColors.primaryColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(35),
              side: BorderSide(color: AppColors.whiteColor, width: 4))),
      bottomSheetTheme: BottomSheetThemeData(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20)))),
      textTheme: TextTheme(
        titleLarge: GoogleFonts.poppins(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: AppColors.whiteColor),
        titleMedium: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppColors.blackColor),
        bodyLarge: GoogleFonts.inter(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: AppColors.whiteColor
        ),
        bodyMedium: GoogleFonts.inter(
            fontSize: 18,
            fontWeight: FontWeight.w400,
            color: AppColors.blackColor),
      ));
}
