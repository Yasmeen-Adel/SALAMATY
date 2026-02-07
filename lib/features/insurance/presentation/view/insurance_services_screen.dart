import 'package:flutter/material.dart';
import 'package:salamaty/features/insurance/presentation/view/widgets/insurance_services_body.dart';

class InsuranceServicesScreen extends StatelessWidget {
  const InsuranceServicesScreen({super.key});

  static const String routeName = 'insurance-services';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InsuranceServicesBody(),
    );
  }
}
