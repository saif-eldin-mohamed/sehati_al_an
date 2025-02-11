import 'dart:async';

import '../../helpers/enums.dart';

abstract class ApiConsumer {
  FutureOr request(
    String path, {
    Object? body,
    Map<String, dynamic>? queryParameters,
    required RequestMethod method,
  });
}
