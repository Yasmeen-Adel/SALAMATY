import 'package:flutter/material.dart';
import 'package:salamaty/features/detected_medicines/presentation/view/widgets/detected_medicine_item.dart';

class DetectedListSection extends StatelessWidget {
  const DetectedListSection({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> detectedMedicines = [
      {
        'title': 'Ibuprofen',
        'desc':
            'Used to relieve pain, reduce fever, and decrease inflammation.',
        'image': 'assets/images/ibuprofen.png',
      },
      {
        'title': 'Aspirin',
        'desc':
            'Helps reduce pain, fever, and inflammation. Not suitable for children.',
        'image': 'assets/images/aspirin.png',
      },
      {
        'title': 'Naproxen',
        'desc':
            'Used for pain relief and inflammation, especially muscle and joint pain.',
        'image': 'assets/images/naproxen.png',
      },
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: detectedMedicines.length,
        itemBuilder: (context, index) {
          final item = detectedMedicines[index];
          return DetectedMedicineItem(
            title: item['title'],
            description: item['desc'],
            image: item['image'],
          );
        },
      ),
    );
  }
}
