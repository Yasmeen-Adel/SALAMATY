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
          if (state is FacilitiesLoading || state is FacilitiesInitial) {
            return _buildFacilitiesSkeleton();
          }

          if (state is FacilitiesError) {
            return const SizedBox.shrink();
          }

          final cubit = context.read<FacilitiesCubit>();

          if (cubit.facilities.isEmpty) return const SizedBox.shrink();

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                      await launchUrl(
                        uri,
                        mode: LaunchMode.externalApplication,
                      );
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

  Widget _buildFacilitiesSkeleton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          _skeletonLine(120, 16),
          const SizedBox(height: 12),
          ...List.generate(
            3,
            (_) => Container(
              margin: const EdgeInsets.only(bottom: 12),
              height: 100,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _skeletonLine(double width, double height) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}