import 'package:flutter/material.dart';
import 'facility_card.dart';

class FacilitiesList extends StatelessWidget {
  const FacilitiesList({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.all(16),
        children: [
          FacilityCard(
            name: 'El-Ezaby Pharmacy',
            type: 'Pharmacy',
            distance: '1.2 KM away -',
            address: '123 Health St.',
            openTime: 'Open until 11 PM',
            phone: 'Call',
            onCall: () {},
            onLocation: () {},
          ),
          FacilityCard(
            name: 'Dar El Fouad Hospital',
            type: 'Hospital',
            distance: '3.1 KM away -',
            address: '90 Takseem St.',
            openTime: 'Open 24 Hours',
            phone: 'Call',
            onCall: () {},
            onLocation: () {},
          ),
          FacilityCard(
            name: 'El Mokhtabar Labs',
            type: 'Lab',
            distance: '1.5 KM away -',
            address: 'Nasr City',
            openTime: 'Open until 10 PM',
            phone: 'Call',
            onCall: () {},
            onLocation: () {},
          ),
          FacilityCard(
            name: '19011 Pharmacy',
            type: 'Pharmacy',
            distance: '0.8 KM away -',
            address: 'Downtown',
            openTime: 'Open 24 Hours',
            phone: 'Call',
            onCall: () {},
            onLocation: () {},
          ),
          FacilityCard(
            name: 'Saudi German Hospital',
            type: 'Hospital',
            distance: '4.5 KM away -',
            address: 'Cairo - Alexandria Rd',
            openTime: 'Open 24 Hours',
            phone: 'Call',
            onCall: () {},
            onLocation: () {},
          ),
          FacilityCard(
            name: 'Al Borg Laboratory',
            type: 'Lab',
            distance: '2.7 KM away -',
            address: 'Heliopolis',
            openTime: 'Open until 9 PM',
            phone: 'Call',
            onCall: () {},
            onLocation: () {},
          ),
          FacilityCard(
            name: 'Seif Pharmacy',
            type: 'Pharmacy',
            distance: '2.0 KM away -',
            address: 'Main Street',
            openTime: 'Open until 12 AM',
            phone: 'Call',
            onCall: () {},
            onLocation: () {},
          ),
          FacilityCard(
            name: 'Speed Labs',
            type: 'Lab',
            distance: '3.3 KM away -',
            address: 'Maadi',
            openTime: 'Open until 8 PM',
            phone: 'Call',
            onCall: () {},
            onLocation: () {},
          ),
        ],
      ),
    );
  }
}
