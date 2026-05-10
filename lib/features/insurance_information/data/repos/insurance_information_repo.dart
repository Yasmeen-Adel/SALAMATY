import 'dart:io';
import 'package:dio/dio.dart';
import 'package:salamaty/features/insurance_information/data/models/scan_response_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InsuranceInformationRepo {
  final Dio dio;

  InsuranceInformationRepo({required this.dio});

  Future<ScanResponseModel> scanCard({
    required int providerId,
    required File frontImage,
  }) async {
    final formData = FormData.fromMap({
      'ProviderId': providerId,
      'FrontImage': await MultipartFile.fromFile(
        frontImage.path,
        filename: 'front.jpg',
      ),
    });

    final response = await dio.post('/api/Insurance/scan', data: formData);
    return ScanResponseModel.fromJson(response.data);
  }

  Future<void> submitInsuranceInfo({
    required String userId,
    required int providerId,
    required String cardHolderId,
    required String? policyNumber,
    required String? validUntil,
    required String? status,
    required String? fullName,
    required File frontImage,
  }) async {
    final formData = FormData.fromMap({
      'ProviderId': providerId.toString(),
      'CardHolderId': cardHolderId,
      if (policyNumber != null && policyNumber.isNotEmpty)
        'PolicyNumber': policyNumber,
      if (validUntil != null && validUntil.isNotEmpty) 'ValidUntil': validUntil,
      if (status != null && status.isNotEmpty) 'Status': status,
      if (fullName != null && fullName.isNotEmpty) 'FullName': fullName,
      'FrontImage': await MultipartFile.fromFile(
        frontImage.path,
        filename: 'front.jpg',
        contentType: DioMediaType('image', 'jpeg'),
      ),
      'BackImage': await MultipartFile.fromFile(
        frontImage.path,
        filename: 'back.jpg',
        contentType: DioMediaType('image', 'jpeg'),
      ),
    });

    print('=== SUBMIT DEBUG ===');
    print('userId: $userId');
    print('providerId: $providerId');
    print('cardHolderId: $cardHolderId');
    print('policyNumber: $policyNumber');
    print('validUntil: $validUntil');
    print('status: $status');
    print('fullName: $fullName');

    try {
      final response = await dio.post(
        '/api/Insurance/information',
        queryParameters: {'userId': userId},
        data: formData,
      );
      print('=== SUBMIT SUCCESS ===');
      print(response.data);
    } on DioException catch (e) {
      print('=== SUBMIT ERROR ===');
      print('Status: ${e.response?.statusCode}');
      print('Data: ${e.response?.data}');
      print('Message: ${e.message}');
      rethrow;
    }

    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('has_insurance', true);
  }
}
