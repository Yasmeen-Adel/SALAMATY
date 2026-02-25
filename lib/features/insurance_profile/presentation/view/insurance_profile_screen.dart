import 'package:flutter/material.dart';
import 'package:salamaty/features/insurance_profile/presentation/view/widgets/insurance_profile_body.dart';

class InsuranceProfileScreen extends StatelessWidget {
  const InsuranceProfileScreen({super.key});

  static const String routeName = 'insurance_profile';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: InsuranceProfileBody(),
    );
  }
}
