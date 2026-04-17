import 'package:salamaty/core/network/dio_helper.dart';
import 'package:salamaty/features/medicine/data/models/medicine_details_model.dart';

class MedicineDetailsRepo {
  Future<MedicineDetailsModel> getProductById(int id) async {
    try {
      final response = await DioHelper.dio.get('/api/Products/$id');
      return MedicineDetailsModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}
