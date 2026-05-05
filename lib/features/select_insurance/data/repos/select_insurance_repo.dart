

import 'package:dio/dio.dart';
import 'package:salamaty/features/select_insurance/data/models/select_insurance_provider.dart';

class InsuranceRepo {
  final Dio dio;

  InsuranceRepo({required this.dio});

  Future<List<InsuranceProvider>> getProviders({String? search}) async {
    final response = await dio.get(
      '/api/Insurance/providers',
      queryParameters:
          search != null && search.isNotEmpty ? {'search': search} : null,
    );
    print('RESPONSE: ${response.data}'); // ← هنا
    // لو الـ response object فيه key اسمه data
    dynamic raw = response.data;
    List data;

    if (raw is List) {
      data = raw;
    } else if (raw is Map && raw.containsKey('data')) {
      data = raw['data'] as List;
    } else {
      data = [];
    }

    return data.map((e) => InsuranceProvider.fromJson(e)).toList();
  }
}
