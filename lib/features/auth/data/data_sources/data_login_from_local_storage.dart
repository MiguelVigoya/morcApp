


import 'package:shared_preferences/shared_preferences.dart';

import '../../common/constant_values_of_local_storage.dart';
import '../../domain/repositories/auth_local_data_source_interface.dart';

/// TO IMPLEMENT THE METHODS OF THE [DataLoginFromLocalStorage] HAVE TO BE PASS THE INSTANCE
/// OF THE SHARED PREFERENCES IN TO CONSTRUCTOR OF [DataLoginFromLocalStorage]
class DataLoginFromLocalStorage implements AuthLocalDataSourceInterface {

  final SharedPreferences sharedPreferences;
  DataLoginFromLocalStorage({required this.sharedPreferences});

  @override
  Future<void> deleteAllData() async => await sharedPreferences.clear();
  
  @override
  Future<void> deleteToken() async => await sharedPreferences.remove(keyOfToken);

  //TODO: MANEJAR LOS RETORNOS DE LOS METODOS GET DONDE SEAN LLAMADOS Y NO EN ESTE SCOPE

  @override
  Future<bool> getIsDarkMode() async => sharedPreferences.getBool(keyOfIsDarkMode) ?? false;

  @override
  Future<String> getRole() async => sharedPreferences.getString(keyOfRole) ?? 'LOGIN';

  @override
  Future<String> getToken() async => sharedPreferences.getString(keyOfToken) ?? '';

  @override
  Future<String> getUserEmail() async => sharedPreferences.getString(keyOfEmail) ?? '';

  @override
  Future<String> getUserName() async => sharedPreferences.getString(keyOfUserName) ?? '';

  @override
  Future<void> setIsDarkMode(bool isDark) async => sharedPreferences.setBool(keyOfIsDarkMode, isDark);

  @override
  Future<void> setRole(String role) async => sharedPreferences.setString(keyOfRole, role);

  @override
  Future<void> setToken(String token)  async => sharedPreferences.setString(keyOfToken, token);

  @override
  Future<void> setUserEmail(String email) async => sharedPreferences.setString(keyOfEmail, email);

  @override
  Future<void> setUserName(String name) async => sharedPreferences.setString(keyOfUserName, name);
}