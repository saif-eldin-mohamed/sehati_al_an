import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sehati_al_an_app/src/core/routes/routes.dart';

import '../../../app.dart';
import '../../features/app_lay_out/app_lay_out.dart';
import '../../features/appointments/presentation/pages/appointments_details_screen.dart';
import '../../features/appointments/presentation/pages/video_call_screen.dart';
import '../../features/auth/presentation/pages/forget_password.dart';
import '../../features/auth/presentation/pages/sign_in.dart';
import '../../features/auth/presentation/pages/sign_up.dart';
import '../../features/onBoarding/presentation/screens/on_boarding_screen.dart';
import '../../features/search/presentation/pages/search_reasults_categories.dart';
import '../../features/splash_screen/splash_screen.dart';

class AppRouter {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.signInScreen:
        return MaterialPageRoute(builder: (_) => const SignIn());
      case Routes.signUpScreen:
        return MaterialPageRoute(builder: (_) => const SignUp());
      case Routes.forgetPasswordScreen:
        return MaterialPageRoute(builder: (_) => const ForgetPassword());
      case Routes.onBoardingScreen:
        return MaterialPageRoute(builder: (_) => const OnBoardingScreen());
      case Routes.appointmentsDetailsScreen:
        return MaterialPageRoute(
            builder: (_) => const AppointmentsDetailsScreen());
      case Routes.videoCallScreen:
        return MaterialPageRoute(builder: (_) => const VideoCallScreen());      case Routes.searchResultsCategoriesScreen:
      return MaterialPageRoute(builder: (_) =>  SearchResultsCategories());
      case Routes.appLayOut:
        return MaterialPageRoute(builder: (_) => const AppLayOut());
      default:
        return null;
    }
  }
}
