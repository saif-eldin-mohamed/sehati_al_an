import 'package:flutter/material.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

class Routes {
  static const String splashScreen = '/splashScreen';
  static const String onboardingScreen = '/onboardingScreen';
  static const String loginScreen = '/loginScreen';
  static const String resetPassword = '/resetPassword';
  static const String changePassword = '/changePassword';
  static const String patientDetailsScreenForNurse =
      '/patientDetailsScreenForNurse';

  static const String customNavBarApp = '/customNavBarApp';
  static const String upcomingCompleteAppointmentsScreen =
      '/upcomingCompleteAppointmentsScreen';
  static const String upcomingUnCompleteAppointmentsScreen =
      '/upcomingUnCompleteAppointmentsScreen';
  static const String appointmentDetailsForRequestsScreen1 =
      '/appointmentDetailsForRequestsScreen1';
  static const String otpScreen = '/otpScreen';

  static const String forgetPasswordScreen = '/forgetPasswordScreen';

  static const String appointmentDetailsForRequestsScreen2 =
      '/appointmentDetailsForRequestsScreen2';
  static const String appointmentDetailsForBookingScreen1 =
      '/appointmentDetailsForBookingScreen1';
  static const String allRequestsScreenFromHome = '/allRequestsScreenFromHome';
  static const String patientCaseScreen = '/patientCaseScreen';
  static const String doctorLocationScreen = '/doctorLocationScreen';
  static const String patientDetailsScreen = '/patientDetailsScreen';
  static const String checkupReportScreen = '/checkupReportScreen';
  static const String allRequestsScreen = '/allRequestsScreen';
  static const String checkUpDetailsScreen = '/checkUpDetailsScreen';
  static const String pharmaceuticalScreen = '/pharmaceuticalScreen';
  static const String profileScreen = '/profileScreen';
  static const String editProfileScreen = '/editProfileScreen';
  static const String contactSupportScreen = '/contactSupportScreen';
  static const String notificationScreen = '/notificationScreen';
}
