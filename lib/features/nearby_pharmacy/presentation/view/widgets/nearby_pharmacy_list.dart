import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salamaty/features/nearby_pharmacy/presentation/cubit/nearby_pharmacy_cubit.dart';
import 'package:salamaty/features/nearby_pharmacy/presentation/cubit/nearby_pharmacy_state.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:salamaty/features/facilities/presentation/view/widgets/facility_card.dart';

class NearbyPharmacyList extends StatelessWidget {
  const NearbyPharmacyList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NearbyPharmacyCubit, NearbyPharmacyState>(
      builder: (context, state) {
        if (state is NearbyPharmacyLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is NearbyPharmacyFailure) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.error_outline, color: Colors.red, size: 48),
                const SizedBox(height: 12),
                Text(
                  state.error,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.red),
                ),
              ],
            ),
          );
        }

        if (state is NearbyPharmacySuccess) {
          if (state.pharmacies.isEmpty) {
            return const Center(child: Text('No nearby pharmacies found'));
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: state.pharmacies.length,
            itemBuilder: (context, index) {
              final pharmacy = state.pharmacies[index];
              return FacilityCard(
                name: pharmacy.name,
                type: pharmacy.type,
                distance: '${pharmacy.distanceKm.toStringAsFixed(1)} KM away - ',
                address: pharmacy.address,
                openTime: pharmacy.openStatusText,
                phone: pharmacy.phone,
                onCall: () async {
                  final uri = Uri.parse('tel:${pharmacy.phone}');
                  await launchUrl(uri);
                },
                onLocation: () async {
                  final uri = Uri.parse(pharmacy.locationUrl);
                  await launchUrl(uri, mode: LaunchMode.externalApplication);
                },
              );
            },
          );
        }

        return const SizedBox();
      },
    );
  }
}