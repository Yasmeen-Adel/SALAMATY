import 'package:flutter/material.dart';
import 'package:salamaty/core/widgets/arrow_back.dart';

class InsuranceHeaderSection extends StatelessWidget {
  const InsuranceHeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 0, right: 20, top: 50, bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ArrowBack(),
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.only(left: 22.0),
            child: Text(
              'Insurance Services',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w600,
                color: Color(0xFF0D2D9E),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.only(left: 22.0),
            child: Text(
              'A list of medicines marked as favorites by the user.',
              style: TextStyle(
                fontSize: 16,
                color: Color(0xFF989898),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
