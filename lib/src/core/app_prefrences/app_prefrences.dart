import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../helpers/enums.dart';
import '../resourses/language_manager.dart';

class AppPreferences {
  final SharedPreferences _sharedPreferences;

  AppPreferences(this._sharedPreferences);

  // Keys constants
  static const String languageKey = 'language';
  static const String onBoardingKey = 'onBoarding';
  static const String userPrefsKey = 'user';
  static const String skipLoginKey = 'skip';

  // ----------------------
  // Language Methods
  // ----------------------

  /// حفظ اللغة المحددة في SharedPreferences
  Future<void> setAppLanguage(String languageCode) async {
    await _sharedPreferences.setString(languageKey, languageCode);
  }

  /// استرجاع اللغة الحالية
  String getAppLanguage() {
    return _sharedPreferences.getString(languageKey) ??
        LanguageType.arabic.getValue;
  }

  /// الحصول على Locale بناءً على اللغة المخزنة
  Future<Locale> getLocale() async {
    String currentLang = getAppLanguage();
    return currentLang == LanguageType.arabic.getValue
        ? arabicLocal
        : englishLocal;
  }

  /// تغيير اللغة إلى اللغة الأخرى (عربي ⇄ إنجليزي)
  Future<void> changeAppLanguage() async {
    String currentLang = getAppLanguage();
    if (currentLang == LanguageType.arabic.getValue) {
      await setAppLanguage(LanguageType.english.getValue);
    } else {
      await setAppLanguage(LanguageType.arabic.getValue);
    }
  }

  // ----------------------
  // Onboarding Methods
  // ----------------------

  /// حفظ حالة انتهاء عرض OnBoarding
  Future<void> setOnBoardingViewed() async {
    await _sharedPreferences.setBool(onBoardingKey, true);
  }

  /// استرجاع حالة عرض OnBoarding
  bool isOnBoardingViewed() {
    return _sharedPreferences.getBool(onBoardingKey) ?? false;
  }

  // ----------------------
  // User Methods
  // ----------------------

  /// إزالة بيانات المستخدم من التخزين
  Future<void> removeUser() async {
    await _sharedPreferences.remove(userPrefsKey);
  }

// مثال على تخزين واسترجاع بيانات المستخدم (في حال وجود موديل)
/*
  Future<void> setUser(UserModel model) async {
    await _sharedPreferences.setString(userPrefsKey, jsonEncode(model.toJson()));
  }

  UserModel? getUser() {
    final userString = _sharedPreferences.getString(userPrefsKey);
    if (userString == null) {
      return null;
    }
    final Map<String, dynamic> userMap = jsonDecode(userString);
    return UserModel.fromJson(userMap);
  }
  */
}
