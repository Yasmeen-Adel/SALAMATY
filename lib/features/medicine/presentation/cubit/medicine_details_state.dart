import 'package:equatable/equatable.dart';
import 'package:salamaty/features/medicine/data/models/medicine_details_model.dart';

abstract class MedicineDetailsState extends Equatable {
  @override
  List<Object?> get props => [];
}

class MedicineDetailsInitial extends MedicineDetailsState {}

class MedicineDetailsLoading extends MedicineDetailsState {}

class MedicineDetailsSuccess extends MedicineDetailsState {
  final MedicineDetailsModel medicine;
  MedicineDetailsSuccess(this.medicine);

  @override
  List<Object?> get props => [medicine];
}

class MedicineDetailsFailure extends MedicineDetailsState {
  final String error;
  MedicineDetailsFailure(this.error);

  @override
  List<Object?> get props => [error];
}
