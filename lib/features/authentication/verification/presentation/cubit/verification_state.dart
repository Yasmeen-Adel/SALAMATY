part of 'verification_cubit.dart';

abstract class VerificationState {}

class VerificationInitial extends VerificationState {}

class VerificationLoading extends VerificationState {}

class VerificationSuccess extends VerificationState {}

class VerificationFailure extends VerificationState {
  final String message;

  VerificationFailure({required this.message});
}

//Resend OTP .......... :)
class ResendOtpLoading extends VerificationState {}

class ResendOtpSuccess extends VerificationState {
  final String message;
  ResendOtpSuccess({required this.message});
}

class ResendOtpFailure extends VerificationState {
  final String message;
  ResendOtpFailure({required this.message});
}
