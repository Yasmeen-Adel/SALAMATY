part of 'insurance_services_cubit.dart';

abstract class InsuranceServicesState {}

class InsuranceServicesInitial extends InsuranceServicesState {}

class InsuranceServicesLoading extends InsuranceServicesState {}

class InsuranceServicesLoaded extends InsuranceServicesState {
  final List<FacilityModel> facilities;
  final String selectedFilter;

  InsuranceServicesLoaded({
    required this.facilities,
    required this.selectedFilter,
  });
}

class InsuranceServicesError extends InsuranceServicesState {
  final String message;
  InsuranceServicesError({required this.message});
}