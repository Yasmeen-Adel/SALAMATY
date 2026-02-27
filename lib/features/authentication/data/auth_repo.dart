import 'package:dio/dio.dart';
import 'package:salamaty/core/network/api_constants.dart';
import 'package:salamaty/core/network/dio_helper.dart';

class AuthRepo {
  // Sign Up ............ :)
  Future<void> register({
    required String fullName,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    try {
      await DioHelper.post(
        url: ApiConstants.register,
        data: {
          "fullName": fullName,
          "email": email,
          "password": password,
          "confirmPassword": confirmPassword,
        },
      );
    } on DioException catch (e) {
      final data = e.response?.data;

      if (data != null && data['errors'] != null) {
        throw data['errors'];
      }

      if (data != null &&
          data['message'] != null &&
          data['message'].toString().toLowerCase().contains('email')) {
        throw {
          'Email': [data['message']]
        };
      }

      throw {
        'general': ['Server error, try again']
      };
    }
  }

  // // Login ............ :)
  Future<Map<String, dynamic>> login({
    required String email,
    required String password,
  }) async {
    final response = await DioHelper.post(
      url: ApiConstants.login,
      data: {
        "email": email,
        "password": password,
      },
    );

    return response.data as Map<String, dynamic>;
  }

  Future<Map<String, dynamic>> verifyOtp({
    required String email,
    required String otpCode,
  }) async {
    try {
      final response = await DioHelper.post(
        url: ApiConstants.verifyOtp,
        data: {
          "email": email,
          "otpCode": otpCode,
        },
      );

      return response.data;
    } on DioException catch (e) {
      if (e.response?.data != null) {
        throw e.response!.data;
      }

      throw {
        "message": "Verification failed",
      };
    }
  }

  // Resend OTP ............ :)
  Future<void> resendOtp({
    required String email,
  }) async {
    try {
      await DioHelper.post(
        url: ApiConstants.resendOtp,
        data: {
          "email": email,
        },
      );
    } on DioException catch (e) {
      if (e.response?.data != null) {
        throw e.response!.data;
      }

      throw {
        "message": "Failed to resend OTP",
      };
    }
  }

  // Forgot Password ............ :)
  Future<Map<String, dynamic>> forgotPassword({
    required String email,
  }) async {
    try {
      final response = await DioHelper.post(
        url: ApiConstants.forgotPassword,
        data: {
          "email": email,
        },
      );
      return response.data;
    } on DioException catch (e) {
      if (e.response?.data != null) {
        throw e.response!.data;
      }

      throw {
        "message": "Failed to send reset code",
      };
    }
  }

  // Reset Password ............ :)
  Future<void> resetPassword({
    required String email,
    required String otpCode,
    required String newPassword,
    required String confirmPassword,
  }) async {
    try {
      await DioHelper.post(
        url: ApiConstants.resetPassword,
        data: {
          "email": email,
          "otpCode": otpCode,
          "newPassword": newPassword,
          "confirmPassword": confirmPassword,
        },
      );
    } on DioException catch (e) {
      if (e.response?.data != null) {
        throw e.response!.data;
      }

      throw {
        "message": "Reset password failed",
      };
    }
  }

  //google login ............)
  Future<Map<String, dynamic>> googleLogin(String token) async {
    try {
      final response = await DioHelper.post(
        url: ApiConstants.googleLogin,
        data: {
          "token": token,
        },
      );
      return response.data;
    } on DioException catch (e) {
      if (e.response?.data != null) {
        throw e.response!.data;
      }
      throw {
        "message": "Server error",
      };
    }
  }

  // Update User Location ............ :)
  Future<Map<String, dynamic>> updateLocation({
    required double lat,
    required double lng,
  }) async {
    try {
      final response = await DioHelper.patch(
        url: ApiConstants.updateLocation,
        data: {
          "locationLat": lat,
          "locationLng": lng,
        },
      );

      return response.data;
    } on DioException catch (e) {
      throw e.response?.data ?? {"message": "Failed to update location"};
    }
  }
}