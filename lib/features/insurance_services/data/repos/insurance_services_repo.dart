import 'package:dio/dio.dart';
import 'package:salamaty/features/insurance_services/data/models/nearby_service.dart';

class InsuranceServicesRepo {
  final Dio dio;

  InsuranceServicesRepo({required this.dio});

  Future<List<NearbyService>> getNearbyServices({
    required int providerId,
    double? lat,
    double? lng,
    double radius = 10,
    String? type, // All, Pharmacy, Hospital, Lab
    bool openNow = false,
  }) async {
    final response = await dio.get(
      '/api/Services/insurance-providers/$providerId/nearby',
      queryParameters: {
        if (lat != null) 'lat': lat,
        if (lng != null) 'lng': lng,
        'radius': radius,
        if (type != null && type != 'All') 'type': type,
        'openNow': openNow,
      },
    );

    final data = response.data['data'] as List;
    return data.map((e) => NearbyService.fromJson(e)).toList();
  }
}