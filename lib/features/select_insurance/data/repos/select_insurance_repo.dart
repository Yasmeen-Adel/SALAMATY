
import 'package:dio/dio.dart';
import 'package:salamaty/features/select_insurance/data/models/select_insurance_provider.dart';

class InsuranceRepo {
  final Dio dio;

  InsuranceRepo({required this.dio});

  Future<List<InsuranceProvider>> getProviders({String? search}) async {
    final response = await dio.get(
      '/api/Insurance/providers',
      queryParameters: search != null && search.isNotEmpty
          ? {'search': search}
          : null,
    );

    final List data = response.data;
    return data.map((e) => InsuranceProvider.fromJson(e)).toList();
  }
}