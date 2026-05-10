part of 'insurance_information_cubit.dart';

abstract class InsuranceInformationState {}

class InsuranceInformationInitial extends InsuranceInformationState {}

class InsuranceInformationScanLoading extends InsuranceInformationState {}

class InsuranceInformationScanSuccess extends InsuranceInformationState {
  final ScanResponseModel response;
  InsuranceInformationScanSuccess({required this.response});
}

class InsuranceInformationScanMismatch extends InsuranceInformationState {
  final String message;
  InsuranceInformationScanMismatch({required this.message});
}

class InsuranceInformationImagesUpdated extends InsuranceInformationState {
  final File? frontImage;
  InsuranceInformationImagesUpdated({this.frontImage});
}

class InsuranceInformationMissingImages extends InsuranceInformationState {}

class InsuranceInformationSubmitLoading extends InsuranceInformationState {}

class InsuranceInformationSubmitSuccess extends InsuranceInformationState {}

class InsuranceInformationError extends InsuranceInformationState {
  final String message;
  InsuranceInformationError({required this.message});
}