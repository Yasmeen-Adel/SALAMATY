part of 'home_cubit.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeSuccess extends HomeState {
  final String fullName;
  final String? imageUrl;
  final List<TipModel> tips;

  HomeSuccess({
    required this.fullName,
    required this.imageUrl,
    required this.tips,
  });
}

class HomeError extends HomeState {}
