

import 'package:dio/dio.dart';
import 'package:salamaty/features/insurance_services/data/models/facility_model.dart';

class InsuranceServicesRepo {
  final Dio dio;

  InsuranceServicesRepo({required this.dio});

  /// GET /api/Services/insurance-providers/{providerId}/nearby
  Future<List<FacilityModel>> getNearbyFacilities({
    required int providerId,
    required double lat,
    required double lng,
    double radius = 10,
    String type = 'All',
    bool openNow = false,
  }) async {
    final response = await dio.get(
      '/api/Services/insurance-providers/$providerId/nearby',
      queryParameters: {
        'lat': lat,
        'lng': lng,
        'radius': radius,
        'type': type,
        'openNow': openNow,
      },
    );

    final List data = response.data['data'] ?? response.data;
    return data.map((e) => FacilityModel.fromJson(e)).toList();
  }
}