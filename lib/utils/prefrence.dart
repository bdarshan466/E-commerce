import 'package:shared_preferences/shared_preferences.dart';

class Prefrence {
  Future<void> setUserName(String name) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("userName", name);
  }

  Future<String?> getUserName() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString("userName").toString();
  }

  Future<void> setEmail(String email) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("email", email);
  }

  Future<String?> getEmail() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString("email").toString();
  }

  Future<void> setUserPassword(String password) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("password", password);
  }

  Future<String?> getUserPassword() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString("password").toString();
  }

  Future<void> setLogin(bool isLogin) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool("isLogin", isLogin);
  }

  Future<bool?> getLogin() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool("isLogin");
  }
}
