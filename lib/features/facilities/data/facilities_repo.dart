import 'package:salamaty/core/network/dio_helper.dart';
import 'package:salamaty/core/network/api_constants.dart';

class FacilitiesRepo {
  Future<dynamic> getNearbyFacilities({
    required double latitude,
    required double longitude,
  }) async {
    final response = await DioHelper.post(
      url: ApiConstants.nearbyFacilities,
      data: {
        "latitude": latitude,
        "longitude": longitude,
      },
    );

    return response.data;
  }
}
