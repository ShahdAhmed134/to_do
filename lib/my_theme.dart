import 'package:flutter/material.dart';
import 'package:to_do_app/app_colors.dart';

class MyThemeData {
  static ThemeData lightMode = ThemeData(
      scaffoldBackgroundColor: AppColors.backgroundLightColor,
      appBarTheme:
          AppBarTheme(elevation: 0, backgroundColor: AppColors.primaryColor));
}
