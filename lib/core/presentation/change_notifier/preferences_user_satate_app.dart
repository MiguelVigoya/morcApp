
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../features/auth/data/data_sources/data_login_from_local_storage.dart';
import '../../../features/auth/domain/repositories/auth_local_data_source_interface.dart';


class PreferenceUserStateApp extends ChangeNotifier  implements AuthLocalDataSourceInterface{
  ///
  /// This is the state of the app. It is a [ChangeNotifier] so that it can notify
  /// its listeners when the state changes.
  /// need to instantiate the [SharedPreferences] object to use its notifier.
  /// need to instantiate into constructor[PreferenceUserStateApp] the [DataLoginFromLocalStorage] object to use its notifier.
  ///
  final SharedPreferences sharedPreferences;
  bool isDarkMode = true;
  late DataLoginFromLocalStorage localStorage;

  PreferenceUserStateApp({required this.sharedPreferences}){
    localStorage = DataLoginFromLocalStorage(sharedPreferences: sharedPreferences);
  }

  @override
  Future<void> deleteAllData() async {
    await localStorage.deleteAllData();
    notifyListeners();
  }

  @override
  Future<void> deleteToken() async{
    await localStorage.deleteToken();
    notifyListeners();
  }

  @override
  Future<bool> getIsDarkMode() async {
    final isDark = await localStorage.getIsDarkMode();
    isDarkMode ? isDark : !isDark;
    notifyListeners();
    return isDark;
  }

  @override
  Future<String> getRole() async{
    final roleName = await localStorage.getRole();
    notifyListeners();
    return roleName;
  }

  @override
  Future<String> getToken() async{
    final token = await localStorage.getToken();
    notifyListeners();
    return token;
  }

  @override
  Future<String> getUserEmail() async{
    final userEmail = await localStorage.getUserEmail();
    notifyListeners();
    return userEmail;
  }

  @override
  Future<String> getUserName() async{
    final userName = await localStorage.getUserName();
    notifyListeners();
    return userName;
  }

  @override
  Future<void> setIsDarkMode(bool isDark) async{
    await localStorage.setIsDarkMode(isDark);
    notifyListeners();
  }

  @override
  Future<void> setRole(String role) async{
    await localStorage.setRole(role);
    notifyListeners();
  }

  @override
  Future<void> setToken(String token) async{
    await localStorage.setToken(token);
    notifyListeners();
  }

  @override
  Future<void> setUserEmail(String email) async{
    await localStorage.setUserEmail(email);
    notifyListeners();
  }

  @override
  Future<void> setUserName(String name) async{
    await localStorage.setUserName(name);
    notifyListeners();
  }

}