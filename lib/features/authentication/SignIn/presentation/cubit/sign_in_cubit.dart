// import 'package:dio/dio.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:salamaty/features/authentication/SignIn/presentation/cubit/sign_in_state.dart';
// import 'package:salamaty/features/authentication/data/auth_repo.dart';
// import 'package:salamaty/core/network/dio_helper.dart';
// import 'package:salamaty/core/services/auth_local_storage.dart';

// class SignInCubit extends Cubit<SignInState> {
//   SignInCubit(this.authRepo) : super(SignInInitial());

//   final AuthRepo authRepo;

//   Future<void> login({
//     required String email,
//     required String password,
//   }) async {
//     Map<String, String?> localErrors = {};

//     if (email.isEmpty) {
//       localErrors['email'] = 'Email is required';
//     } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email)) {
//       localErrors['email'] = 'Enter a valid email';
//     }

//     if (password.isEmpty) {
//       localErrors['password'] = 'Password is required';
//     } else if (password.length < 6) {
//       localErrors['password'] = 'Password must be at least 6 characters';
//     }

//     if (localErrors.isNotEmpty) {
//       emit(SignInFailure(
//         message: '',
//         fieldErrors: localErrors,
//       ));
//       return;
//     }

//     emit(SignInLoading(fromGoogle: false));

//     try {
//       final data = await authRepo.login(
//         email: email,
//         password: password,
//       );

//       // SUCCESS
//       if (data['success'] == true) {
//         await AuthLocalStorage.saveUser(
//           token: data['token'],
//           email: data['email'],
//           fullName: data['fullName'],
//           userId: data['userId']?.toString(), // 👈 ده أهم تعديل
//         );

//         DioHelper.setToken(data['token']);

//         emit(SignInSuccess(
//           token: data['token'],
//           email: data['email'],
//           fullName: data['fullName'],
//         ));
//         return;
//       }

//       // EMAIL NOT VERIFIED
//       if (data['isEmailConfirmed'] == false) {
//         await authRepo.resendOtp(email: data['email']);

//         emit(SignInFailure(
//           message: data['message'] ?? 'Account not verified',
//           fieldErrors: {},
//           needVerification: true,
//           email: data['email'],
//         ));
//         return;
//       }

//       // WRONG EMAIL / PASSWORD
//       emit(SignInFailure(
//         message: data['message'] ?? 'Invalid email or password',
//         fieldErrors: {
//           'email': null,
//           'password': null,
//         },
//       ));
//     } on DioException catch (e) {
//       final data = e.response?.data;

//       // EMAIL NOT VERIFIED
//       if (data != null &&
//           data['isEmailConfirmed'] == false &&
//           data['email'] != null) {
//         await authRepo.resendOtp(email: data['email']);

//         emit(SignInFailure(
//           message: data['message'] ?? 'Email not verified',
//           fieldErrors: {},
//           needVerification: true,
//           email: data['email'],
//         ));
//         return;
//       }

//       // EMAIL NOT FOUND
//       if (data != null &&
//           data['message'] != null &&
//           data['message'].toString().toLowerCase().contains('not found')) {
//         emit(SignInFailure(
//           message: data['message'],
//           fieldErrors: {
//             'email': data['message'],
//           },
//         ));
//         return;
//       }

//       // WRONG PASSWORD / GENERAL ERROR
//       emit(SignInFailure(
//         message: data?['message'] ?? 'Invalid email or password',
//         fieldErrors: {
//           'email': null,
//           'password': null,
//         },
//       ));
//     }
//   }

//   // ================= GOOGLE LOGIN =================

//   Future<void> googleLogin(String token) async {
//     emit(SignInLoading(fromGoogle: true));

//     try {
//       final data = await authRepo.googleLogin(token);

//       // if (data['success'] == true)
//       if (data['success'] == true && data['token'] != null) {
//         await AuthLocalStorage.saveUser(
//           token: data['token'],
//           email: data['email'],
//           fullName: data['fullName'],
//            userId: data['userId']?.toString(),
//         );

//         DioHelper.setToken(data['token']);

//         emit(SignInSuccess(
//           token: data['token'],
//           email: data['email'],
//           fullName: data['fullName'],
//           fromGoogle: true,
//         ));
//       } else {
//         emit(SignInFailure(
//           message: data['message'] ?? 'Google login failed',
//           fieldErrors: {},
//         ));
//       }
//     } catch (_) {
//       emit(SignInFailure(
//         message: 'Google login failed',
//         fieldErrors: {},
//       ));
//     }
//   }
// }

