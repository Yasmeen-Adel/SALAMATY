import 'package:salamaty/core/network/dio_helper.dart';
import 'package:salamaty/core/services/auth_local_storage.dart';
import 'package:salamaty/features/favorite/data/models/favorite_model.dart';

class FavoriteRepo {
  Future<List<FavoriteModel>> getFavorites() async {
    final userId = await AuthLocalStorage.getUserId();
    final response =
        await DioHelper.dio.get('/api/Favorites/user/$userId');

    final List data = response.data;
    return data.map((e) => FavoriteModel.fromJson(e)).toList();
  }

  Future<FavoriteModel> addFavorite(int productId) async {
    final userId = await AuthLocalStorage.getUserId();
    final response = await DioHelper.dio.post(
      '/api/Favorites',
      data: {
        "userId": userId,
        "productId": productId,
      },
    );
    return FavoriteModel.fromJson(response.data);
  }

  Future<void> removeFavorite(int favoriteId) async {
    await DioHelper.dio.delete('/api/Favorites/$favoriteId');
  }
}