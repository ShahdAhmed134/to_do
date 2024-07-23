import 'package:flutter/material.dart';

class AppConfigProvider extends ChangeNotifier {
  String AppLanguage = 'en';
  ThemeMode appTheme = ThemeMode.light;

  void changeLanguage(String newLanguage) {
    if (AppLanguage == newLanguage) {
      return;
    }
    AppLanguage = newLanguage;
    notifyListeners();
  }

  void changeTheme(ThemeMode newMode) {
    if (appTheme == newMode) {
      return;
    }
    appTheme = newMode;
    notifyListeners();
  }

  bool isDark() {
    return appTheme == ThemeMode.dark;
  }
}
