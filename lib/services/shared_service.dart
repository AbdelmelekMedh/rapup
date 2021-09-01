import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:rapup/models/login_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedService {
  static Future<bool> isloggedIn()async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString("login_details") != null ? true : false ;
  }
  static Future<LoginResponseModel> loginDetails()async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString("login_details") != null
        ? LoginResponseModel.fromJson(
        jsonDecode(
            prefs.getString("login_details"),
        ),
    )
        : null;
  }

  static Future<void> setLoginDetails(LoginResponseModel logResModel) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("login_details", logResModel != null ? jsonEncode(logResModel.toJson()) : null);
  }

  static Future<void> logout(BuildContext context) async {
    await setLoginDetails(null);
    Navigator.of(context).pushNamed('/');
  }
}