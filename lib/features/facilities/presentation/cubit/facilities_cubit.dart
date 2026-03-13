import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salamaty/core/services/auth_local_storage.dart';
import 'package:salamaty/core/services/get_it_services.dart';
import '../../data/facilities_repo.dart';
import '../../data/models/facility_model.dart';

part 'facilities_state.dart';

class FacilitiesCubit extends Cubit<FacilitiesState> {
  FacilitiesCubit() : super(FacilitiesInitial());

  final repo = getIt<FacilitiesRepo>();

  List<FacilityModel> facilities = [];

  // Nearby Top 3
  Future<void> loadNearbyTop3() async {
    emit(FacilitiesLoading());

    final location = await AuthLocalStorage.getLocation();
    if (location == null) return;

    final data = await repo.getNearbyTop3(
      lat: location["lat"]!,
      lon: location["lng"]!,
    );

    facilities =
        data.map<FacilityModel>((e) => FacilityModel.fromJson(e)).toList();

    emit(FacilitiesLoaded());
  }

  // All Facilities (Search + Filter)
  Future<void> loadAllFacilities({
    String? type,
    String? search,
  }) async {
    emit(FacilitiesLoading());

    final location = await AuthLocalStorage.getLocation();
    if (location == null) return;

    final data = await repo.getAllFacilities(
      lat: location["lat"]!,
      lon: location["lng"]!,
      type: type,
      search: search,
    );

    facilities =
        data.map<FacilityModel>((e) => FacilityModel.fromJson(e)).toList();

    emit(FacilitiesLoaded());
  }
}