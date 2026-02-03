import 'package:dio/dio.dart';
import 'package:salamaty/core/services/auth_local_storage.dart';
import 'api_constants.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        headers: {
          'Content-Type': 'application/json',
          // 'Accept': '*/*',
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

  //  SET TOKEN
  static void setToken(String token) {
    dio.options.headers['Authorization'] = 'Bearer $token';
  }

  //  CLEAR TOKEN
  static void clearToken() {
    dio.options.headers.remove('Authorization');
  }

  // POST
  static Future<Response> post({
    required String url,
    dynamic data,
  }) async {
    return await dio.post(url, data: data);
  }


  // DELETE
static Future<Response> delete({
  required String url,
  dynamic data, 
}) async {
  return await dio.delete(
    url,
    data: data,
  );
}

  static Future<void> loadToken() async {
  final token = await AuthLocalStorage.getToken();
  if (token != null) {
    setToken(token);
  }
}

}
