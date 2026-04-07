class ApiConstants {
  static const String baseUrl = 'http://salamaty.runasp.net';
  //Authentication ...............)
  static const String register = '/api/auth/Sign-UP'; //Done
  static const String login = '/api/auth/login'; //Done
  static const String verifyOtp = '/api/auth/verify-otp'; //Done
  static const String resendOtp = '/api/auth/resend-otp'; //Done
  static const String forgotPassword = '/api/auth/forgot-password'; //Done
  static const String resetPassword = '/api/auth/reset-password'; //Done
  static const String logout = '/api/auth/logout'; //
  static const String googleLogin = '/api/auth/google-login'; //Done
  static const String deleteAccount = '/api/auth/delete-account'; //Done
  static const String uploadProfileImage = '/api/User/upload-photo'; //Done
  static const String updateLocation = '/api/User/update-location'; //Done
  static const String getProfile = '/api/User/profile'; //Done
  static const String editProfile = '/api/User/EditProfile'; //Done
  static const String homeTips = '/api/home/Tips';
  static const String specialtiesProviders = '/api/home/specialties-providers';
  static const String nearbyTop3 = '/api/Facilities/nearby-top3';
  static const String allFacilities = '/api/Facilities/all-facilities';
}
