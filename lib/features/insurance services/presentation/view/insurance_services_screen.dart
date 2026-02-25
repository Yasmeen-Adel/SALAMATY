import 'package:flutter/material.dart';
import 'package:salamaty/features/insurance%20services/presentation/view/widgets/insurance_services_screen_body.dart';

class InsuranceServicesScreen extends StatelessWidget {
  const InsuranceServicesScreen({super.key});

  static const String routeName = 'insurance_services_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: InsuranceServicesScreenBody());
  }
}
