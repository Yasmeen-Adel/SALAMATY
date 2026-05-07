


import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:salamaty/features/insurance_services/data/models/facility_model.dart';
import 'package:salamaty/features/insurance_services/data/repos/insurance_services_repo.dart';

part 'insurance_services_state.dart';

class InsuranceServicesCubit extends Cubit<InsuranceServicesState> {
  final InsuranceServicesRepo repo;
  final int providerId;

  InsuranceServicesCubit({
    required this.repo,
    required this.providerId,
  }) : super(InsuranceServicesInitial());

  String _selectedFilter = 'All';
  List<FacilityModel> _allFacilities = [];

  Future<void> loadFacilities() async {
    if (isClosed) return;

    emit(InsuranceServicesLoading());

    try {
      // Get user location
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        emit(InsuranceServicesError(message: 'Location services are disabled.'));
        return;
      }

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          emit(InsuranceServicesError(message: 'Location permission denied.'));
          return;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        emit(InsuranceServicesError(
            message: 'Location permission permanently denied.'));
        return;
      }

      final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      final facilities = await repo.getNearbyFacilities(
        providerId: providerId,
        lat: position.latitude,
        lng: position.longitude,
      );

      if (isClosed) return;

      _allFacilities = facilities;

      emit(InsuranceServicesLoaded(
        facilities: _applyFilter(facilities),
        selectedFilter: _selectedFilter,
      ));
    } catch (e) {
      if (isClosed) return;
      emit(InsuranceServicesError(message: e.toString()));
    }
  }

  void changeFilter(String filter) {
    if (isClosed) return;

    _selectedFilter = filter;

    emit(InsuranceServicesLoaded(
      facilities: _applyFilter(_allFacilities),
      selectedFilter: filter,
    ));
  }

  List<FacilityModel> _applyFilter(List<FacilityModel> all) {
    if (_selectedFilter == 'All') return all;

    final filterMap = {
      'Labs': ['analysis laboratories', 'lab'],
      'Hospitals': ['hospital'],
      'Pharmacies': ['pharmacies'],
    };

    final types = filterMap[_selectedFilter] ?? [];

    return all.where((f) {
      return types.any(
        (t) => f.type.toLowerCase().contains(t.toLowerCase()),
      );
    }).toList();
  }
}