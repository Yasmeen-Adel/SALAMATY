import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:glaze_nav_bar/glaze_nav_bar.dart';
import 'package:salamaty/core/services/auth_local_storage.dart';
import 'package:salamaty/core/services/get_it_services.dart';
import 'package:salamaty/core/utils/app_colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:salamaty/features/authentication/data/auth_repo.dart';
import 'package:salamaty/features/drug_store/presentation/view/drug_store_screen.dart';
import 'package:salamaty/features/home/presentation/view/home_screen.dart';
import 'package:salamaty/features/select_insurance/presentation/view/insurance_screen.dart';
import 'package:salamaty/features/profile/presentation/view/profile_screen.dart';
import 'package:salamaty/features/scan/presentation/view/scan_screen.dart';
import 'package:salamaty/core/services/location_service.dart';
import 'package:salamaty/generated/l10n.dart';

class MainScreen extends StatefulWidget {
  static const String routeName = 'main_screen';

  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _initializeLocation();
  }

  Future<void> _initializeLocation() async {
    final isLoggedIn = await AuthLocalStorage.isLoggedIn();
    if (!isLoggedIn) return;

    final savedLocation = await AuthLocalStorage.getLocation();
    if (savedLocation != null) {
      print("Location already saved, skipping update");
      return;
    }

    final locationService = LocationService();
    final position = await locationService.getCurrentLocation();

    if (position == null) {
      print("Location permission denied or service disabled");
      return;
    }

    final lat = position.latitude;
    final lng = position.longitude;

    try {
      await getIt<AuthRepo>().updateLocation(
        lat: lat,
        lng: lng,
      );

      //  lat & lng
      await AuthLocalStorage.saveLocation(lat, lng);

      final placemarks = await placemarkFromCoordinates(lat, lng);
      final place = placemarks.first;

      final address =
          "${place.street ?? ""}, ${place.locality ?? ""}, ${place.country ?? ""}";

      await AuthLocalStorage.saveAddress(address);

      print("Location + Address saved successfully");
    } catch (e) {
      print("Failed to update location: $e");
    }
  }

  List<Widget> get screens => [
        const HomeScreen(),
        const DrugStoreScreen(),
        const ScanScreen(),
        const InsuranceScreen(),
        const ProfileScreen(),
      ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: Directionality(
        textDirection: Directionality.of(context),
        child: GlazeNavBar(
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
              label: S.of(context).home,
              labelStyle: TextStyle(color: Colors.white),
            ),
            GlazeNavBarItem(
              child: Icon(FontAwesomeIcons.pills, color: Colors.white),
              label: S.of(context).drugStore,
              labelStyle: TextStyle(color: Colors.white),
            ),
            GlazeNavBarItem(
              child: Icon(Icons.qr_code_scanner_outlined, color: Colors.white),
              label: S.of(context).scan,
              labelStyle: TextStyle(color: Colors.white),
            ),
            GlazeNavBarItem(
              child: Icon(FontAwesomeIcons.handHoldingMedical,
                  color: Colors.white),
              label: S.of(context).insurance,
              labelStyle: TextStyle(color: Colors.white),
            ),
            GlazeNavBarItem(
              child: Icon(Icons.person, color: Colors.white),
              label: S.of(context).profile,
              labelStyle: TextStyle(color: Colors.white),
            ),
          ],
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}
