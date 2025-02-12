import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

class Routes {
  static const String splashScreen = '/';
  static const String homeScreen = '/home';
}
