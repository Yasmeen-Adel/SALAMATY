import 'package:flutter/material.dart';
import 'package:salamaty/features/facilities/presentation/view/widgets/facilities_header.dart';
import 'package:salamaty/features/facilities/presentation/view/widgets/facility_card.dart';

class OphthalmologyScreen extends StatelessWidget {
  const OphthalmologyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const FacilitiesHeader(
            headerText: 'Ophthalmology',
          ),

          const SizedBox(height: 16),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [

                FacilityCard(
                  name: 'Fayoum Eye Center',
                  type: 'Clinic',
                  distance: '2.3 km',
                  address: 'El Mahata St, Fayoum',
                  openTime: 'Open from 9 AM to 10 PM',
                  phone: 'Call',
                  onCall: () {},
                  onLocation: () {},
                ),

                FacilityCard(
                  name: 'Cairo Vision Hospital',
                  type: 'Hospital',
                  distance: '5.1 km',
                  address: 'Nasr City, Cairo',
                  openTime: 'Open 24 Hours',
                  phone: 'Call',
                  onCall: () {},
                  onLocation: () {},
                ),

                FacilityCard(
                  name: 'Giza Retina Clinic',
                  type: 'Clinic',
                  distance: '3.8 km',
                  address: 'Dokki, Giza',
                  openTime: 'Open from 10 AM to 6 PM',
                  phone: 'Call',
                  onCall: () {},
                  onLocation: () {},
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
