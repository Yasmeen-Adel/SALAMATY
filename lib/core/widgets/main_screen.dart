// import 'package:flutter/material.dart';
// import 'package:geocoding/geocoding.dart';
// import 'package:glaze_nav_bar/glaze_nav_bar.dart';
// import 'package:salamaty/core/services/auth_local_storage.dart';
// import 'package:salamaty/core/services/get_it_services.dart';
// import 'package:salamaty/core/utils/app_colors.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:salamaty/features/authentication/data/auth_repo.dart';
// import 'package:salamaty/features/drug_store/presentation/view/drug_store_screen.dart';
// import 'package:salamaty/features/home/presentation/view/home_screen.dart';
// import 'package:salamaty/features/insurance/presentation/view/insurance_services_screen.dart';
// import 'package:salamaty/features/select_insurance/presentation/view/insurance_screen.dart';
// import 'package:salamaty/features/profile/presentation/view/profile_screen.dart';
// import 'package:salamaty/features/scan/presentation/view/scan_screen.dart';
// import 'package:salamaty/core/services/location_service.dart';
// import 'package:salamaty/generated/l10n.dart';

// class MainScreen extends StatefulWidget {
//   static const String routeName = 'main_screen';
//   const MainScreen({super.key});

//   @override
//   State<MainScreen> createState() => _MainScreenState();
// }

// class _MainScreenState extends State<MainScreen> {
//   int currentIndex = 0;
//   late Future<void> _locationFuture;

//   @override
//   void initState() {
//     super.initState();
//     _locationFuture = _initializeLocation();
//   }

//   Future<void> _initializeLocation() async {
//     final isLoggedIn = await AuthLocalStorage.isLoggedIn();
//     if (!isLoggedIn) return;

//     // لو موجود بالفعل، خلاص مش محتاجين نعمل حاجة
//     final savedLocation = await AuthLocalStorage.getLocation();
//     if (savedLocation != null) return;

//     final locationService = LocationService();
//     final position = await locationService.getCurrentLocation();
//     if (position == null) return;

//     final lat = position.latitude;
//     final lng = position.longitude;

//     try {
//       await getIt<AuthRepo>().updateLocation(lat: lat, lng: lng);
//       await AuthLocalStorage.saveLocation(lat, lng);

//       final placemarks = await placemarkFromCoordinates(lat, lng);
//       final place = placemarks.first;
//       final address =
//           "${place.street ?? ""}, ${place.locality ?? ""}, ${place.country ?? ""}";
//       await AuthLocalStorage.saveAddress(address);
//     } catch (e) {
//       print("Failed to update location: $e");
//     }
//   }

//   List<Widget> get screens => [
//         const HomeScreen(),
//         const DrugStoreScreen(),
//         const ScanScreen(),
//         const InsuranceScreen(),
//         const ProfileScreen(),
//       ];

//   @override
// //   Widget build(BuildContext context) {
// //     return FutureBuilder<void>(
// //       future: _locationFuture,
// //       builder: (context, snapshot) {
// //         // استنى لحد ما الـ location يتحفظ
// //         if (snapshot.connectionState != ConnectionState.done) {
// //           return const Scaffold(
// //             body: Center(child: CircularProgressIndicator()),
// //           );
// //         }

// //         // بعد ما الـ location يبقى جاهز، ابني الـ UI
// //         return Scaffold(
// //           body: screens[currentIndex],
// //           bottomNavigationBar: Directionality(
// //             textDirection: Directionality.of(context),
// //             child: GlazeNavBar(
// //               index: currentIndex,
// //               color: AppColors.primaryColor,
// //               backgroundColor: Colors.transparent,
// //               glassBorderColor: AppColors.primaryColor,
// //               buttonBackgroundColor: AppColors.primaryColor,
// //               glassBlur: 15,
// //               glassOpacity: 0.9,
// //               items: [
// //                 GlazeNavBarItem(
// //                   child: Icon(Icons.home_outlined, color: Colors.white),
// //                   label: S.of(context).home,
// //                   labelStyle: const TextStyle(color: Colors.white),
// //                 ),
// //                 GlazeNavBarItem(
// //                   child: Icon(FontAwesomeIcons.pills, color: Colors.white),
// //                   label: S.of(context).drugStore,
// //                   labelStyle: const TextStyle(color: Colors.white),
// //                 ),
// //                 GlazeNavBarItem(
// //                   child: Icon(Icons.qr_code_scanner_outlined,
// //                       color: Colors.white),
// //                   label: S.of(context).scan,
// //                   labelStyle: const TextStyle(color: Colors.white),
// //                 ),
// //                 GlazeNavBarItem(
// //                   child: Icon(FontAwesomeIcons.handHoldingMedical,
// //                       color: Colors.white),
// //                   label: S.of(context).insurance,
// //                   labelStyle: const TextStyle(color: Colors.white),
// //                 ),
// //                 GlazeNavBarItem(
// //                   child: Icon(Icons.person, color: Colors.white),
// //                   label: S.of(context).profile,
// //                   labelStyle: const TextStyle(color: Colors.white),
// //                 ),
// //               ],
// //               onTap: (index) {
// //                 setState(() {
// //                   currentIndex = index;
// //                 });
// //               },
// //             ),
// //           ),
// //         );
// //       },
// //     );
// //   }
// // }

