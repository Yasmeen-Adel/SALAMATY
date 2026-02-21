import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salamaty/features/facilities/data/facilities_repo.dart';

part 'nearby_facilities_state.dart';

class NearbyFacilitiesCubit extends Cubit<NearbyFacilitiesState> {
  final FacilitiesRepo repo;

  NearbyFacilitiesCubit(this.repo) : super(NearbyFacilitiesInitial());

  Future<void> loadNearby({
    required double lat,
    required double long,
  }) async {
    emit(NearbyFacilitiesLoading());

    try {
      final data = await repo.getNearbyFacilities(
        latitude: lat,
        longitude: long,
      );

      emit(NearbyFacilitiesLoaded(data));
    } catch (e) {
      emit(NearbyFacilitiesError("Failed to load facilities"));
    }
  }
}
