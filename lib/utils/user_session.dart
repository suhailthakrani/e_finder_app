import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';


class UserSession {

  static final UserSession _instance = UserSession._internal();
  UserSession._internal();
  factory UserSession() {
    return _instance;
  }

  Future<bool> createSession({required Map<String,dynamic> userData}) async {
    final preference = await SharedPreferences.getInstance();
    preference.setString('USER_DATA', jsonEncode(userData));
    return true;
  }

  Future<Map<String,dynamic>> getUserData() async {
    final preference = await SharedPreferences.getInstance();
    return jsonDecode(preference.getString('USER_DATA')??"{}");
  }


  Future<bool> isUserLoggedIn() async {
    final preference = await SharedPreferences.getInstance();
    String? data = preference.getString('USER_DATA');
    if(data != null && data.isNotEmpty) return true;
    return false;
  }

  Future<bool> logout() async {
    final preference = await SharedPreferences.getInstance();
    preference.remove('USER_DATA');
    return true;
  }

  Future<void> saveToken({required String token}) async {
    final preference = await SharedPreferences.getInstance();
    preference.setString("access_token", token);
  }

  Future<String> getToken() async {
    final preference = await SharedPreferences.getInstance();
    return preference.getString('access_token')??"";
  }

}