//   @override
//   Widget build(BuildContext context) {
//     final args = ModalRoute.of(context)?.settings.arguments;

//     if (args is int) {
//       currentIndex = args;
//     }

//     return FutureBuilder<void>(
//       future: _locationFuture,
//       builder: (context, snapshot) {
//         if (snapshot.connectionState != ConnectionState.done) {
//           return const Scaffold(
//             body: Center(child: CircularProgressIndicator()),
//           );
//         }

//         return Scaffold(
//           body: screens[currentIndex],
//           bottomNavigationBar: Directionality(
//             textDirection: Directionality.of(context),
//             child: GlazeNavBar(
//               index: currentIndex,
//               color: AppColors.primaryColor,
//               backgroundColor: Colors.transparent,
//               glassBorderColor: AppColors.primaryColor,
//               buttonBackgroundColor: AppColors.primaryColor,
//               glassBlur: 15,
//               glassOpacity: 0.9,
//               items: [
//                 GlazeNavBarItem(
//                   child: Icon(Icons.home_outlined, color: Colors.white),
//                   label: S.of(context).home,
//                   labelStyle: const TextStyle(color: Colors.white),
//                 ),
//                 GlazeNavBarItem(
//                   child: Icon(FontAwesomeIcons.pills, color: Colors.white),
//                   label: S.of(context).drugStore,
//                   labelStyle: const TextStyle(color: Colors.white),
//                 ),
//                 GlazeNavBarItem(
//                   child:
//                       Icon(Icons.qr_code_scanner_outlined, color: Colors.white),
//                   label: S.of(context).scan,
//                   labelStyle: const TextStyle(color: Colors.white),
//                 ),
//                 GlazeNavBarItem(
//                   child: Icon(FontAwesomeIcons.handHoldingMedical,
//                       color: Colors.white),
//                   label: S.of(context).insurance,
//                   labelStyle: const TextStyle(color: Colors.white),
//                 ),
//                 GlazeNavBarItem(
//                   child: Icon(Icons.person, color: Colors.white),
//                   label: S.of(context).profile,
//                   labelStyle: const TextStyle(color: Colors.white),
//                 ),
//               ],
//               onTap: (index) {
//                 setState(() {
//                   currentIndex = index;
//                 });
//               },
//             ),
//           ),
//         );
//       },
//     );
//   }
// }



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
import 'package:shared_preferences/shared_preferences.dart';
import 'package:salamaty/features/insurance_services/presentation/view/insurance_services_screen.dart';

class MainScreen extends StatefulWidget {
  static const String routeName = 'main_screen';
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;
  late Future<void> _initFuture;
  bool _indexInitialized = false;

  bool _hasInsurance = false;
  int _providerId = 0;

  @override
  void initState() {
    super.initState();
    _initFuture = _initialize();
  }

  Future<void> _initialize() async {
    final prefs = await SharedPreferences.getInstance();

    // ✅ نقرأ القيم الحديثة دايماً من SharedPreferences
    _hasInsurance = prefs.getBool('has_insurance') ?? false;
    _providerId = prefs.getInt('provider_id') ?? 0;

    await _initializeLocation();
  }

  Future<void> _initializeLocation() async {
    final isLoggedIn = await AuthLocalStorage.isLoggedIn();
    if (!isLoggedIn) return;

    final savedLocation = await AuthLocalStorage.getLocation();
    if (savedLocation != null) return;

    final locationService = LocationService();
    final position = await locationService.getCurrentLocation();
    if (position == null) return;

    final lat = position.latitude;
    final lng = position.longitude;

    try {
      await getIt<AuthRepo>().updateLocation(lat: lat, lng: lng);
      await AuthLocalStorage.saveLocation(lat, lng);

      final placemarks = await placemarkFromCoordinates(lat, lng);
      final place = placemarks.first;
      final address =
          "${place.street ?? ""}, ${place.locality ?? ""}, ${place.country ?? ""}";
      await AuthLocalStorage.saveAddress(address);
    } catch (e) {
      print("Failed to update location: $e");
    }
  }

  List<Widget> get screens => [
        const HomeScreen(),
        const DrugStoreScreen(),
        const ScanScreen(),
        // ✅ بنبني الـ widget بعد ما الـ future يخلص فعلاً
        _hasInsurance && _providerId != 0
            ? InsuranceServicesScreenWithId(providerId: _providerId)
            : const InsuranceScreen(),
        const ProfileScreen(),
      ];

  @override
  Widget build(BuildContext context) {
    if (!_indexInitialized) {
      final args = ModalRoute.of(context)?.settings.arguments;
      if (args is int) {
        currentIndex = args;
      }
      _indexInitialized = true;
    }

    return FutureBuilder<void>(
      future: _initFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        // ✅ لو في error في الـ init، نعرضه
        if (snapshot.hasError) {
          return Scaffold(
            body: Center(child: Text('Error: ${snapshot.error}')),
          );
        }

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
                currentIndex = index;
              });
            },
          ),
        );
      },
    );
  }
}
