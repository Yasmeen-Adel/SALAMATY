import 'package:flutter/material.dart';
import 'package:salamaty/features/nearby_pharmacy/presentation/view/widgets/nearby_pharmacy_screen_body.dart';

class NearbyPharmacyScreen extends StatelessWidget {
  const NearbyPharmacyScreen({super.key});

  static const String routeName = 'nearby_pharmacy_screen';

  @override
  Widget build(BuildContext context) {
    final int productId = ModalRoute.of(context)!.settings.arguments as int;

    return Scaffold(
      body: NearbyPharmacyScreenBody(productId: productId),
    );
  }
}