import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salamaty/features/authentication/data/auth_repo.dart';

part 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit(this.authRepo) : super(ResetPasswordInitial());

  final AuthRepo authRepo;

  Future<void> resetPassword({
    required String email,
    required String otpCode,
    required String newPassword,
    required String confirmPassword,
  }) async {
    emit(ResetPasswordLoading());

    try {
      await authRepo.resetPassword(
        email: email,
        otpCode: otpCode,
        newPassword: newPassword,
        confirmPassword: confirmPassword,
      );

      emit(
        ResetPasswordSuccess(
          message: 'Password updated successfully',
        ),
      );
    } catch (e) {
      String errorMessage = 'Something went wrong';

      if (e is Map) {
        if (e['message'] != null) {
          errorMessage = e['message'];
        } else if (e['errors'] != null) {
          final errors = e['errors'] as Map;
          errorMessage = errors.values.first.first;
        }
      }

      emit(ResetPasswordFailure(message: errorMessage));
    }
  }
}
