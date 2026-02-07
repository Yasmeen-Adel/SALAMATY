import 'package:flutter/material.dart';
import 'package:salamaty/features/insurance/presentation/view/widgets/service_item_card.dart';

class NearbyServicesSection extends StatelessWidget {
  const NearbyServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'Nearby Services',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w500,
              color: Color(0xFF0D2D9E),
            ),
          ),
          SizedBox(height: 16),
          ServiceItemCard(
            name: 'El-Ezaby',
            distance: '1.2 KM away',
            address: '123 Health St.',
            status: 'Open until 11 PM',
            type: 'Pharmacy',
          ),
          ServiceItemCard(
            name: 'El-Ezaby',
            distance: '1.2 KM away',
            address: '123 Health St.',
            status: 'Open until 11 PM',
            type: 'Pharmacy',
          ),
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
