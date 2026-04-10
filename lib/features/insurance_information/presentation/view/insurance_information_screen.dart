import 'package:flutter/material.dart';
import 'package:salamaty/features/insurance_information/presentation/view/widgets/insurance_information_screen_body.dart';

class InsuranceInformationScreen extends StatelessWidget {
  const InsuranceInformationScreen({super.key});

  static const String routeName = 'insurance_information';
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: InsuranceInformationScreenBody());
  }
}
