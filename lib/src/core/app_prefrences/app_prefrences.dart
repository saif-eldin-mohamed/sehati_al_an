import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sehati_al_an_app/src/core/resourses/language_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../helpers/enums.dart';
import '../services/dependency_injection.dart';

// UserModel skipLoginModel = UserModel(
//     displayName: sl<AppPreferences>().skipLogin,
//     accessToken: '',
//     refreshToken: '',
//     role: '',
//     userId: '',
//     uuid: '');

class AppPreferences {
  final SharedPreferences _sharedPreferences;

  AppPreferences(this._sharedPreferences);

  String userPrefs = 'user';
  String language = 'language';
  String onBoarding = 'onBoarding';
  String skipLogin = 'skip';

  // /// user
  // UserModel? getUser() {
  //   String? userPref = _sharedPreferences.getString(userPrefs);
  //   if (userPref == null) {
  //     return null;
  //   }
  //
  //   Map<String, dynamic> userMap = jsonDecode(userPref) as Map<String, dynamic>;
  //   return UserModel.fromJson(userMap);
  // }
  //
  // Future<void> setUser(UserModel model) async {
  //   await _sharedPreferences.setString(userPrefs, jsonEncode(model.toJson()));
  // }

  Future<void> removeUser() async {
    await _sharedPreferences.remove(userPrefs);
  }

  // onboarding

  Future<void> setOnBoarding() async {
    await _sharedPreferences.setBool(onBoarding, true);
  }

  bool getOnBoarding() {
    return _sharedPreferences.getBool(onBoarding) ?? false;
  }

  // bool isSkipLogin() {
  //   final isSkip = getUser()?.displayName ?? false;
  //   return isSkip == skipLogin;
  // }

  /// language

  String getAppLang() {
    String? lang = _sharedPreferences.getString(language);
    //  return LanguageType.english.getValue();

    if (lang != null && lang.isNotEmpty) {
      return lang;
    } else {
      return LanguageType.arabic.getValue;
    }
  }

  Future<void> changeAppLang() async {
    String currentLang = getAppLang();
    if (currentLang == LanguageType.arabic.getValue) {
      await _sharedPreferences.setString(
          language, LanguageType.english.getValue);
    } else {
      await _sharedPreferences.setString(
          language, LanguageType.arabic.getValue);
    }
  }

  Future<Locale> getLocal() async {
    String currentLang = getAppLang();
    if (currentLang == LanguageType.arabic.getValue) {
      return arabicLocal;
    } else {
      return englishLocal;
    }
  }
}
