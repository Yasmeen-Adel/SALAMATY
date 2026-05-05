



part of 'insurance_information_cubit.dart';

abstract class InsuranceInformationState {}

class InsuranceInformationInitial extends InsuranceInformationState {}

class InsuranceInformationLoading extends InsuranceInformationState {}

class InsuranceInformationScanLoading extends InsuranceInformationState {
  final File? frontImage;
  final File? backImage;

  InsuranceInformationScanLoading({this.frontImage, this.backImage});
}

class InsuranceInformationImagesUpdated extends InsuranceInformationState {
  final File? frontImage;
  final File? backImage;
  final String? autoFilledId;
  final String? autoFilledHolderName;
  final String? autoFilledPolicy;
  final String? autoFilledValidUntil;
  final String? autoFilledStatus;
  final String? autoFilledProvider; // اسم الـ provider اللي رجع من الـ scan
  // null = no scan yet, true = success, false = error
  final bool? scanSuccess;
  final String? scanMessage;

  InsuranceInformationImagesUpdated({
    this.frontImage,
    this.backImage,
    this.autoFilledId,
    this.autoFilledHolderName,
    this.autoFilledPolicy,
    this.autoFilledValidUntil,
    this.autoFilledStatus,
    this.autoFilledProvider,
    this.scanSuccess,
    this.scanMessage,
  });
}

class InsuranceInformationSuccess extends InsuranceInformationState {
  final InsuranceScanResult result;
  InsuranceInformationSuccess({required this.result});
}

class InsuranceInformationError extends InsuranceInformationState {
  final String message;
  InsuranceInformationError({required this.message});
}