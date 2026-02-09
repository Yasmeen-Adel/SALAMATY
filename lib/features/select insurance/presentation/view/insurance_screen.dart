import 'package:flutter/material.dart';
import 'package:salamaty/features/select%20insurance/presentation/view/widgets/insurance_screen_body.dart';

class InsuranceScreen extends StatelessWidget {
  const InsuranceScreen({super.key});

  static const String routeName = 'insurance';
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: InsuranceScreenBody());
  }
}

