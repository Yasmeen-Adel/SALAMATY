// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:salamaty/features/favorite/data/repo/favorite_repo.dart';
// import 'favorite_state.dart';

// class FavoriteCubit extends Cubit<FavoriteState> {
//   final FavoriteRepo repo;

//   FavoriteCubit(this.repo) : super(FavoriteInitial());

//   // Map: productId -> favoriteId (للـ toggle سريع)
//   final Map<int, int> _favoriteMap = {};

//   bool isFavorite(int productId) => _favoriteMap.containsKey(productId);

//   Future<void> fetchFavorites() async {
//     if (isClosed) return;
//     emit(FavoriteLoading());
//     try {
//       final favorites = await repo.getFavorites();
//       _favoriteMap.clear();
//       for (var f in favorites) {
//         _favoriteMap[f.productId] = f.favoriteId;
//       }
//       if (isClosed) return;
//       emit(FavoriteSuccess(favorites));
//     } catch (e) {
//       if (isClosed) return;
//       emit(FavoriteFailure(e.toString()));
//     }
//   }

//   Future<void> toggleFavorite(int productId) async {
//     if (isClosed) return;
//     try {
//       if (isFavorite(productId)) {
//         final favoriteId = _favoriteMap[productId]!;
//         await repo.removeFavorite(favoriteId);
//         _favoriteMap.remove(productId);
//       } else {
//         final newFav = await repo.addFavorite(productId);
//         _favoriteMap[productId] = newFav.favoriteId;
//       }
//       // refresh الـ list
//       await fetchFavorites();
//     } catch (e) {
//       if (isClosed) return;
//       emit(FavoriteFailure(e.toString()));
//     }
//   }

//   Future<void> removeFavorite(int favoriteId, int productId) async {
//     if (isClosed) return;
//     try {
//       await repo.removeFavorite(favoriteId);
//       _favoriteMap.remove(productId);
//       await fetchFavorites();
//     } catch (e) {
//       if (isClosed) return;
//       emit(FavoriteFailure(e.toString()));
//     }
//   }
// }

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salamaty/features/favorite/data/repo/favorite_repo.dart';
import 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  final FavoriteRepo repo;

  FavoriteCubit(this.repo) : super(FavoriteInitial());

  // fallback cache (optional)
  final Map<int, int> _favoriteMap = {};

  Future<void> fetchFavorites() async {
    if (isClosed) return;
    emit(FavoriteLoading());

    try {
      final favorites = await repo.getFavorites();

      _favoriteMap.clear();
      for (var f in favorites) {
        _favoriteMap[f.productId] = f.favoriteId;
      }

      if (isClosed) return;
      emit(FavoriteSuccess(favorites));
    } catch (e) {
      if (isClosed) return;
      emit(FavoriteFailure(e.toString()));
    }
  }

  bool isFavorite(int productId, FavoriteState state) {
    if (state is FavoriteSuccess) {
      return state.favoriteMap.containsKey(productId);
    }
    return _favoriteMap.containsKey(productId);
  }

  Future<void> toggleFavorite(int productId) async {
    if (isClosed) return;

    try {
      final currentState = state;

      bool isFav = false;
      int? favoriteId;

      if (currentState is FavoriteSuccess) {
        isFav = currentState.favoriteMap.containsKey(productId);
        favoriteId = currentState.favoriteMap[productId];
      }

      if (isFav && favoriteId != null) {
        await repo.removeFavorite(favoriteId);
      } else {
        await repo.addFavorite(productId);
      }

      await fetchFavorites();
    } catch (e) {
      if (isClosed) return;
      emit(FavoriteFailure(e.toString()));
    }
  }

  Future<void> removeFavorite(int favoriteId, int productId) async {
    if (isClosed) return;

    try {
      await repo.removeFavorite(favoriteId);
      await fetchFavorites();
    } catch (e) {
      if (isClosed) return;
      emit(FavoriteFailure(e.toString()));
    }
  }
}