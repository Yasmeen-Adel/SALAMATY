import 'package:salamaty/core/network/api_constants.dart';
import 'package:salamaty/core/network/dio_helper.dart';

class HomeRepo {
// Get Tips Data ............ :)
  Future<List<dynamic>> getTips() async {
    final response = await DioHelper.get(
      url: ApiConstants.homeTips,
    );

    return response.data["data"];
  }
}
