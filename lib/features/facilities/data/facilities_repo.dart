
import 'package:salamaty/core/network/dio_helper.dart';
import 'package:salamaty/core/network/api_constants.dart';

class FacilitiesRepo {

  // Nearby Top 3
  Future<List<dynamic>> getNearbyTop3({
    required double lat,
    required double lon,
  }) async {
    final response = await DioHelper.get(
      url: ApiConstants.nearbyTop3,
      query: {
        "userLat": lat,
        "userLon": lon,
      },
    );

    return response.data["data"];
  }

  // All Facilities
  Future<List<dynamic>> getAllFacilities({
    required double lat,
    required double lon,
    String? type,
    String? search,
  }) async {
    final response = await DioHelper.get(
      url: ApiConstants.allFacilities,
      query: {
        "userLat": lat,
        "userLon": lon,
        if (type != null && type != "All") "type": type,
        if (search != null && search.isNotEmpty) "searchTerm": search,
      },
    );

    return response.data["data"];
  }
}