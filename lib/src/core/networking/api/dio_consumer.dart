import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:either_dart/either.dart';

import '../../helpers/enums.dart';
import 'api_consumer.dart';
import 'dio_factory.dart';
import 'failure.dart';

class DioConsumer implements ApiConsumer {
  final Dio _dio = DioFactory.getDio();

  @override
  Future<Either<Failure, dynamic>> request(
    String path, {
    Object? body,
    Map<String, dynamic>? queryParameters,
    required RequestMethod method,
  }) async {
    try {
      late Response response;

      switch (method) {
        case RequestMethod.get:
          response = await _dio.get(path, queryParameters: queryParameters);
          break;
        case RequestMethod.post:
          response = await _dio.post(path,
              data: body, queryParameters: queryParameters);
          break;
        case RequestMethod.put:
          response = await _dio.put(path,
              data: body, queryParameters: queryParameters);
          break;
        case RequestMethod.delete:
          response = await _dio.delete(path,
              data: body, queryParameters: queryParameters);
          break;
        case RequestMethod.patch:
          response = await _dio.patch(path,
              data: body, queryParameters: queryParameters);
          break;
      }

      return Right(response.data);
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    }
  }
}
