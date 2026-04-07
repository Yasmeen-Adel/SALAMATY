import 'package:salamaty/core/network/api_constants.dart';
import 'package:salamaty/core/network/dio_helper.dart';
import 'package:salamaty/features/specialities/data/models/specialties_model.dart';

class SpecialitiesRepo {
  Future<List<SpecialtiesModel>> getProviders({
    required String specialty,
    String? search,
    double? lat,
    double? lng,
  }) async {
    final response = await DioHelper.get(
      // url: '/api/home/specialties-providers',
      url:ApiConstants.specialtiesProviders,
      query: {
        'specialty': specialty,
        if (search != null) 'search': search,
        if (lat != null) 'lat': lat,
        if (lng != null) 'lng': lng,
      },
    );

    return List.from(response.data)
        .map((e) => SpecialtiesModel.fromJson(e))
        .toList();
  }
}
