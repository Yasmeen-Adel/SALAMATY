import 'package:salamaty/features/specialities/data/models/specialties_model.dart';


abstract class SpecialitiesState {}

class SpecialitiesInitial extends SpecialitiesState {}

class SpecialitiesLoading extends SpecialitiesState {}

class SpecialitiesSuccess extends SpecialitiesState {
  final List<SpecialtiesModel> providers;
  SpecialitiesSuccess(this.providers);
}

class SpecialitiesError extends SpecialitiesState {
  final String message;
  SpecialitiesError(this.message);
}