import 'package:dio/dio.dart';
import 'api_constants.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        headers: {
          'Content-Type': 'application/json',
        },
      ),
    );

    dio.interceptors.add(
      LogInterceptor(
        requestBody: true,
        responseBody: true,
        error: true,
      ),
    );
  }

  static Future<Response> post({
    required String url,
    // required Map<String, dynamic> data,
      required dynamic data, // Map or str

  }) async {
    try {
      return await dio.post(url, data: data);
    } on DioException catch (e) {
      throw e;
    }
  }
}
