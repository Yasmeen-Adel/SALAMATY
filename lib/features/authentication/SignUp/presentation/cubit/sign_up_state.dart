abstract class SignUpState {}

class SignUpInitial extends SignUpState {}

class SignUpLoading extends SignUpState {}

class SignUpSuccess extends SignUpState {
  final String email;

  SignUpSuccess({required this.email});
}

class SignUpError extends SignUpState {
  final String message;
  final Map<String, String?> fieldErrors;

  SignUpError({
    required this.message,
    required this.fieldErrors,
  });
}

