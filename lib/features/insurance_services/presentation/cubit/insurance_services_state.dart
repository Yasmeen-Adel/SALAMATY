part of 'insurance_services_cubit.dart';

abstract class InsuranceServicesState {}

class InsuranceServicesInitial extends InsuranceServicesState {}

class InsuranceServicesLoading extends InsuranceServicesState {}

class InsuranceServicesLoaded extends InsuranceServicesState {
  final List<NearbyService> services;
  final String selectedType;

  InsuranceServicesLoaded({
    required this.services,
    required this.selectedType,
  });
}

class InsuranceServicesError extends InsuranceServicesState {
  final String message;
  InsuranceServicesError({required this.message});
}