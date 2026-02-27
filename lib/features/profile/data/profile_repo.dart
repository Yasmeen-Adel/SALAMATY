import 'package:dio/dio.dart';
import 'package:salamaty/core/network/api_constants.dart';
import 'package:salamaty/core/network/dio_helper.dart';
import 'package:salamaty/core/services/auth_local_storage.dart';

class ProfileRepo {
// Get Profile Data ............ :)
  Future<Map<String, dynamic>> getProfile() async {
    try {
      final response = await DioHelper.dio.get(
        ApiConstants.getProfile,
      );

      return response.data;
    } on DioException catch (e) {
      throw e.response?.data ?? {"message": "Failed to load profile"};
    }
  }

  // edit profile ............)
  Future<void> editProfile({
    required String fullName,
    required String gender,
    required String birthDate,
    required String address,
    // required int genderValue,
  }) async {
    try {
      final data = {
        "fullName": fullName,
        "gender": gender.toLowerCase(),
        "birthDate": birthDate.split("T").first,
        "address": address,
      };

      print("EDIT DATA: $data");

      await DioHelper.put(
        url: ApiConstants.editProfile,
        data: data,
      );
    } on DioException catch (e) {
      print(e.response?.data);
      throw e.response?.data ?? {"message": "Failed to update profile"};
    }
  }

  // profile ............ upload image .......:)
  Future<String> uploadProfileImage(String filePath) async {
    final formData = FormData.fromMap({
      'file': await MultipartFile.fromFile(
        filePath,
        filename: filePath.split('/').last,
      ),
    });

    final response = await DioHelper.dio.post(
      ApiConstants.uploadProfileImage,
      data: formData,
      options: Options(
        contentType: 'multipart/form-data',
      ),
    );

    final data = response.data;

    final relativePath = data['imageUrl'];

    final fullUrl = ApiConstants.baseUrl + relativePath;

    return fullUrl;
  }

  // Delete Account ............ :)
  Future<void> deleteAccount() async {
    try {
      await DioHelper.delete(
        url: ApiConstants.deleteAccount,
      );

      DioHelper.clearToken();
      await AuthLocalStorage.clearAll();
    } on DioException catch (e) {
      print('Delete error: ${e.response?.statusCode}');
      print('Delete error body: ${e.response?.data}');
      rethrow;
    }
  }

  //   Logout ............)
  Future<void> logout() async {
    try {
      await DioHelper.post(
        url: ApiConstants.logout,
        data: {},
      );
    } on DioException catch (e) {
      print('Logout error: ${e.response?.statusCode}');
    } finally {
      DioHelper.clearToken();
      await AuthLocalStorage.clearAuthData();
    }
  }
}
