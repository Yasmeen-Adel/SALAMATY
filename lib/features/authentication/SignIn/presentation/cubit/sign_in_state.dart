abstract class SignInState {}

class SignInInitial extends SignInState {}

class SignInLoading extends SignInState {}

class SignInSuccess extends SignInState {
  final String token;
  final String email;
  final String fullName;

  SignInSuccess({
    required this.token,
    required this.email,
    required this.fullName,
  });
}

class SignInFailure extends SignInState {
  final String message;
  final Map<String, String?> fieldErrors;
  final bool needVerification;
  final String? email;

  SignInFailure({
    required this.message,
    required this.fieldErrors,
    this.needVerification = false,
    this.email,
  });
}
