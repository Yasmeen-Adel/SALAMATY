import 'package:equatable/equatable.dart';
import 'package:salamaty/features/nearby_pharmacy/data/models/nearby_pharmacy_model.dart';

abstract class NearbyPharmacyState extends Equatable {
  @override
  List<Object?> get props => [];
}

class NearbyPharmacyInitial extends NearbyPharmacyState {}

class NearbyPharmacyLoading extends NearbyPharmacyState {}

class NearbyPharmacySuccess extends NearbyPharmacyState {
  final List<NearbyPharmacy> pharmacies;
  NearbyPharmacySuccess(this.pharmacies);

  @override
  List<Object?> get props => [pharmacies];
}

class NearbyPharmacyFailure extends NearbyPharmacyState {
  final String error;
  NearbyPharmacyFailure(this.error);

  @override
  List<Object?> get props => [error];
}