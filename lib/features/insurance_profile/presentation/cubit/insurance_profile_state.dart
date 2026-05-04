part of 'insurance_profile_cubit.dart';

abstract class InsuranceProfileState {}

class InsuranceProfileInitial extends InsuranceProfileState {}

class InsuranceProfileLoading extends InsuranceProfileState {}

class InsuranceProfileLoaded extends InsuranceProfileState {
  final InsuranceProfileModel profile;
  InsuranceProfileLoaded({required this.profile});
}

class InsuranceProfileError extends InsuranceProfileState {
  final String message;
  InsuranceProfileError({required this.message});
}