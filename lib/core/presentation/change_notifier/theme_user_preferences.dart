import 'package:flutter/material.dart';

import '../../common/theme.dart';
import '../../common/utils/app_preference.dart';


class ThemeUserPreferencesProvider extends ChangeNotifier {
  bool _isDarkMode = AppPreferences.isDarkMode;
  ThemeData currentTheme;

  ThemeUserPreferencesProvider()
      : currentTheme = AppPreferences.isDarkMode
      ? darkTheme
      : lightTheme;

  bool get isDarkMode => _isDarkMode;

  set isDarkMode(bool isDArk) {
    _isDarkMode = isDArk;
    AppPreferences.isDarkMode = isDArk;
    notifyListeners();
  }

  setLightTheme() {
    currentTheme = lightTheme;
    notifyListeners();
  }

  setDarkTheme() {
    currentTheme = darkTheme;
    notifyListeners();
  }
}