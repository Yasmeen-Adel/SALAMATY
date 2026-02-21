import 'package:flutter/material.dart';
import 'package:salamaty/core/helper_functions/on_generate_route.dart';
import 'package:salamaty/features/medicine/presentation/view/medicine_details_screen.dart';
import 'package:salamaty/features/splash/presentation/views/splash_screen.dart';
import 'package:salamaty/features/medicine_alternatives/presentation/view/medicine_alternatives_screen.dart';
import 'package:salamaty/features/insurance/presentation/view/insurance_services_screen.dart';
import 'package:salamaty/features/insurance_profile/presentation/view/insurance_profile_screen.dart';

void main() {
  runApp(SalamatyApp());
}

class SalamatyApp extends StatelessWidget {
  const SalamatyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Salamaty',
      onGenerateRoute: onGenerateRoute,
      initialRoute:
          InsuranceProfileScreen.routeName, // <- عرض شاشة Insurance Profile
    );
  }
}
