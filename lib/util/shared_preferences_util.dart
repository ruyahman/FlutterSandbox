import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'dart:async' show Future;

class PreferenceUtils {
  static Future<SharedPreferences> get _instance async => _prefsInstance ??= await SharedPreferences.getInstance();
  static late SharedPreferences _prefsInstance;

  // call this method from iniState() function of mainApp().
  static Future<SharedPreferences> init() async {
    _prefsInstance = await _instance;
    return _prefsInstance;
  }

  static String getString(String key, [String? defValue]) {
    return _prefsInstance.getString(key) ?? defValue ?? "";
  }

  static Future<bool> setString(String key, String value) async {
    var prefs = await _instance;
    return prefs?.setString(key, value) ?? Future.value(false);
  }

  static removeKey(String key) {
    _prefsInstance.remove(key);
  }
}

class LoginManager {
  void login(final String userName, final String password) {
    PreferenceUtils.setString(userName, password);
  }
  void logout(final String userName) {
    PreferenceUtils.removeKey(userName);
  }
  bool isLogin(final String userName) {
    return PreferenceUtils.getString(userName).isNotEmpty;
  }
}