import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../features/auth/common/constant_values_of_local_storage.dart';

class AppPreferences {
  static late SharedPreferences _prefs;

  //TODO: verificar que tan malo es dejar _userId en 0
  static int _userId = 0;
  static String _userName = '';
  static String _userEmail = '';
  static String _userRole = '';
  static String _userToken = '';

  static bool _isDarkMode = false;

  static Future<void> instance() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static void deleteAllData() async => await _prefs.clear();

  static void deleteToken() async => await _prefs.remove(keyOfToken);

  static void saveAllData(
      {required String userName,
      required String userEmail,
      required String userRole,
      required int userId,
      required String userToken}) async {
    await _prefs.setString(keyOfUserName, userName);
    await _prefs.setString(keyOfEmail, userEmail);
    await _prefs.setString(keyOfRole, userRole);
    await _prefs.setString(keyOfToken, userToken);
    await _prefs.setInt(keyOfUserId, userId);
  }

  static String get nameProfile {
    return _prefs.getString(keyOfUserName) ?? _userName;
  }

  static set nameProfile(String name) {
    _userName = name;
    _prefs.setString(keyOfUserName, name);
  }

  static String get emailProfile {
    return _prefs.getString(keyOfEmail) ?? _userEmail;
  }

  static set emailProfile(String email) {
    _userEmail = email;
    _prefs.setString(keyOfEmail, email);
  }

  static String get roleProfile {
    return _prefs.getString(keyOfRole) ?? _userRole;
  }

  static set roleProfile(String role) {
    _userRole = role;
    _prefs.setString(keyOfRole, role);
  }

  static String get tokenProfile {
    return _prefs.getString(keyOfToken) ?? _userToken;
  }

  static set tokenProfile(String token) {
    _userToken = token;
    _prefs.setString(keyOfToken, token);
  }

  static int get idProfile {
    return _prefs.getInt(keyOfUserId) ?? _userId;
  }

  static set idProfile(int value) {
    _userId = value;
  }

  static bool get isDarkMode {
    return _prefs.getBool(keyOfIsDarkMode) ?? _isDarkMode;
  }

  static set isDarkMode(bool isDark) {
    _isDarkMode = isDark;
    _prefs.setBool(keyOfIsDarkMode, isDark);
  }
}
