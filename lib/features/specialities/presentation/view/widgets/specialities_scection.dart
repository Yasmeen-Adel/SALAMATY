import 'package:flutter/material.dart';
import 'package:salamaty/features/specialities/presentation/view/widgets/medical_specialties.dart';
import 'package:salamaty/features/specialities/presentation/view/widgets/specialty_card.dart';

class SpecialtiesSection extends StatelessWidget {
  const SpecialtiesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Medical Specialties',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1E40AF),
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 110,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: medicalSpecialties.length,
              separatorBuilder: (_, __) => const SizedBox(width: 1),
              itemBuilder: (context, index) {
                final specialty = medicalSpecialties[index];
                return SpecialtyCard(
                  icon: specialty.icon,
                  title: specialty.name,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => specialty.screen,
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
