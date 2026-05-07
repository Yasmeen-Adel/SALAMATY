import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salamaty/core/utils/app_colors.dart';
import 'package:salamaty/core/widgets/custom_screen_subtitle.dart';
import 'package:salamaty/core/widgets/custom_screen_title.dart';
import 'package:salamaty/core/widgets/custom_text_field_label.dart';
import 'package:salamaty/features/insurance_services/data/models/facility_model.dart';
import 'package:salamaty/features/insurance_services/presentation/cubit/insurance_services_cubit.dart';
import 'package:salamaty/generated/l10n.dart';
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
            const SizedBox(height: 70),
            // ✅ شيلنا الـ back button لأن الـ screen دي بتتعرض كـ tab في الـ nav bar
            CustomScreenTitle(title: S.of(context).insuranceServices),
            CustomScreenSubtitle(
              subtitleText: S.of(context).insuranceServicesSubtitle,
            ),
            const SizedBox(height: 30),
            CustomTextFieldLabel(labelText: S.of(context).nearbyServices),
            const SizedBox(height: 10),
            _buildFilterTabs(state),
            const SizedBox(height: 20),
            Expanded(child: _buildBody(state)),
          ],
        );
      },
    );
  }

  Widget _buildFilterTabs(InsuranceServicesState state) {
    final filters = ['All', 'Labs', 'Hospitals', 'Pharmacies'];

    final selectedIndex = state is InsuranceServicesLoaded
        ? filters.indexOf(state.selectedFilter)
        : 0;

    return SizedBox(
      height: 34,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        scrollDirection: Axis.horizontal,
        itemCount: filters.length,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final isSelected = selectedIndex == index;

          return GestureDetector(
            onTap: () => context
                .read<InsuranceServicesCubit>()
                .changeFilter(filters[index]),
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 6,
              ),
              decoration: BoxDecoration(
                color: isSelected ? AppColors.primaryColor : Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: AppColors.primaryColor.withOpacity(
                    isSelected ? 1 : 0.2,
                  ),
                  width: 1,
                ),
              ),
              child: Text(
                filters[index],
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: isSelected
                      ? AppColors.whiteColor
                      : AppColors.primaryColor,
                ),
              ),
            ),
          );
        },
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
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.primaryColor.withOpacity(0.2),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Name + Type
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  facility.name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              Text(
                _formatType(facility.type),
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
            ],
          ),

          const SizedBox(height: 6),

          /// Distance + Address
          Text(
            facility.distanceKm != null
                ? '${facility.distanceKm!.toStringAsFixed(1)} KM ${facility.address ?? ''}'
                : (facility.address ?? ''),
            style: const TextStyle(
              fontSize: 13,
              color: Colors.grey,
            ),
          ),

          const SizedBox(height: 6),

          /// Open / Closed
          Text(
            facility.openUntil ?? (facility.isOpen ? 'Open' : 'Closed'),
            style: TextStyle(
              fontSize: 14,
              color: facility.isOpen ? Colors.green : Colors.red,
              fontWeight: FontWeight.w600,
            ),
          ),

          const SizedBox(height: 14),

          /// Buttons
          Row(
            children: [
              if (facility.phone != null) ...[
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () => _callPhone(facility.phone!),
                    icon: const Icon(Icons.call, size: 18),
                    label: Text(facility.phone!),
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: AppColors.primaryColor),
                      foregroundColor: AppColors.primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
              ],
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () => _openLocation(),
                  icon: const Icon(Icons.location_on, size: 18),
                  label: const Text('Location'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 12),
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
        'https://www.google.com/maps/search/?api=1&query=${facility.latitude},${facility.longitude}',
      );
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      }
    }
  }
}
