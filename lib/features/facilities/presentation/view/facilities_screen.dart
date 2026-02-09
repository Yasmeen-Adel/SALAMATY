import 'package:flutter/material.dart';
import 'package:salamaty/features/facilities/presentation/view/widgets/facilities_screen_body.dart';

class FacilitiesScreen extends StatelessWidget {
  const FacilitiesScreen({super.key});

  static const String routeName = 'facilities_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: FacilitiesScreenBody());
  }
}
