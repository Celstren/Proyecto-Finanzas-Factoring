import 'dart:convert';

import 'package:proyecto_finanzas/model/data_base/user_model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceData {
  static const _token = "token";
  static const _userInfo = "user";

  SharedPreferenceData();

  static Future<bool> setToken(String token) async {
    final  SharedPreferences preference = await SharedPreferences.getInstance();
    return preference.setString(_token, token);
  }

  static Future<String> getToken() async {
    final  SharedPreferences preference = await SharedPreferences.getInstance();
    return preference.getString(_token);
  }

  static Future<bool> setUser(User user) async {
    final  SharedPreferences preference = await SharedPreferences.getInstance();
    return preference.setString(_userInfo, jsonEncode(user));
  }

  static Future<User> getUser() async {
    final  SharedPreferences preference = await SharedPreferences.getInstance();
    return preference.getString(_userInfo) != null? User.fromJson(jsonDecode(preference.getString(_userInfo))) : null;
  }

  static Future<bool> cleanData() async {
    final  SharedPreferences preference = await SharedPreferences.getInstance();
    return preference.clear();
  }

}