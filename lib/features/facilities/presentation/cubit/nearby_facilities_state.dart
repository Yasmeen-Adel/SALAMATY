part of 'nearby_facilities_cubit.dart';

abstract class NearbyFacilitiesState {}

class NearbyFacilitiesInitial extends NearbyFacilitiesState {}

class NearbyFacilitiesLoading extends NearbyFacilitiesState {}

class NearbyFacilitiesLoaded extends NearbyFacilitiesState {
  final dynamic facilities;
  NearbyFacilitiesLoaded(this.facilities);
}

class NearbyFacilitiesError extends NearbyFacilitiesState {
  final String message;
  NearbyFacilitiesError(this.message);
}
