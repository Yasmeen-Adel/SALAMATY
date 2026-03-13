import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salamaty/features/facilities/presentation/cubit/facilities_cubit.dart';
import 'package:url_launcher/url_launcher.dart';
import 'facility_card.dart';

class FacilitiesList extends StatelessWidget {
  const FacilitiesList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FacilitiesCubit, FacilitiesState>(
      builder: (context, state) {
        final cubit = context.read<FacilitiesCubit>();

        if (state is FacilitiesLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        return ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: cubit.facilities.length,
          itemBuilder: (context, index) {
            final facility = cubit.facilities[index];
            return FacilityCard(
              name: facility.name,
              type: facility.type,
              distance: "${facility.distance.toStringAsFixed(1)} KM away - ",
              address: facility.address,
              openTime: facility.operatingHours,
              phone: facility.phone,
              onCall: () async {
                final uri = Uri.parse("tel:${facility.phone}");
                await launchUrl(uri);
              },
              onLocation: () async {
                final uri = Uri.parse(facility.locationUrl);
                await launchUrl(uri, mode: LaunchMode.externalApplication);
              },
            );
          },
        );
      },
    );
  }
}
