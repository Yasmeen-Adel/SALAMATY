import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salamaty/features/authentication/data/auth_repo.dart';

part 'verification_state.dart';

class VerificationCubit extends Cubit<VerificationState> {
  VerificationCubit(this.authRepo)
      : super(VerificationInitial());

  final AuthRepo authRepo;

  Future<void> verify({
    required String email,
    required String otpCode,
  }) async {
    emit(VerificationLoading());

    try {
      await authRepo.verifyOtp(
        email: email,
        otpCode: otpCode,
      );

      emit(VerificationSuccess());
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
  // .............
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
