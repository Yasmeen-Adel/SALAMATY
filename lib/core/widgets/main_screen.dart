import 'package:flutter/material.dart';
import 'package:glaze_nav_bar/glaze_nav_bar.dart';
import 'package:salamaty/core/utils/app_colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:salamaty/features/drug%20store/presentation/view/drug_store_screen.dart';
import 'package:salamaty/features/home/presentation/view/home_screen.dart';
import 'package:salamaty/features/select%20insurance/presentation/view/insurance_screen.dart';
import 'package:salamaty/features/profile/presentation/view/profile_screen.dart';
import 'package:salamaty/features/scan/presentation/view/scan_screen.dart';

class MainScreen extends StatefulWidget {
  static const String routeName = 'main_screen';

  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;

  final List<Widget> screens = [
    Center(child: HomeScreen()),
    Center(child: DrugStoreScreen()),
    Center(child: ScanScreen()),
    Center(child: InsuranceScreen()),
    Center(child: ProfileScreen()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: GlazeNavBar(
        index: currentIndex,
        color: AppColors.primaryColor,
        backgroundColor: Colors.transparent,
        glassBorderColor: AppColors.primaryColor,
        buttonBackgroundColor: AppColors.primaryColor,
        glassBlur: 15,
        glassOpacity: 0.9,
        items: [
          GlazeNavBarItem(
            child: Icon(Icons.home_outlined, color: Colors.white),
            label: 'Home',
            labelStyle: TextStyle(color: Colors.white),
          ),
          GlazeNavBarItem(
            child: Icon(FontAwesomeIcons.pills, color: Colors.white),
            label: 'Drug Store',
            labelStyle: TextStyle(color: Colors.white),
          ),
          GlazeNavBarItem(
            child: Icon(Icons.qr_code_scanner_outlined, color: Colors.white),
            label: 'Scan',
            labelStyle: TextStyle(color: Colors.white),
          ),
          GlazeNavBarItem(
            child:
                Icon(FontAwesomeIcons.handHoldingMedical, color: Colors.white),
            label: 'Insurance',
            labelStyle: TextStyle(color: Colors.white),
          ),
          GlazeNavBarItem(
            child: Icon(Icons.person, color: Colors.white),
            label: 'Profile',
            labelStyle: TextStyle(color: Colors.white),
          ),
        ],
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
