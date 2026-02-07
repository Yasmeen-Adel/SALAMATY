import 'package:flutter/material.dart';
import 'package:salamaty/features/splash/presentation/views/splash_screen2.dart';
import 'package:salamaty/features/splash/presentation/views/splash_screen.dart';
import 'package:salamaty/features/medicine/presentation/view/medicine_details_screen.dart';
// 1. استيراد ملف الشاشة الجديدة
import 'package:salamaty/features/medicine_alternatives/presentation/view/medicine_alternatives_screen.dart';
// 2. استيراد شاشة Insurance Services
import 'package:salamaty/features/insurance/presentation/view/insurance_services_screen.dart';
// 3. استيراد شاشة Insurance Profile
import 'package:salamaty/features/insurance_profile/presentation/view/insurance_profile_screen.dart';

Route<dynamic>? onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashScreen.routeName:
      return MaterialPageRoute(builder: (_) => const SplashScreen());
    case SplashScreen2.routeName:
      return MaterialPageRoute(builder: (_) => const SplashScreen2());
    case MedicineDetailsScreen.routeName:
      return MaterialPageRoute(builder: (_) => const MedicineDetailsScreen());

    // 2. إضافة الحالة الجديدة هنا
    case MedicineAlternativesScreen.routeName:
      return MaterialPageRoute(
          builder: (_) => const MedicineAlternativesScreen());

    // 3. إضافة شاشة Insurance Services
    case InsuranceServicesScreen.routeName:
      return MaterialPageRoute(builder: (_) => const InsuranceServicesScreen());

    // 4. إضافة شاشة Insurance Profile
    case InsuranceProfileScreen.routeName:
      return MaterialPageRoute(builder: (_) => const InsuranceProfileScreen());

    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
