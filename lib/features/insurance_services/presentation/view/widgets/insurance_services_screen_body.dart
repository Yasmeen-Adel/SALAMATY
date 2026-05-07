

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salamaty/core/utils/app_colors.dart';
import 'package:salamaty/core/widgets/custom_screen_subtitle.dart';
import 'package:salamaty/core/widgets/custom_screen_title.dart';
import 'package:salamaty/core/widgets/custom_text_field_label.dart';
import 'package:salamaty/features/insurance_services/data/models/facility_model.dart';
import 'package:salamaty/features/insurance_services/presentation/cubit/insurance_services_cubit.dart';
import 'package:url_launcher/url_launcher.dart';

class InsuranceServicesScreenBody extends StatefulWidget {
  const InsuranceServicesScreenBody({super.key});

  @override
  State<InsuranceServicesScreenBody> createState() =>
      _InsuranceServicesScreenBodyState();
}

class _InsuranceServicesScreenBodyState
    extends State<InsuranceServicesScreenBody> {
  @override
  void initState() {
    super.initState();
    context.read<InsuranceServicesCubit>().loadFacilities();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InsuranceServicesCubit, InsuranceServicesState>(
      builder: (context, state) {
        return Column(
          children: [
            const SizedBox(height: 40),
            // ✅ شيلنا الـ back button لأن الـ screen دي بتتعرض كـ tab في الـ nav bar
            const CustomScreenTitle(title: 'Insurance Services'),
            const CustomScreenSubtitle(
              subtitleText: 'A list of covered services near your location.',
            ),
            const SizedBox(height: 12),
            const CustomTextFieldLabel(labelText: 'Nearby Services'),
            const SizedBox(height: 10),
            _buildFilterTabs(state),
            const SizedBox(height: 10),
            Expanded(child: _buildBody(state)),
          ],
        );
      },
    );
  }

  Widget _buildFilterTabs(InsuranceServicesState state) {
    final filters = ['All', 'Labs', 'Hospitals', 'Pharmacies'];
    final selected =
        state is InsuranceServicesLoaded ? state.selectedFilter : 'All';

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: filters.map((f) {
          final isSelected = f == selected;
          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: GestureDetector(
              onTap: () =>
                  context.read<InsuranceServicesCubit>().changeFilter(f),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  color:
                      isSelected ? AppColors.primaryColor : Colors.transparent,
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                    color: isSelected
                        ? AppColors.primaryColor
                        : Colors.grey.shade400,
                  ),
                ),
                child: Text(
                  f,
                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildBody(InsuranceServicesState state) {
    if (state is InsuranceServicesLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (state is InsuranceServicesError) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, color: Colors.red, size: 48),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                state.message,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 14),
              ),
            ),
            const SizedBox(height: 8),
            TextButton(
              onPressed: () =>
                  context.read<InsuranceServicesCubit>().loadFacilities(),
              child: const Text('Retry'),
            ),
          ],
        ),
      );
    }

    if (state is InsuranceServicesLoaded) {
      if (state.facilities.isEmpty) {
        return const Center(
          child: Text('No facilities found nearby.'),
        );
      }
      return ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: state.facilities.length,
        itemBuilder: (context, index) =>
            _FacilityCard(facility: state.facilities[index]),
      );
    }

    return const SizedBox();
  }
}

// ===================== Facility Card =====================

class _FacilityCard extends StatelessWidget {
  final FacilityModel facility;

  const _FacilityCard({required this.facility});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.07),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // name + type
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  facility.name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  _formatType(facility.type),
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ),
            ],
          ),

          // ✅ fix: بنعرض المسافة دايماً لو موجودة — شيلنا شرط distanceKm > 0
          if (facility.address != null) ...[
            const SizedBox(height: 4),
            Text(
              facility.distanceKm != null
                  ? '${facility.distanceKm!.toStringAsFixed(1)} KM away — ${facility.address}'
                  : facility.address!,
              style: const TextStyle(fontSize: 13, color: Colors.grey),
            ),
          ],

          // open/closed status
          const SizedBox(height: 4),
          Text(
            facility.openUntil ?? (facility.isOpen ? 'Open' : 'Closed'),
            style: TextStyle(
              fontSize: 13,
              color: facility.isOpen ? Colors.green : Colors.red,
              fontWeight: FontWeight.w500,
            ),
          ),

          const SizedBox(height: 12),

          // Call + Location buttons
          Row(
            children: [
              if (facility.phone != null) ...[
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () => _callPhone(facility.phone!),
                    icon: const Icon(Icons.phone, size: 16),
                    label: const Text('Call'),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: AppColors.primaryColor,
                      side: const BorderSide(color: AppColors.primaryColor),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
              ],
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () => _openLocation(),
                  icon: const Icon(Icons.location_on, size: 16),
                  label: const Text('Location'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    foregroundColor: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  String _formatType(String type) {
    final map = {
      'hospital': 'Hospital',
      'analysis laboratories': 'Lab',
      'pharmacies': 'Pharmacy',
      'radiology center': 'Radiology',
      'physical therapy': 'Physiotherapy',
    };
    return map[type.toLowerCase()] ?? type;
  }

  Future<void> _callPhone(String phone) async {
    final uri = Uri.parse('tel:$phone');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  Future<void> _openLocation() async {
    if (facility.locationUrl != null) {
      final uri = Uri.parse(facility.locationUrl!);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      }
    } else if (facility.latitude != null && facility.longitude != null) {
      final uri = Uri.parse(
          'https://www.google.com/maps/search/?api=1&query=${facility.latitude},${facility.longitude}');
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      }
    }
  }
}
