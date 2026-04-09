import 'package:dio/dio.dart';
import 'package:salamaty/core/network/dio_helper.dart';
import 'package:salamaty/features/drug_store/data/models/drug_store_model.dart';

class DrugStoreRepo {
  Future<List<DrugStoreProduct>> getProducts({
    String? category,
    String? search,
  }) async {
    try {
      final response = await DioHelper.dio!.get(
        '/api/Products',
        queryParameters: {
          if (category != null && category != 'All') 'category': category,
          if (search != null && search.isNotEmpty) 'search': search,
        },
      );

      print("RESPONSE: ${response.data}"); // 👈 هنا

      final List data = response.data;

      return data.map((e) => DrugStoreProduct.fromJson(e)).toList();
    } catch (e) {
      print("REPO ERROR: $e"); // 👈 هنا
      rethrow;
    }
  }
}
