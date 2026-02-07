import 'package:flutter/material.dart';
import 'package:salamaty/features/insurance_profile/presentation/view/widgets/benefit_item.dart';

class CoverageBenefitsSection extends StatelessWidget {
  const CoverageBenefitsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'Coverage & Benefits',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1E40AF),
            ),
          ),
          SizedBox(height: 8),
          BenefitItem(
            iconPath: 'assets/icons/medicines_icon.png',
            title: 'Medicines',
            items: ['Prophine', 'Catafast', 'panadol'],
            isCovered: true,
          ),
          SizedBox(height: 12),
          BenefitItem(
            iconPath: 'assets/icons/lab_tests_icon.png',
            title: 'Lab Tests',
            items: ['Prophine', 'Catafast', 'panadol'],
            isCovered: true,
          ),
          SizedBox(height: 12),
          BenefitItem(
            iconPath: 'assets/icons/hospitals_icon.png',
            title: 'Hospitals',
            items: [],
            isCovered: true,
          ),
        ],
      ),
    );
  }
}
