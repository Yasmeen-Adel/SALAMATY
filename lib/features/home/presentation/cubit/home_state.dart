part of 'home_cubit.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final String fullName;
  final String? imageUrl;

  HomeLoaded({
    required this.fullName,
    this.imageUrl,
  });
}

class HomeError extends HomeState {}