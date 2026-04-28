abstract class DetectedMedicineState {}

class DetectedMedicineInitial extends DetectedMedicineState {}

class DetectedMedicineLoading extends DetectedMedicineState {}

class DetectedMedicineSuccess extends DetectedMedicineState {
  final dynamic data;

  DetectedMedicineSuccess(this.data);
}

class DetectedMedicineError extends DetectedMedicineState {
  final String error;

  DetectedMedicineError(this.error);
}