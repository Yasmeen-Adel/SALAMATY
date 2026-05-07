// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:salamaty/features/insurance_services/data/repos/insurance_services_repo.dart';
// import 'package:salamaty/features/insurance_services/presentation/cubit/insurance_services_cubit.dart';
// import 'package:salamaty/features/insurance_services/presentation/view/widgets/insurance_services_screen_body.dart';

// // ✅ القديم (للـ navigation بالـ arguments) — بيفضل مع Scaffold لأنه screen مستقلة
// class InsuranceServicesScreen extends StatelessWidget {
//   const InsuranceServicesScreen({super.key});

//   static const String routeName = 'insurance_services_screen';

//   @override
//   Widget build(BuildContext context) {
//     final providerId = ModalRoute.of(context)?.settings.arguments as int? ?? 0;

//     return BlocProvider(
//       create: (_) => InsuranceServicesCubit(
//         repo: InsuranceServicesRepo(
//           dio: Dio(BaseOptions(baseUrl: 'http://salamaty.runasp.net')),
//         ),
//         providerId: providerId,
//       ),
//       child: const Scaffold(
//         body: InsuranceServicesScreenBody(),
//       ),
//     );
//   }
// }

// // ✅ الجديد (للـ nav bar) — بدون Scaffold لأن MainScreen هو اللي عنده الـ Scaffold والـ nav bar
// class InsuranceServicesScreenWithId extends StatelessWidget {
//   final int providerId;

//   const InsuranceServicesScreenWithId({super.key, required this.providerId});

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (_) => InsuranceServicesCubit(
//         repo: InsuranceServicesRepo(
//           dio: Dio(BaseOptions(baseUrl: 'http://salamaty.runasp.net')),
//         ),
//         providerId: providerId,
//       ),
//       child: const InsuranceServicesScreenBody(),
//     );
//   }
// }

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:salamaty/core/utils/app_colors.dart';
import 'package:salamaty/features/drug_store/presentation/view/drug_store_screen.dart';
import 'package:salamaty/features/home/presentation/view/home_screen.dart';
import 'package:salamaty/features/insurance_services/data/repos/insurance_services_repo.dart';
import 'package:salamaty/features/insurance_services/presentation/cubit/insurance_services_cubit.dart';
import 'package:salamaty/features/insurance_services/presentation/view/widgets/insurance_services_screen_body.dart';
import 'package:salamaty/features/profile/presentation/view/profile_screen.dart';
import 'package:salamaty/features/scan/presentation/view/scan_screen.dart';
import 'package:salamaty/features/select_insurance/presentation/view/insurance_screen.dart';
import 'package:salamaty/generated/l10n.dart';
import 'package:glaze_nav_bar/glaze_nav_bar.dart';

class InsuranceServicesScreen extends StatefulWidget {
  const InsuranceServicesScreen({super.key});

  static const String routeName = 'insurance_services_screen';

  @override
  State<InsuranceServicesScreen> createState() =>
      _InsuranceServicesScreenState();
}

class _InsuranceServicesScreenState extends State<InsuranceServicesScreen> {
  int _currentIndex = 3; // insurance tab

  late final int _providerId;

  final List<Widget> _screens = [];
  bool _initialized = false;

  void _initScreens(int providerId) {
    if (_initialized) return;
    _initialized = true;
    _screens.addAll([
      const HomeScreen(),
      const DrugStoreScreen(),
      const ScanScreen(),
      BlocProvider(
        create: (_) => InsuranceServicesCubit(
          repo: InsuranceServicesRepo(
            dio: Dio(BaseOptions(baseUrl: 'http://salamaty.runasp.net')),
          ),
          providerId: providerId,
        ),
        child: InsuranceServicesScreenBody(),
      ),
      const ProfileScreen(),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    final providerId =
        ModalRoute.of(context)?.settings.arguments as int? ?? 0;

    _initScreens(providerId);

    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: GlazeNavBar(
        index: _currentIndex,
        color: AppColors.primaryColor,
        backgroundColor: Colors.transparent,
        glassBorderColor: AppColors.primaryColor,
        buttonBackgroundColor: AppColors.primaryColor,
        glassBlur: 15,
        glassOpacity: 0.9,
        items: [
          GlazeNavBarItem(
            child: const Icon(Icons.home_outlined, color: Colors.white),
            label: S.of(context).home,
            labelStyle: const TextStyle(color: Colors.white),
          ),
          GlazeNavBarItem(
            child: const Icon(FontAwesomeIcons.pills, color: Colors.white),
            label: S.of(context).drugStore,
            labelStyle: const TextStyle(color: Colors.white),
          ),
          GlazeNavBarItem(
            child: const Icon(Icons.qr_code_scanner_outlined,
                color: Colors.white),
            label: S.of(context).scan,
            labelStyle: const TextStyle(color: Colors.white),
          ),
          GlazeNavBarItem(
            child: const Icon(FontAwesomeIcons.handHoldingMedical,
                color: Colors.white),
            label: S.of(context).insurance,
            labelStyle: const TextStyle(color: Colors.white),
          ),
          GlazeNavBarItem(
            child: const Icon(Icons.person, color: Colors.white),
            label: S.of(context).profile,
            labelStyle: const TextStyle(color: Colors.white),
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}

// للـ nav bar الداخلي في MainScreen
class InsuranceServicesScreenWithId extends StatelessWidget {
  final int providerId;

  const InsuranceServicesScreenWithId({super.key, required this.providerId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => InsuranceServicesCubit(
        repo: InsuranceServicesRepo(
          dio: Dio(BaseOptions(baseUrl: 'http://salamaty.runasp.net')),
        ),
        providerId: providerId,
      ),
      child: InsuranceServicesScreenBody(),
    );
  }
}