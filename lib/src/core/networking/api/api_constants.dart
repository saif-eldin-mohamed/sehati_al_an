class ApiConstants {
  static const String apiBaseUrl = "http://209.250.237.58:1206/api/";
  static const String apiShowImages = "http://209.250.237.58:1206/uploads/";

  // static const String apiBaseUrl = "http://192.168.1.60:1206/api/";
  // static const String apiShowImages = "http://192.168.1.60:1206/uploads/";

  // auth
  static const String login = "auth/login";
  static const String refreshToken = "auth/refresh-token";
  static const String changePassword = "auth/change-password";
  static const String forgetPassword = "auth/forget-password";
  static const String sendOtp = "auth/send-otp";
  static const String notifications = "notifications";

  // profile
  static const String getProfile = "auth/profile";
  static const String editProfile = "users";
  static const String uploadImage = "uploads/image";
  static const String uploadImages = "uploads/images";

  // orders
  static const String getAllOrders = "orders";
  static const String getAllServices = "services";
  static const String getOrdersForServices = "orders/service";
  static const String getOrdersTarget = "orders/targets";
  static const String editUserById = "users";
  static const String contacts = "contacts";
}

class ApiErrors {
  static const String badRequestError = "badRequestError";
  static const String noContent = "noContent";
  static const String forbiddenError = "forbiddenError";
  static const String unauthorizedError = "unauthorizedError";
  static const String notFoundError = "notFoundError";
  static const String conflictError = "conflictError";
  static const String internalServerError = "internalServerError";
  static const String unknownError = "unknownError";
  static const String timeoutError = "timeoutError";
  static const String defaultError = "defaultError";
  static const String cacheError = "cacheError";
  static const String noInternetError = "No Internet";
  static const String loadingMessage = "loading_message";
  static const String retryAgainMessage = "retry_again_message";
  static const String ok = "Ok";
}

bool isloggedInUser = false;

bool isRememberMeChecked = false;
String roleUser = "";
// ValueNotifier<int>? PageChanged ;
bool pageChanges = false;

class SharedPrefKeys {
  static const String onboardingCompleted = 'onboarding_completed';
  static const String rememberMeChecked = 'remember_me_checked';
  static const String refreshToken = 'refresh_token';
  static const String accessToken = 'access_token';
  static const String userId = 'user_id';
  static const String role = 'role';
}
