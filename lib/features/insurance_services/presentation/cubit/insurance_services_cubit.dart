import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salamaty/features/insurance_services/data/models/nearby_service.dart';
import 'package:salamaty/features/insurance_services/data/repos/insurance_services_repo.dart';

part 'insurance_services_state.dart';

class InsuranceServicesCubit extends Cubit<InsuranceServicesState> {
  final InsuranceServicesRepo repo;
  final int providerId;

  InsuranceServicesCubit({
    required this.repo,
    required this.providerId,
  }) : super(InsuranceServicesInitial());

  String _selectedType = 'All';

  Future<void> fetchServices({
    double? lat,
    double? lng,
    String type = 'All',
  }) async {
    _selectedType = type;
    emit(InsuranceServicesLoading());
    try {
      final services = await repo.getNearbyServices(
        providerId: providerId,
        lat: lat,
        lng: lng,
        type: type == 'All' ? null : type,
      );
      emit(InsuranceServicesLoaded(
        services: services,
        selectedType: _selectedType,
      ));
    } catch (e) {
      emit(InsuranceServicesError(message: e.toString()));
    }
  }

  void filterByType(String type) {
    fetchServices(type: type);
  }
}