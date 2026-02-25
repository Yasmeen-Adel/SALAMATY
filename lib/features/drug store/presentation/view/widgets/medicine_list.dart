import 'package:flutter/material.dart';
import 'package:salamaty/features/medicine/presentation/view/medicine_details_screen.dart';
import 'medicine_card.dart';

class MedicineList extends StatelessWidget {
  const MedicineList({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> medicines = [
      {
        'name': 'Paracetamol',
        'price': 'Rp15.000',
        'image': 'https://images.unsplash.com/photo-1588776814546-1ffcf47267a5',
      },
      {
        'name': 'Fish Oil Omega 3',
        'price': 'Rp75.000',
        'image': 'https://images.unsplash.com/photo-1584308666744-24d5c474f2ae',
      },
      {
        'name': 'Vitamin C 1000mg',
        'price': 'Rp25.000',
        'image': 'https://images.unsplash.com/photo-1607619056574-7b8d3ee536b2',
      },
      {
        'name': 'Paracetamol',
        'price': 'Rp10.000',
        'image': 'https://images.unsplash.com/photo-1588776814546-1ffcf47267a5',
      },
      {
        'name': 'Antibiotic Cream',
        'price': 'Rp18.000',
        'image': 'https://images.unsplash.com/photo-1582719478250-c89cae4dc85b',
      },
      {
        'name': 'Allergy Relief',
        'price': 'Rp22.000',
        'image': 'https://images.unsplash.com/photo-1607619056574-7b8d3ee536b2',
      },
    ];

    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 14,
        crossAxisSpacing: 8,
        childAspectRatio: 0.75,
      ),
      itemCount: medicines.length,
      itemBuilder: (context, index) {
        final medicine = medicines[index];

        return MedicineCard(
          imageUrl: medicine['image']!,
          name: medicine['name']!,
          price: medicine['price']!,
          onFindPharmacy: () {},
          onTap: () {
            Navigator.pushNamed(context,MedicineDetailsScreen.routeName);
          },
        );
      },
    );
  }
}
