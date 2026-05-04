// part of 'insurance_information_cubit.dart';

// abstract class InsuranceInformationState {}

// class InsuranceInformationInitial extends InsuranceInformationState {}

// class InsuranceInformationLoading extends InsuranceInformationState {}

// class InsuranceInformationImagesUpdated extends InsuranceInformationState {
//   final File? frontImage;
//   final File? backImage;

//   InsuranceInformationImagesUpdated({
//     this.frontImage,
//     this.backImage,
//   });
// }

// class InsuranceInformationSuccess extends InsuranceInformationState {
//   final InsuranceScanResult result;
//   InsuranceInformationSuccess({required this.result});
// }

// class InsuranceInformationError extends InsuranceInformationState {
//   final String message;
//   InsuranceInformationError({required this.message});
// }


// lib\features\insurance_information\presentation\cubit\insurance_information_state.dart

part of 'insurance_information_cubit.dart';

abstract class InsuranceInformationState {}

class InsuranceInformationInitial extends InsuranceInformationState {}

class InsuranceInformationLoading extends InsuranceInformationState {}

class InsuranceInformationScanLoading extends InsuranceInformationState {
  final File? frontImage;
  final File? backImage;

  InsuranceInformationScanLoading({
    this.frontImage,
    this.backImage,
  });
}

class InsuranceInformationImagesUpdated extends InsuranceInformationState {
  final File? frontImage;
  final File? backImage;
  final String? autoFilledId;
  final String? autoFilledHolderName;

  InsuranceInformationImagesUpdated({
    this.frontImage,
    this.backImage,
    this.autoFilledId,
    this.autoFilledHolderName,
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