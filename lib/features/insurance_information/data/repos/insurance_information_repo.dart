


import 'dart:io';
import 'package:dio/dio.dart';
import 'package:salamaty/features/insurance_information/data/models/insurance_scan_result.dart';

class InsuranceInformationRepo {
  final Dio dio;

  InsuranceInformationRepo({required this.dio});

  Future<InsuranceScanResult> scanCard({
    required int providerId,
    required String cardHolderId,
    File? frontImage,
    File? backImage,
  }) async {
    final formData = FormData.fromMap({
      'ProviderId': providerId,
      'CardHolderId': cardHolderId,
      if (frontImage != null)
        'FrontImage': await MultipartFile.fromFile(
          frontImage.path,
          filename: 'front.jpg',
        ),
      if (backImage != null)
        'BackImage': await MultipartFile.fromFile(
          backImage.path,
          filename: 'back.jpg',
        ),
    });

    final response = await dio.post(
      '/api/Insurance/scan',
      data: formData,
    );

    return InsuranceScanResult.fromJson(response.data);
  }

  Future<InsuranceScanResult> submitInsuranceInformation({
    required String userId,
    required int providerId,
    required String cardHolderId,
    String? holderName,
    String? policyNumber,
    String? validUntil,
    String? status,
    File? frontImage,
    File? backImage,
  }) async {
    final formData = FormData.fromMap({
      'ProviderId': providerId,
      'CardHolderId': cardHolderId,
      if (holderName != null) 'FullName': holderName,   // ← كان HolderName، الصح FullName
      if (policyNumber != null) 'PolicyNumber': policyNumber,
      if (validUntil != null) 'ValidUntil': validUntil,
      if (status != null) 'Status': status,
      if (frontImage != null)
        'FrontImage': await MultipartFile.fromFile(
          frontImage.path,
          filename: 'front.jpg',
        ),
      if (backImage != null)
        'BackImage': await MultipartFile.fromFile(
          backImage.path,
          filename: 'back.jpg',
        ),
    });

    final response = await dio.post(
      '/api/Insurance/information',
      queryParameters: {'userId': userId},
      data: formData,
    );

    return InsuranceScanResult.fromJson(response.data);
  }
}