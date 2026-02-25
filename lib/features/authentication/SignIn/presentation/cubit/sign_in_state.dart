abstract class SignInState {}

class SignInInitial extends SignInState {}

class SignInLoading extends SignInState {
  final bool fromGoogle;
  SignInLoading({this.fromGoogle = false});
}

class SignInSuccess extends SignInState {
  final String token;
  final String email;
  final String fullName;
  final bool fromGoogle;

  SignInSuccess({
    required this.token,
    required this.email,
    required this.fullName,
    this.fromGoogle = false,
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
