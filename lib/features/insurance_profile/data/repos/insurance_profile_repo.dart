import 'package:dio/dio.dart';
import 'package:salamaty/features/insurance_profile/data/models/insurance_profile_model.dart';

class InsuranceProfileRepo {
  final Dio dio;

  InsuranceProfileRepo({required this.dio});

  Future<InsuranceProfileModel> getProfileDetails({
    required String userId,
  }) async {
    final response = await dio.get(
      '/api/insurance/profile/details',
      queryParameters: {'userId': userId},
    );
    print('PROFILE RESPONSE: ${response.data}');
    return InsuranceProfileModel.fromJson(response.data);
  }
}
