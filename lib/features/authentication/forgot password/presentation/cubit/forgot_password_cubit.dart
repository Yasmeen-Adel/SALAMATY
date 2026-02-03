import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salamaty/features/authentication/data/auth_repo.dart';
import 'forgot_password_state.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  ForgotPasswordCubit(this.authRepo) : super(ForgotPasswordInitial());

  final AuthRepo authRepo;

  Future<void> sendOtp({required String email}) async {
    emit(ForgotPasswordLoading());

    try {
      final response = await authRepo.forgotPassword(email: email);

      emit(
        ForgotPasswordSuccess(
          email: email,
          message: response['message'],
        ),
      );
    } catch (e) {
      String errorMessage = 'Something went wrong';

      if (e is Map) {
        // message 
        if (e['message'] != null) {
          errorMessage = e['message'];
        }
        // validation errors
        else if (e['errors'] != null) {
          final errors = e['errors'] as Map;
          errorMessage = errors.values.first.first;
        }
        // title
        else if (e['title'] != null) {
          errorMessage = e['title'];
        }
      }

      emit(ForgotPasswordFailure(message: errorMessage));
    }
  }
}
