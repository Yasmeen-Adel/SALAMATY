import 'package:salamaty/core/network/dio_helper.dart';
import 'package:salamaty/features/medicine_alternatives/data/models/medicine_alternative_model.dart';

class MedicineAlternativesRepo {
  Future<List<MedicineAlternativeModel>> getAlternatives(int productId) async {
    try {
      final response =
          await DioHelper.dio.get('/api/Products/$productId/alternatives');
      final List data = response.data;
      return data
          .map((e) => MedicineAlternativeModel.fromJson(e))
          .toList();
    } catch (e) {
      rethrow;
    }
  }
}