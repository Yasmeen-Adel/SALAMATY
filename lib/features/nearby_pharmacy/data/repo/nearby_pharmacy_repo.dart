import 'package:salamaty/core/network/dio_helper.dart';
import 'package:salamaty/features/nearby_pharmacy/data/models/nearby_pharmacy_model.dart';

class NearbyPharmacyRepo {
  Future<List<NearbyPharmacy>> getNearbyPharmacies({
    required int productId,
    double? lat,
    double? lng,
    double maxDistanceKm = 10,
  }) async {
    try {
      final response = await DioHelper.dio.get(
        '/api/Products/$productId/nearby-pharmacies',
        queryParameters: {
          if (lat != null) 'lat': lat,
          if (lng != null) 'lng': lng,
          'maxDistanceKm': maxDistanceKm,
        },
      );

      final List data = response.data;
      return data.map((e) => NearbyPharmacy.fromJson(e)).toList();
    } catch (e) {
      rethrow;
    }
  }
}