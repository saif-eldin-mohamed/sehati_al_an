// import 'dart:developer';
// import 'package:dio/dio.dart';
// import 'package:flutter/cupertino.dart';
//
// import '../../connection/network_info.dart';
// import '../../helpers/shared_pref_helper.dart';
// import '../../routes/routes.dart';
// import 'api_constants.dart';
// import 'api_consumer.dart';
// import 'dio_factory.dart';
//
// class AppInterceptor extends InterceptorsWrapper {
//   @override
//   void onRequest(options, handler) async {
//     handler.next(options);
//   }
//
//   @override
//   void onError(DioException err, ErrorInterceptorHandler handler) async {
//     if (err.response?.statusCode == 401) {
//       final refreshToken =
//           await SharedPrefHelper.getSecuredString(SharedPrefKeys.refreshToken);
//
//       if (refreshToken != null) {
//         final success = await _refreshToken(refreshToken);
//
//         if (success) {
//           final requestOptions = err.response?.requestOptions;
//           if (requestOptions != null) {
//             FormData? newFormData;
//             if (requestOptions.data is FormData) {
//               newFormData = requestOptions.data.clone();
//             }
//
//             try {
//               final newResponse = await DioFactory.getDio().request(
//                 requestOptions.baseUrl + requestOptions.path,
//                 options: Options(
//                   method: requestOptions.method,
//                 ),
//                 data: requestOptions.data is FormData
//                     ? newFormData
//                     : requestOptions.data,
//                 queryParameters: requestOptions.queryParameters,
//               );
//
//               return handler.resolve(newResponse);
//             } catch (retryError) {
//               return handler.reject(err);
//             }
//           }
//         }
//       }
//     }
//
//     if (err.response?.statusCode == 403) {
//       log('Handling 403 error: Logging out');
//       await handleLogout();
//       return handler.reject(err);
//     }
//
//     return handler.next(err);
//   }
//
//   Future<bool> _refreshToken(String refreshToken) async {
//     try {
//       final apiService = DioConsumer(DioFactory.getDio());
//       final response = await apiService.get(
//         'auth/refresh-token',
//         data: {'token': refreshToken},
//       );
//
//       final accessToken = response.right['token'];
//
//       if (accessToken != null) {
//         await SharedPrefHelper.setSecuredString(
//             SharedPrefKeys.accessToken, accessToken);
//
//         DioFactory.setTokenIntoHeaderAfterLogin(accessToken);
//         log('Token refresh successful: $accessToken');
//
//         return true;
//       }
//     } catch (e) {
//       log('Token refresh failed: $e');
//     }
//     return false;
//   }
// }
//
// Future<void> handleLogout() async {
//   await SharedPrefHelper.clearAllSecuredData();
//   await SharedPrefHelper.removeData(key: 'remember_me_checked');
//
//   navigatorKey.currentState?.pushNamedAndRemoveUntil(
//     Routes.loginScreen,
//     (Route<dynamic> route) => false,
//   );
// }
