


import 'package:dio/dio.dart';
import 'package:salamaty/features/insurance_profile/data/models/insurance_profile_model.dart';

class InsuranceProfileRepo {
  final Dio dio;

  InsuranceProfileRepo({required this.dio});

  Future<InsuranceProfileModel> getProfileDetails({
    required String userId,
    required CancelToken cancelToken,
  }) async {
    final response = await dio.get(
      '/api/Insurance/profile/details',
      queryParameters: {'userId': userId},
      cancelToken: cancelToken,
    );

    return InsuranceProfileModel.fromJson(response.data);
  }
}