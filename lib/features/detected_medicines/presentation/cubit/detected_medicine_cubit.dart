import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salamaty/features/detected_medicines/data/repo/detected_medicine_repo.dart';
import 'detected_medicine_state.dart';

class DetectedMedicineCubit extends Cubit<DetectedMedicineState> {
  final DetectedMedicineRepo repo;

  DetectedMedicineCubit(this.repo)
      : super(DetectedMedicineInitial());

  Future<void> scan({
    required File image,
    required String userId,
  }) async {
    emit(DetectedMedicineLoading());

    try {
      final result =
          await repo.scanPrescription(image: image, userId: userId);

      emit(DetectedMedicineSuccess(result));
    } catch (e) {
      emit(DetectedMedicineError(e.toString()));
    }
  }
}