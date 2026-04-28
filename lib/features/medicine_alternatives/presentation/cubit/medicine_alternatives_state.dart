import 'package:equatable/equatable.dart';
import 'package:salamaty/features/medicine_alternatives/data/models/medicine_alternative_model.dart';

abstract class MedicineAlternativesState extends Equatable {
  @override
  List<Object?> get props => [];
}

class MedicineAlternativesInitial extends MedicineAlternativesState {}

class MedicineAlternativesLoading extends MedicineAlternativesState {}

class MedicineAlternativesSuccess extends MedicineAlternativesState {
  final List<MedicineAlternativeModel> alternatives;
  MedicineAlternativesSuccess(this.alternatives);

  @override
  List<Object?> get props => [alternatives];
}

class MedicineAlternativesFailure extends MedicineAlternativesState {
  final String error;
  MedicineAlternativesFailure(this.error);

  @override
  List<Object?> get props => [error];
}