import 'package:dio/dio.dart';
import 'package:salamaty/core/services/auth_local_storage.dart';
import 'api_constants.dart';

class DioHelper {
  static late Dio dio;

  static init() async {
    dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        headers: {
          'Content-Type': 'application/json',
          'Accept': '*/*',
        },
      ),
    );
    await loadToken();
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

  // PATCH .............. :)
  static Future<Response> patch({
    required String url,
    dynamic data,
  }) async {
    return await dio.patch(url, data: data);
  }

  static Future<Response> put({
    required String url,
    dynamic data,
  }) async {
    print("EDIT DATA: $data");
    return await dio.put(url, data: data);
  }
  // GET
static Future<Response> get({
  required String url,
}) async {
  return await dio.get(url);
}
}
