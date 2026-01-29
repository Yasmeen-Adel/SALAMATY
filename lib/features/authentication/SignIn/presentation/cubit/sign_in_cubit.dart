import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salamaty/features/authentication/SignIn/presentation/cubit/sign_in_state.dart';
import 'package:salamaty/features/authentication/data/auth_repo.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit(this.authRepo) : super(SignInInitial());

  final AuthRepo authRepo;

  Future<void> login({
    required String email,
    required String password,
  }) async {
    //  Local Validation (TextField)
    Map<String, String?> localErrors = {};

    if (email.isEmpty) {
      localErrors['email'] = 'Email is required';
    } else if (!RegExp(
            r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
        .hasMatch(email)) {
      localErrors['email'] = 'Enter a valid email';
    }

    if (password.isEmpty) {
      localErrors['password'] = 'Password is required';
    } else if (password.length < 6) {
      localErrors['password'] =
          'Password must be at least 6 characters';
    }

    if (localErrors.isNotEmpty) {
      emit(
        SignInFailure(
          message: '',
          fieldErrors: localErrors,
        ),
      );
      return;
    }

    emit(SignInLoading());

    try {
      final data = await authRepo.login(
        email: email,
        password: password,
      );

      if (data['success'] == true) {
        emit(
          SignInSuccess(
            token: data['token'],
            email: data['email'],
            fullName: data['fullName'],
          ),
        );
      } else {
        final String message =
            data['message'] ?? 'Invalid email or password';

        emit(
          SignInFailure(
            message: message,
            fieldErrors: {
              'email': null,
              'password': null,
            },
          ),
        );
      }
    } catch (_) {
      emit(
        SignInFailure(
          message: 'Invalid email or password',
          fieldErrors: {
            'email': null,
            'password': null,
          },
        ),
      );
    }
  }
}
