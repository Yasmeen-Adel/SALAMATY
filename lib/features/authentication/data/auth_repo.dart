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
          "fullname": fullName,
          "email": email,
          "password": password,
          "confirmpassword": confirmPassword,
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

  // Login ............ :)
  Future<Map<String, dynamic>> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await DioHelper.post(
        url: ApiConstants.login,
        data: {
          "email": email,
          "password": password,
        },
      );

      return response.data;
    } on DioException catch (e) {
      if (e.response?.data != null) {
        throw e.response!.data;
      }

      throw {
        "message": "Server error, try again",
        "validationErrors": null,
      };
    }
  }

// Verify OTP ........ :)
  Future<void> verifyOtp({
    required String email,
    required String otpCode,
  }) async {
    try {
      await DioHelper.post(
        url: ApiConstants.verifyOtp,
        data: {
          "email": email,
          "otpCode": otpCode,
        },
      );
    } on DioException catch (e) {
      if (e.response?.data != null) {
        throw e.response!.data;
      }

      throw {
        "message": "Verification failed",
      };
    }
  }

  // Resend OTP ........ :)
  Future<void> resendOtp({
    required String email,
  }) async {
    try {
      await DioHelper.post(
        url: ApiConstants.resendOtp,
        data: email,
        // data: {
        //   "email": email,
        // },
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
}
