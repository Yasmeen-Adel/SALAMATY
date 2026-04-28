import 'dart:io';
import 'package:dio/dio.dart';
import 'package:salamaty/core/network/api_constants.dart';
import 'package:salamaty/core/network/dio_helper.dart';
import '../models/detected_medicine_model.dart';

class DetectedMedicineRepo {
  Future<DetectedMedicineModel> scanPrescription({
    required File image,
    required String userId,
  }) async {
    FormData formData = FormData.fromMap({
      "image": await MultipartFile.fromFile(image.path),
      "userId": userId,
    });

    final response = await DioHelper.post(
      url: ApiConstants.scanPrescription,
      data: formData,
    );

    return DetectedMedicineModel.fromJson(response.data);
  }
}