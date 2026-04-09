import 'package:flutter/material.dart';
import 'package:salamaty/core/utils/app_text_styles.dart';
import 'package:salamaty/features/insurance/presentation/view/widgets/service_item_card.dart';

class NearbyServicesSection extends StatelessWidget {
  const NearbyServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Nearby Services',
            style: AppTextStyles.semiBold24.copyWith(
              color: Color(0xFF0D2D9E),
            ),
          ),
          SizedBox(height: 16),
          ServiceItemCard(
            name: 'Dar El Fouad Hospital',
            distance: '3.1 KM away',
            address: '90 Takseem St.',
            status: 'Open 24 Hours',
            type: 'Hospital',
          ),

          ServiceItemCard(
            name: 'Alpha Labs',
            distance: '2.2 KM away',
            address: ' 89 Diagnostic Ave.',
            status: 'Open until 8 PM',
            type: 'Lab',
          ),
          /////////
          ServiceItemCard(
            name: 'El-Ezaby',
            distance: '1.2 KM away',
            address: '123 Health St.',
            status: 'Open until 11 PM',
            type: 'Pharmacy',
          ),
        ],
      ),
    );
  }
}
