// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:salamaty/features/nearby_pharmacy/data/repo/nearby_pharmacy_repo.dart';
// import 'nearby_pharmacy_state.dart';

// class NearbyPharmacyCubit extends Cubit<NearbyPharmacyState> {
//   final NearbyPharmacyRepo repo;

//   NearbyPharmacyCubit(this.repo) : super(NearbyPharmacyInitial());

//   Future<void> fetchNearbyPharmacies({
//     required int productId,
//     double? lat,
//     double? lng,
//     double maxDistanceKm = 10,
//   }) async {
//     emit(NearbyPharmacyLoading());
//     try {
//       final pharmacies = await repo.getNearbyPharmacies(
//         productId: productId,
//         lat: lat,
//         lng: lng,
//         maxDistanceKm: maxDistanceKm,
//       );
//       emit(NearbyPharmacySuccess(pharmacies));
//     } catch (e) {
//       emit(NearbyPharmacyFailure(e.toString()));
//     }
//   }
// }

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:salamaty/features/nearby_pharmacy/data/repo/nearby_pharmacy_repo.dart';
import 'nearby_pharmacy_state.dart';

class NearbyPharmacyCubit extends Cubit<NearbyPharmacyState> {
  final NearbyPharmacyRepo repo;

  NearbyPharmacyCubit(this.repo) : super(NearbyPharmacyInitial());

  Future<void> fetchNearbyPharmacies({
    required int productId,
    double maxDistanceKm = 10,
  }) async {
    emit(NearbyPharmacyLoading());
    try {
      double? lat;
      double? lng;

      // 1. اتأكد الـ location service شغال
      final serviceEnabled = await Geolocator.isLocationServiceEnabled();

      if (serviceEnabled) {
        // 2. اطلب permission
        LocationPermission permission = await Geolocator.checkPermission();
        if (permission == LocationPermission.denied) {
          permission = await Geolocator.requestPermission();
        }

        // 3. لو اتدى جيب الـ location
        if (permission == LocationPermission.always ||
            permission == LocationPermission.whileInUse) {
          final position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high,
          );
          lat = position.latitude;
          lng = position.longitude;
        }
      }

      // 4. بعت للـ API ( سواء عنده location أو لأ )
      final pharmacies = await repo.getNearbyPharmacies(
        productId: productId,
        lat: lat,
        lng: lng,
        maxDistanceKm: maxDistanceKm,
      );

      emit(NearbyPharmacySuccess(pharmacies));
    } catch (e) {
      emit(NearbyPharmacyFailure(e.toString()));
    }
  }
}
