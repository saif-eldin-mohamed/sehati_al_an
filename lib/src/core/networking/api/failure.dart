import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';

abstract class Failure {
  final String message;
  Failure(this.message);
}

class ServerFailure extends Failure {
  ServerFailure(super.message);

  factory ServerFailure.fromDioError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return ServerFailure(AppErrorMessage.timeoutError.tr());
      case DioExceptionType.badCertificate:
        return ServerFailure(AppErrorMessage.badRequestError.tr());
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            e.response?.statusCode ?? 500, e.response?.data);
      case DioExceptionType.cancel:
        return ServerFailure(AppErrorMessage.cacheError.tr());
      case DioExceptionType.connectionError:
        return ServerFailure(AppErrorMessage.noInternetError.tr());
      case DioExceptionType.unknown:
      default:
        return ServerFailure(AppErrorMessage.unknownError.tr());
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    final message = response['message'] ?? AppErrorMessage.defaultError.tr();
    return ServerFailure(message);
  }
}

class AppErrorMessage {
  static const String badRequestError = "bad_request_error";
  static const String forbiddenError = "forbidden_error";
  static const String unauthorizedError = "unauthorized_error";
  static const String notFoundError = "not_found_error";
  static const String conflictError = "conflict_error";
  static const String internalServerError = "internal_server_error";
  static const String unknownError = "unknown_error";
  static const String timeoutError = "timeout_error";
  static const String defaultError = "default_error";
  static const String cacheError = "cache_error";
  static const String noInternetError = "no_internet_error";
}
