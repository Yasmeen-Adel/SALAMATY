import 'package:flutter_bloc/flutter_bloc.dart';
import 'specialities_state.dart';
import '../../data/specialities_repo.dart';

class SpecialitiesCubit extends Cubit<SpecialitiesState> {
  final SpecialitiesRepo repo;

  SpecialitiesCubit(this.repo) : super(SpecialitiesInitial());

  Future<void> fetchProviders({
    required String specialty,
    String? search,
    double? lat,
    double? lng,
  }) async {
    emit(SpecialitiesLoading());
    try {
      final result = await repo.getProviders(
        specialty: specialty,
        search: search,
        lat: lat,
        lng: lng,
      );
      emit(SpecialitiesSuccess(result));
    } catch (e) {
      emit(SpecialitiesError(e.toString()));
    }
  }
}