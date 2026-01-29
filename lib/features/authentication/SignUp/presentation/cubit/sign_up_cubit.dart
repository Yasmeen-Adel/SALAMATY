import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salamaty/features/authentication/data/auth_repo.dart';
import 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final AuthRepo authRepo;

  SignUpCubit(this.authRepo) : super(SignUpInitial());

  Future<void> signUp({
    required String fullName,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    emit(SignUpLoading());

    try {
      await authRepo.register(
        fullName: fullName,
        email: email,
        password: password,
        confirmPassword: confirmPassword,
      );

      //  success
      emit(
        SignUpSuccess(
          email: email,
        ),
      );
    } catch (e) {
      //  validation errors from backend
      if (e is Map) {
        final Map<String, String?> fieldErrors = {};

        e.forEach((key, value) {
          if (value is List && value.isNotEmpty) {
            fieldErrors[key.toString().toLowerCase()] = value.first;
          }
        });

        emit(
          SignUpError(
            message: 'Validation error',
            fieldErrors: fieldErrors,
          ),
        );
      } else {
        //  general error
        emit(
          SignUpError(
            message: 'Something went wrong',
            fieldErrors: {},
          ),
        );
      }
    }
  }
}
