


abstract class AuthLocalDataSourceInterface {

  /// Gets the cached [LoginResponseModel] which was gotten the last time
  /// the user had an internet connection.
  ///
  /// Throws [CacheException] if no cached data is present.

  //TODO: implement save all data of user.
  Future<void> setUserName(String name);
  Future<String> getUserName();

  Future<void> setUserEmail(String email);
  Future<String> getUserEmail();

  Future<void> setRole(String role);
  Future<String> getRole();

  Future<void> setIsDarkMode(bool isDark);
  Future<bool> getIsDarkMode();

  Future<void> setToken(String token);
  Future<void> deleteToken();
  Future<String> getToken();

  Future<void> deleteAllData();
}