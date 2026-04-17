

import 'package:equatable/equatable.dart';
import 'package:salamaty/features/favorite/data/models/favorite_model.dart';

abstract class FavoriteState extends Equatable {
  @override
  List<Object?> get props => [];
}

class FavoriteInitial extends FavoriteState {}

class FavoriteLoading extends FavoriteState {}

class FavoriteSuccess extends FavoriteState {
  final List<FavoriteModel> favorites;
  final Map<int, int> favoriteMap;

  FavoriteSuccess(this.favorites)
      : favoriteMap = {
          for (var f in favorites) f.productId: f.favoriteId
        };

  @override
  List<Object?> get props => [favorites, favoriteMap];
}

class FavoriteFailure extends FavoriteState {
  final String error;

  FavoriteFailure(this.error);

  @override
  List<Object?> get props => [error];
}

class FavoriteToggleLoading extends FavoriteState {}