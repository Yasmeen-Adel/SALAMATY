

part of 'select_insurance_cubit.dart';

abstract class InsuranceState {}

class InsuranceInitial extends InsuranceState {}

class InsuranceLoading extends InsuranceState {}

class InsuranceLoaded extends InsuranceState {
  final List<InsuranceProvider> providers;
  final InsuranceProvider? selectedProvider;

  InsuranceLoaded({
    required this.providers,
    this.selectedProvider,
  });
}

class InsuranceError extends InsuranceState {
  final String message;
  InsuranceError({required this.message});
}