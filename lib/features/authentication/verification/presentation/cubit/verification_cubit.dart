import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salamaty/core/network/dio_helper.dart';
import 'package:salamaty/core/services/auth_local_storage.dart';
import 'package:salamaty/features/authentication/data/auth_repo.dart';
import 'package:salamaty/features/authentication/verification/presentation/cubit/verification_state.dart';
class VerificationCubit extends Cubit<VerificationState> {
  VerificationCubit(this.authRepo) : super(VerificationInitial());

  final AuthRepo authRepo;
Future<void> verify({
  required String email,
  required String otpCode,
}) async {
  emit(VerificationLoading());

  try {
    final data = await authRepo.verifyOtp(
      email: email,
      otpCode: otpCode,
    );

    if (data['success'] == true && data['token'] != null) {
      // Save user
      await AuthLocalStorage.saveUser(
        token: data['token'],
        email: data['data']['email'],
        fullName: data['data']['fullName'],
      );

      // Set token in Dio
      DioHelper.setToken(data['token']);

      emit(VerificationSuccess());
    } else {
      emit(
        VerificationFailure(
          message: data['message'] ?? 'Verification failed',
        ),
      );
    }
  } catch (e) {
    emit(
      VerificationFailure(
        message: e is Map && e['message'] != null
            ? e['message']
            : 'Invalid OTP code',
      ),
    );
  }
}

  // Future<void> verify({
  //   required String email,
  //   required String otpCode,
  // }) async {
  //   emit(VerificationLoading());

  //   try {
  //     await authRepo.verifyOtp(
  //       email: email,
  //       otpCode: otpCode,
  //     );

  //     emit(VerificationSuccess());
  //   } catch (e) {
  //     emit(
  //       VerificationFailure(
  //         message: e is Map && e['message'] != null
  //             ? e['message']
  //             : 'Invalid OTP code',
  //       ),
  //     );
  //   }
  // }

  Future<void> resendOtp({required String email}) async {
    emit(ResendOtpLoading());

    try {
      await authRepo.resendOtp(email: email);

      emit(
        ResendOtpSuccess(
          message: 'OTP has been sent again',
        ),
      );
    } catch (e) {
      emit(
        ResendOtpFailure(
          message: e is Map && e['message'] != null
              ? e['message']
              : 'Failed to resend OTP',
        ),
      );
    }
  }
}
