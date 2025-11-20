import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:rapup/models/login_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedService {
  static Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.containsKey("login_details");
  }

  static Future<void> setLoginDetails(LoginResponseModel? logResModel) async {
    final prefs = await SharedPreferences.getInstance();
    if (logResModel != null) {
      await prefs.setString("login_details", jsonEncode(logResModel.toJson()));
    } else {
      await prefs.remove("login_details");
    }
  }

  static Future<LoginResponseModel?> loginDetails() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString("login_details");
    if (jsonString != null) {
      return LoginResponseModel.fromJson(jsonDecode(jsonString));
    }
    return null;
  }

  static Future<void> logout(BuildContext context) async {
    await setLoginDetails(null);
    // Use pushNamedAndRemoveUntil to clear the navigation stack.
    Navigator.of(context).pushNamedAndRemoveUntil('/', (route) => false);
  }
}
