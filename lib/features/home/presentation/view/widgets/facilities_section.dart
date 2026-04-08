import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salamaty/features/facilities/presentation/cubit/facilities_cubit.dart';
import 'package:salamaty/features/facilities/presentation/view/facilities_screen.dart';
import 'package:salamaty/features/facilities/presentation/view/widgets/facility_card.dart';
import 'package:url_launcher/url_launcher.dart';

class FacilitiesSection extends StatelessWidget {
  const FacilitiesSection({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => FacilitiesCubit()..loadNearbyTop3(),
      child: BlocBuilder<FacilitiesCubit, FacilitiesState>(
        builder: (context, state) {
          final cubit = context.read<FacilitiesCubit>();

          if (state is FacilitiesLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Facilities',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1E40AF),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          FacilitiesScreen.routeName,
                        );
                      },
                      child: const Text(
                        'See All',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF1E40AF),
                          decoration: TextDecoration.underline,
                          decorationColor: Color(0xFF1E40AF),
                          decorationThickness: 1.5,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 8),

                // Cards
                ...cubit.facilities.take(3).map((facility) {
                  return FacilityCard(
                    name: facility.name,
                    type: facility.type,
                    distance:
                        "${facility.distance.toStringAsFixed(1)} KM away - ",
                    address: facility.address,
                    openTime: facility.operatingHours,
                    phone: facility.phone,
                    onCall: () async {
                      final uri = Uri.parse("tel:${facility.phone}");
                      await launchUrl(uri);
                    },
                    onLocation: () async {
                      final uri = Uri.parse(facility.locationUrl);
                      await launchUrl(uri,
                          mode: LaunchMode.externalApplication);
                    },
                  );
                }).toList(),
              ],
            ),
          );
        },
      ),
    );
  }
}
