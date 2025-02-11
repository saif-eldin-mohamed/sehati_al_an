import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import '../app_prefrences/shared_pref_helper.dart';
import '../networking/api/api_consumer.dart';
import '../networking/api/dio_consumer.dart';
import '../networking/api/dio_factory.dart';

final GetIt sl = GetIt.instance;

class ServicesLocator {
  Future<void> init() async {
    // Networking
    sl.registerLazySingleton<Dio>(() => DioFactory.getDio());
    sl.registerLazySingleton<ApiConsumer>(() => DioConsumer());

    // Shared Preferences
    final sharedPreferences = await SharedPreferences.getInstance();
    sl.registerLazySingleton<ILocalStorage>(
        () => SharedPrefHelper(sharedPreferences));

    // Secure Storage
    const secureStorage = FlutterSecureStorage();
    sl.registerLazySingleton<ISecureStorage>(
        () => SecureStorageHelper(secureStorage));
  }
}
