part of 'facilities_cubit.dart';

abstract class FacilitiesState {}

class FacilitiesInitial extends FacilitiesState {}

class FacilitiesLoading extends FacilitiesState {}

class FacilitiesLoaded extends FacilitiesState {}

class FacilitiesError extends FacilitiesState {
  final String message;
  FacilitiesError(this.message);
}