import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salamaty/features/authentication/SignIn/presentation/cubit/sign_in_state.dart';
import 'package:salamaty/features/authentication/data/auth_repo.dart';
import 'package:salamaty/core/network/dio_helper.dart';
import 'package:salamaty/core/services/auth_local_storage.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit(this.authRepo) : super(SignInInitial());

  final AuthRepo authRepo;

  String? _extractUserIdFromToken(String token) {
    try {
      final parts = token.split('.');
      if (parts.length != 3) return null;

      String payload = parts[1];
      while (payload.length % 4 != 0) {
        payload += '=';
      }

      final decoded = utf8.decode(base64Url.decode(payload));
      final Map<String, dynamic> json = jsonDecode(decoded);

      return json[
          'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/nameidentifier'];
    } catch (_) {
      return null;
    }
  }

  Future<void> login({
    required String email,
    required String password,
  }) async {
    Map<String, String?> localErrors = {};

    if (email.isEmpty) {
      localErrors['email'] = 'Email is required';
    } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email)) {
      localErrors['email'] = 'Enter a valid email';
    }

    if (password.isEmpty) {
      localErrors['password'] = 'Password is required';
    } else if (password.length < 6) {
      localErrors['password'] = 'Password must be at least 6 characters';
    }

    if (localErrors.isNotEmpty) {
      emit(SignInFailure(
        message: '',
        fieldErrors: localErrors,
      ));
      return;
    }

    emit(SignInLoading(fromGoogle: false));

    try {
      final data = await authRepo.login(
        email: email,
        password: password,
      );

      // SUCCESS
      if (data['success'] == true) {
        await AuthLocalStorage.saveUser(
          token: data['token'],
          email: data['email'],
          fullName: data['fullName'],
          userId: _extractUserIdFromToken(data['token']),
        );

        DioHelper.setToken(data['token']);

        emit(SignInSuccess(
          token: data['token'],
          email: data['email'],
          fullName: data['fullName'],
        ));
        return;
      }

      // EMAIL NOT VERIFIED
      if (data['isEmailConfirmed'] == false) {
        await authRepo.resendOtp(email: data['email']);

        emit(SignInFailure(
          message: data['message'] ?? 'Account not verified',
          fieldErrors: {},
          needVerification: true,
          email: data['email'],
        ));
        return;
      }

      // WRONG EMAIL / PASSWORD
      emit(SignInFailure(
        message: data['message'] ?? 'Invalid email or password',
        fieldErrors: {
          'email': null,
          'password': null,
        },
      ));
    } on DioException catch (e) {
      final data = e.response?.data;

      // EMAIL NOT VERIFIED
      if (data != null &&
          data['isEmailConfirmed'] == false &&
          data['email'] != null) {
        await authRepo.resendOtp(email: data['email']);

        emit(SignInFailure(
          message: data['message'] ?? 'Email not verified',
          fieldErrors: {},
          needVerification: true,
          email: data['email'],
        ));
        return;
      }

      // EMAIL NOT FOUND
      if (data != null &&
          data['message'] != null &&
          data['message'].toString().toLowerCase().contains('not found')) {
        emit(SignInFailure(
          message: data['message'],
          fieldErrors: {
            'email': data['message'],
          },
        ));
        return;
      }

      // WRONG PASSWORD / GENERAL ERROR
      emit(SignInFailure(
        message: data?['message'] ?? 'Invalid email or password',
        fieldErrors: {
          'email': null,
          'password': null,
        },
      ));
    }
  }

  // ================= GOOGLE LOGIN =================

  Future<void> googleLogin(String token) async {
    emit(SignInLoading(fromGoogle: true));

    try {
      final data = await authRepo.googleLogin(token);

      if (data['success'] == true && data['token'] != null) {
        await AuthLocalStorage.saveUser(
          token: data['token'],
          email: data['email'],
          fullName: data['fullName'],
          userId: _extractUserIdFromToken(data['token']),
        );

        DioHelper.setToken(data['token']);

        emit(SignInSuccess(
          token: data['token'],
          email: data['email'],
          fullName: data['fullName'],
          fromGoogle: true,
        ));
      } else {
        emit(SignInFailure(
          message: data['message'] ?? 'Google login failed',
          fieldErrors: {},
        ));
      }
    } catch (_) {
      emit(SignInFailure(
        message: 'Google login failed',
        fieldErrors: {},
      ));
    }
  }
}
