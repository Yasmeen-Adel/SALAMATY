import 'package:flutter/material.dart';
import 'package:salamaty/features/facilities/presentation/view/facilities_screen.dart';
import 'package:salamaty/features/facilities/presentation/view/widgets/facility_card.dart';

class FacilitiesSection extends StatelessWidget {
  const FacilitiesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          /// Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Facilities',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1E40AF),
                ),
              ),
              
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, FacilitiesScreen.routeName);
                },
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero, 
                  minimumSize: Size.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
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

          /// Cards list
          FacilityCard(
            name: 'El-Ezaby',
            type: 'Pharmacy',
            distance: '1.2 KM away',
            address: '123 Health St.',
            openTime: 'Open until 11 PM',
            phone: 'Call',
            onCall: () {
              // call from backend
            },
            onLocation: () {
              // open map using backend lat/lng
            },
          ),

          FacilityCard(
            name: 'Seif Pharmacy',
            type: 'Pharmacy',
            distance: '2.0 KM away',
            address: 'Main Street',
            openTime: 'Open until 12 AM',
            phone: 'Call',
            onCall: () {},
            onLocation: () {},
          ),
        ],
      ),
    );
  }
}
