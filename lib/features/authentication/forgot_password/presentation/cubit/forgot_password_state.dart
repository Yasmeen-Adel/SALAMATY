abstract class ForgotPasswordState {}

class ForgotPasswordInitial extends ForgotPasswordState {}

class ForgotPasswordLoading extends ForgotPasswordState {}

class ForgotPasswordSuccess extends ForgotPasswordState {
  final String email;
  final String message;

  ForgotPasswordSuccess({
    required this.email,
    required this.message,
  });
}


class ForgotPasswordFailure extends ForgotPasswordState {
  final String message;
  ForgotPasswordFailure({required this.message});
}
