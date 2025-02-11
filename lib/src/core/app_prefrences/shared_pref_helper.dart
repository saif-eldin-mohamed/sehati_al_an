import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class ILocalStorage {
  Future<void> removeData(String key);
  Future<void> clearAllData();
  Future<void> setData(String key, dynamic value);
  Future<bool> getBool(String key);
  Future<double> getDouble(String key);
  Future<int> getInt(String key);
  Future<String> getString(String key);
}

class SharedPrefHelper implements ILocalStorage {
  SharedPrefHelper(this._sharedPreferences);

  final SharedPreferences _sharedPreferences;

  @override
  Future<void> removeData(String key) async {
    await _sharedPreferences.remove(key);
  }

  @override
  Future<void> clearAllData() async {
    debugPrint('Clearing all SharedPreferences data...');
    await _sharedPreferences.clear();
  }

  @override
  Future<void> setData(String key, dynamic value) async {
    debugPrint("setData key=$key, value=$value");
    if (value is String) {
      await _sharedPreferences.setString(key, value);
    } else if (value is int) {
      await _sharedPreferences.setInt(key, value);
    } else if (value is bool) {
      await _sharedPreferences.setBool(key, value);
    } else if (value is double) {
      await _sharedPreferences.setDouble(key, value);
    } else {
      debugPrint("Unsupported data type for key=$key");
    }
  }

  @override
  Future<bool> getBool(String key) async =>
      _sharedPreferences.getBool(key) ?? false;

  @override
  Future<double> getDouble(String key) async =>
      _sharedPreferences.getDouble(key) ?? 0.0;

  @override
  Future<int> getInt(String key) async => _sharedPreferences.getInt(key) ?? 0;

  @override
  Future<String> getString(String key) async =>
      _sharedPreferences.getString(key) ?? '';
}

abstract class ISecureStorage {
  Future<void> setSecuredString(String key, String value);
  Future<String> getSecuredString(String key);
  Future<void> clearAllSecuredData();
}

class SecureStorageHelper implements ISecureStorage {
  SecureStorageHelper(this._secureStorage);

  final FlutterSecureStorage _secureStorage;

  @override
  Future<void> setSecuredString(String key, String value) async {
    debugPrint("setSecuredString key=$key, value=$value");
    try {
      await _secureStorage.write(key: key, value: value);
    } catch (e) {
      debugPrint("Error writing secured string: $e");
    }
  }

  @override
  Future<String> getSecuredString(String key) async {
    debugPrint("getSecuredString key=$key");
    try {
      return await _secureStorage.read(key: key) ?? '';
    } catch (e) {
      debugPrint("Error reading secured string: $e");
      await _secureStorage.delete(key: key);
      return '';
    }
  }

  @override
  Future<void> clearAllSecuredData() async {
    debugPrint('Clearing all secured data...');
    try {
      await _secureStorage.deleteAll();
    } catch (e) {
      debugPrint("Error clearing secured data: $e");
    }
  }
}
