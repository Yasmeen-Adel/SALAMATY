import 'package:flutter/material.dart';
import 'package:salamaty/features/medicine_alternatives/presentation/view/widgets/medicine_alternatives_header_section.dart';
import 'package:salamaty/features/medicine_alternatives/presentation/view/widgets/alternatives_list_section.dart';

class MedicineAlternativesBody extends StatelessWidget {
  const MedicineAlternativesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: const Color(0xFFFFFFFF),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            MedicineAlternativesHeaderSection(),
            SizedBox(height: 10),
            AlternativesListSection(),
          ],
        ),
      ),
    );
  }
}
