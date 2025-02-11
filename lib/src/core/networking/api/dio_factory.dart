import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../app_prefrences/shared_pref_helper.dart';
import 'api_constants.dart';
import 'app_interceptor.dart';

import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../../app_prefrences/shared_pref_helper.dart';
import 'api_constants.dart';
import 'app_interceptor.dart';

class DioFactory {
  DioFactory._();

  static final Dio _dio = Dio()
    ..options = BaseOptions(
      baseUrl: ApiConstants.apiBaseUrl,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
    )
    // ..interceptors.add(AppInterceptor())
    ..interceptors.add(
      PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseHeader: true,
        error: true,
        compact: true,
      ),
    );

  static Dio getDio() => _dio;

  static void setAuthorizationToken(String token) {
    _dio.options.headers['Authorization'] = 'Bearer $token';
  }

  static Future<void> addHeaders() async {
    _dio.options.headers.addAll({
      'Accept': 'application/json',
      // 'Authorization': 'Bearer ${await SharedPrefHelper.getSecuredString(SharedPrefKeys.accessToken)}',
    });
  }
}
