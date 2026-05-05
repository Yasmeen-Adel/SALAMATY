// // // import 'package:flutter/material.dart';
// // // import 'package:geocoding/geocoding.dart';
// // // import 'package:glaze_nav_bar/glaze_nav_bar.dart';
// // // import 'package:salamaty/core/services/auth_local_storage.dart';
// // // import 'package:salamaty/core/services/get_it_services.dart';
// // // import 'package:salamaty/core/utils/app_colors.dart';
// // // import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// // // import 'package:salamaty/features/authentication/data/auth_repo.dart';
// // // import 'package:salamaty/features/drug_store/presentation/view/drug_store_screen.dart';
// // // import 'package:salamaty/features/home/presentation/view/home_screen.dart';
// // // import 'package:salamaty/features/select_insurance/presentation/view/insurance_screen.dart';
// // // import 'package:salamaty/features/profile/presentation/view/profile_screen.dart';
// // // import 'package:salamaty/features/scan/presentation/view/scan_screen.dart';
// // // import 'package:salamaty/core/services/location_service.dart';
// // // import 'package:salamaty/generated/l10n.dart';

// // // class MainScreen extends StatefulWidget {
// // //   static const String routeName = 'main_screen';

// // //   const MainScreen({super.key});

// // //   @override
// // //   State<MainScreen> createState() => _MainScreenState();
// // // }

// // // class _MainScreenState extends State<MainScreen> {
// // //   int currentIndex = 0;

// // //   @override
// // //   void initState() {
// // //     super.initState();
// // //     _initializeLocation();
// // //   }

// // //   Future<void> _initializeLocation() async {
// // //     final isLoggedIn = await AuthLocalStorage.isLoggedIn();
// // //     if (!isLoggedIn) return;

// // //     final savedLocation = await AuthLocalStorage.getLocation();
// // //     if (savedLocation != null) {
// // //       print("Location already saved, skipping update");
// // //       return;
// // //     }

// // //     final locationService = LocationService();
// // //     final position = await locationService.getCurrentLocation();

// // //     if (position == null) {
// // //       print("Location permission denied or service disabled");
// // //       return;
// // //     }

// // //     final lat = position.latitude;
// // //     final lng = position.longitude;

// // //     try {
// // //       await getIt<AuthRepo>().updateLocation(
// // //         lat: lat,
// // //         lng: lng,
// // //       );

// // //       //  lat & lng
// // //       await AuthLocalStorage.saveLocation(lat, lng);

// // //       final placemarks = await placemarkFromCoordinates(lat, lng);
// // //       final place = placemarks.first;

// // //       final address =
// // //           "${place.street ?? ""}, ${place.locality ?? ""}, ${place.country ?? ""}";

// // //       await AuthLocalStorage.saveAddress(address);

// // //       print("Location + Address saved successfully");
// // //     } catch (e) {
// // //       print("Failed to update location: $e");
// // //     }
// // //   }

// // //   List<Widget> get screens => [
// // //         const HomeScreen(),
// // //         const DrugStoreScreen(),
// // //         const ScanScreen(),
// // //         const InsuranceScreen(),
// // //         const ProfileScreen(),
// // //       ];
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       body: screens[currentIndex],
// // //       bottomNavigationBar: Directionality(
// // //         textDirection: Directionality.of(context),
// // //         child: GlazeNavBar(
// // //           index: currentIndex,
// // //           color: AppColors.primaryColor,
// // //           backgroundColor: Colors.transparent,
// // //           glassBorderColor: AppColors.primaryColor,
// // //           buttonBackgroundColor: AppColors.primaryColor,
// // //           glassBlur: 15,
// // //           glassOpacity: 0.9,
// // //           items: [
// // //             GlazeNavBarItem(
// // //               child: Icon(Icons.home_outlined, color: Colors.white),
// // //               label: S.of(context).home,
// // //               labelStyle: TextStyle(color: Colors.white),
// // //             ),
// // //             GlazeNavBarItem(
// // //               child: Icon(FontAwesomeIcons.pills, color: Colors.white),
// // //               label: S.of(context).drugStore,
// // //               labelStyle: TextStyle(color: Colors.white),
// // //             ),
// // //             GlazeNavBarItem(
// // //               child: Icon(Icons.qr_code_scanner_outlined, color: Colors.white),
// // //               label: S.of(context).scan,
// // //               labelStyle: TextStyle(color: Colors.white),
// // //             ),
// // //             GlazeNavBarItem(
// // //               child: Icon(FontAwesomeIcons.handHoldingMedical,
// // //                   color: Colors.white),
// // //               label: S.of(context).insurance,
// // //               labelStyle: TextStyle(color: Colors.white),
// // //             ),
// // //             GlazeNavBarItem(
// // //               child: Icon(Icons.person, color: Colors.white),
// // //               label: S.of(context).profile,
// // //               labelStyle: TextStyle(color: Colors.white),
// // //             ),
// // //           ],
// // //           onTap: (index) {
// // //             setState(() {
// // //               currentIndex = index;
// // //             });
// // //           },
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }

// // // lib\core\widgets\main_screen.dart

// // import 'package:flutter/material.dart';
// // import 'package:geocoding/geocoding.dart';
// // import 'package:glaze_nav_bar/glaze_nav_bar.dart';
// // import 'package:salamaty/core/services/auth_local_storage.dart';
// // import 'package:salamaty/core/services/get_it_services.dart';
// // import 'package:salamaty/core/utils/app_colors.dart';
// // import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// // import 'package:salamaty/features/authentication/data/auth_repo.dart';
// // import 'package:salamaty/features/drug_store/presentation/view/drug_store_screen.dart';
// // import 'package:salamaty/features/home/presentation/view/home_screen.dart';
// // import 'package:salamaty/features/select_insurance/presentation/view/insurance_screen.dart';
// // import 'package:salamaty/features/profile/presentation/view/profile_screen.dart';
// // import 'package:salamaty/features/scan/presentation/view/scan_screen.dart';
// // import 'package:salamaty/core/services/location_service.dart';
// // import 'package:salamaty/generated/l10n.dart';

// // class MainScreen extends StatefulWidget {
// //   static const String routeName = 'main_screen';

// //   const MainScreen({super.key});

// //   @override
// //   State<MainScreen> createState() => _MainScreenState();
// // }

// // class _MainScreenState extends State<MainScreen> {
// //   int currentIndex = 0;

// //   @override
// //   void initState() {
// //     super.initState();
// //     _initializeLocation();
// //   }

// //   @override
// //   void didChangeDependencies() {
// //     super.didChangeDependencies();
// //     // لو اتبعتلنا index كـ argument (من InsuranceServicesScreen مثلاً)
// //     final args = ModalRoute.of(context)?.settings.arguments;
// //     if (args != null && args is int) {
// //       WidgetsBinding.instance.addPostFrameCallback((_) {
// //         if (mounted) {
// //           setState(() => currentIndex = args);
// //         }
// //       });
// //     }
// //   }

// //   Future<void> _initializeLocation() async {
// //     final isLoggedIn = await AuthLocalStorage.isLoggedIn();
// //     if (!isLoggedIn) return;

// //     final savedLocation = await AuthLocalStorage.getLocation();
// //     if (savedLocation != null) {
// //       print("Location already saved, skipping update");
// //       return;
// //     }

// //     final locationService = LocationService();
// //     final position = await locationService.getCurrentLocation();

// //     if (position == null) {
// //       print("Location permission denied or service disabled");
// //       return;
// //     }

// //     final lat = position.latitude;
// //     final lng = position.longitude;

// //     try {
// //       await getIt<AuthRepo>().updateLocation(
// //         lat: lat,
// //         lng: lng,
// //       );

// //       await AuthLocalStorage.saveLocation(lat, lng);

// //       final placemarks = await placemarkFromCoordinates(lat, lng);
// //       final place = placemarks.first;

// //       final address =
// //           "${place.street ?? ""}, ${place.locality ?? ""}, ${place.country ?? ""}";

// //       await AuthLocalStorage.saveAddress(address);

// //       print("Location + Address saved successfully");
// //     } catch (e) {
// //       print("Failed to update location: $e");
// //     }
// //   }

// //   List<Widget> get screens => [
// //         const HomeScreen(),
// //         const DrugStoreScreen(),
// //         const ScanScreen(),
// //         const InsuranceScreen(),
// //         const ProfileScreen(),
// //       ];

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: screens[currentIndex],
// //       bottomNavigationBar: Directionality(
// //         textDirection: Directionality.of(context),
// //         child: GlazeNavBar(
// //           index: currentIndex,
// //           color: AppColors.primaryColor,
// //           backgroundColor: Colors.transparent,
// //           glassBorderColor: AppColors.primaryColor,
// //           buttonBackgroundColor: AppColors.primaryColor,
// //           glassBlur: 15,
// //           glassOpacity: 0.9,
// //           items: [
// //             GlazeNavBarItem(
// //               child: Icon(Icons.home_outlined, color: Colors.white),
// //               label: S.of(context).home,
// //               labelStyle: TextStyle(color: Colors.white),
// //             ),
// //             GlazeNavBarItem(
// //               child: Icon(FontAwesomeIcons.pills, color: Colors.white),
// //               label: S.of(context).drugStore,
// //               labelStyle: TextStyle(color: Colors.white),
// //             ),
// //             GlazeNavBarItem(
// //               child: Icon(Icons.qr_code_scanner_outlined, color: Colors.white),
// //               label: S.of(context).scan,
// //               labelStyle: TextStyle(color: Colors.white),
// //             ),
// //             GlazeNavBarItem(
// //               child: Icon(FontAwesomeIcons.handHoldingMedical,
// //                   color: Colors.white),
// //               label: S.of(context).insurance,
// //               labelStyle: TextStyle(color: Colors.white),
// //             ),
// //             GlazeNavBarItem(
// //               child: Icon(Icons.person, color: Colors.white),
// //               label: S.of(context).profile,
// //               labelStyle: TextStyle(color: Colors.white),
// //             ),
// //           ],
// //           onTap: (index) {
// //             setState(() {
// //               currentIndex = index;
// //             });
// //           },
// //         ),
// //       ),
// //     );
// //   }
// // }// lib\core\widgets\main_screen.dart

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
// import 'package:salamaty/features/select_insurance/presentation/view/insurance_screen.dart';
// import 'package:salamaty/features/profile/presentation/view/profile_screen.dart';
// import 'package:salamaty/features/scan/presentation/view/scan_screen.dart';
// import 'package:salamaty/core/services/location_service.dart';
// import 'package:salamaty/generated/l10n.dart';

// // routes
// import 'package:salamaty/features/insurance_information/presentation/view/insurance_information_screen.dart';
// import 'package:salamaty/features/insurance_services/presentation/view/insurance_services_screen.dart';
// import 'package:salamaty/features/insurance_profile/presentation/view/insurance_profile_screen.dart';
// import 'package:salamaty/features/select_insurance/data/models/select_insurance_provider.dart';

// class MainScreen extends StatefulWidget {
//   static const String routeName = 'main_screen';

//   const MainScreen({super.key});

//   @override
//   State<MainScreen> createState() => _MainScreenState();
// }

// class _MainScreenState extends State<MainScreen> {
//   int currentIndex = 0;

//   final List<GlobalKey<NavigatorState>> _navigatorKeys = [
//     GlobalKey<NavigatorState>(),
//     GlobalKey<NavigatorState>(),
//     GlobalKey<NavigatorState>(),
//     GlobalKey<NavigatorState>(),
//     GlobalKey<NavigatorState>(),
//   ];

//   @override
//   void initState() {
//     super.initState();
//     _initializeLocation();
//   }

//   Future<void> _initializeLocation() async {
//     final isLoggedIn = await AuthLocalStorage.isLoggedIn();
//     if (!isLoggedIn) return;

//     final savedLocation = await AuthLocalStorage.getLocation();
//     if (savedLocation != null) {
//       print("Location already saved, skipping update");
//       return;
//     }

//     final locationService = LocationService();
//     final position = await locationService.getCurrentLocation();

//     if (position == null) {
//       print("Location permission denied or service disabled");
//       return;
//     }

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

//       print("Location + Address saved successfully");
//     } catch (e) {
//       print("Failed to update location: $e");
//     }
//   }

//   Future<bool> _onWillPop() async {
//     final canPop = _navigatorKeys[currentIndex].currentState?.canPop() ?? false;
//     if (canPop) {
//       _navigatorKeys[currentIndex].currentState?.pop();
//       return false;
//     }
//     return true;
//   }

//   // route generator لكل tab navigator
//   Route<dynamic>? _onGenerateRoute(RouteSettings settings) {
//     switch (settings.name) {
//       case InsuranceInformationScreen.routeName:
//         return MaterialPageRoute(
//           settings: settings,
//           builder: (_) => const InsuranceInformationScreen(),
//         );
//       case InsuranceServicesScreen.routeName:
//         return MaterialPageRoute(
//           settings: settings,
//           builder: (_) => const InsuranceServicesScreen(),
//         );
//       case InsuranceProfileScreen.routeName:
//         return MaterialPageRoute(
//           settings: settings,
//           builder: (_) => const InsuranceProfileScreen(),
//         );
//       default:
//         return null;
//     }
//   }

//   Widget _buildOffstageNavigator(int index, Widget screen) {
//     return Offstage(
//       offstage: currentIndex != index,
//       child: Navigator(
//         key: _navigatorKeys[index],
//         onGenerateRoute: (settings) {
//           // أول ما يفتح الـ tab، يعرض الـ screen الأساسية
//           if (settings.name == '/') {
//             return MaterialPageRoute(builder: (_) => screen);
//           }
//           // أي route تاني يتعمله push من جوا الـ tab
//           return _onGenerateRoute(settings);
//         },
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: _onWillPop,
//       child: Scaffold(
//         body: Stack(
//           children: [
//             _buildOffstageNavigator(0, const HomeScreen()),
//             _buildOffstageNavigator(1, const DrugStoreScreen()),
//             _buildOffstageNavigator(2, const ScanScreen()),
//             _buildOffstageNavigator(3, const InsuranceScreen()),
//             _buildOffstageNavigator(4, const ProfileScreen()),
//           ],
//         ),
//         bottomNavigationBar: Directionality(
//           textDirection: Directionality.of(context),
//           child: GlazeNavBar(
//             index: currentIndex,
//             color: AppColors.primaryColor,
//             backgroundColor: Colors.transparent,
//             glassBorderColor: AppColors.primaryColor,
//             buttonBackgroundColor: AppColors.primaryColor,
//             glassBlur: 15,
//             glassOpacity: 0.9,
//             items: [
//               GlazeNavBarItem(
//                 child: Icon(Icons.home_outlined, color: Colors.white),
//                 label: S.of(context).home,
//                 labelStyle: TextStyle(color: Colors.white),
//               ),
//               GlazeNavBarItem(
//                 child: Icon(FontAwesomeIcons.pills, color: Colors.white),
//                 label: S.of(context).drugStore,
//                 labelStyle: TextStyle(color: Colors.white),
//               ),
//               GlazeNavBarItem(
//                 child:
//                     Icon(Icons.qr_code_scanner_outlined, color: Colors.white),
//                 label: S.of(context).scan,
//                 labelStyle: TextStyle(color: Colors.white),
//               ),
//               GlazeNavBarItem(
//                 child: Icon(FontAwesomeIcons.handHoldingMedical,
//                     color: Colors.white),
//                 label: S.of(context).insurance,
//                 labelStyle: TextStyle(color: Colors.white),
//               ),
//               GlazeNavBarItem(
//                 child: Icon(Icons.person, color: Colors.white),
//                 label: S.of(context).profile,
//                 labelStyle: TextStyle(color: Colors.white),
//               ),
//             ],
//             onTap: (index) {
//               setState(() => currentIndex = index);
//             },
//           ),
//         ),
//       ),
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

// 👇 مهم جداً
import 'package:salamaty/core/helper_functions/on_generate_route.dart';

class MainScreen extends StatefulWidget {
  static const String routeName = 'main_screen';

  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;

  final List<GlobalKey<NavigatorState>> _navigatorKeys = [
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
  ];

  @override
  void initState() {
    super.initState();
    _initializeLocation();
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

  Future<bool> _onWillPop() async {
    final canPop = _navigatorKeys[currentIndex].currentState?.canPop() ?? false;
    if (canPop) {
      _navigatorKeys[currentIndex].currentState?.pop();
      return false;
    }
    return true;
  }

  Widget _buildOffstageNavigator(int index, Widget screen) {
    return Offstage(
      offstage: currentIndex != index,
      child: Navigator(
        key: _navigatorKeys[index],
        onGenerateRoute: (settings) {
          if (settings.name == '/') {
            return MaterialPageRoute(builder: (_) => screen);
          }

          // 🔥 الحل هنا
          return onGenerateRoute(settings);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: Stack(
          children: [
            _buildOffstageNavigator(0, const HomeScreen()),
            _buildOffstageNavigator(1, const DrugStoreScreen()),
            _buildOffstageNavigator(2, const ScanScreen()),
            _buildOffstageNavigator(3, const InsuranceScreen()),
            _buildOffstageNavigator(4, const ProfileScreen()),
          ],
        ),
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
                labelStyle: const TextStyle(color: Colors.white),
              ),
              GlazeNavBarItem(
                child: Icon(FontAwesomeIcons.pills, color: Colors.white),
                label: S.of(context).drugStore,
                labelStyle: const TextStyle(color: Colors.white),
              ),
              GlazeNavBarItem(
                child:
                    Icon(Icons.qr_code_scanner_outlined, color: Colors.white),
                label: S.of(context).scan,
                labelStyle: const TextStyle(color: Colors.white),
              ),
              GlazeNavBarItem(
                child: Icon(FontAwesomeIcons.handHoldingMedical,
                    color: Colors.white),
                label: S.of(context).insurance,
                labelStyle: const TextStyle(color: Colors.white),
              ),
              GlazeNavBarItem(
                child: Icon(Icons.person, color: Colors.white),
                label: S.of(context).profile,
                labelStyle: const TextStyle(color: Colors.white),
              ),
            ],
            onTap: (index) {
              setState(() => currentIndex = index);
            },
          ),
        ),
      ),
    );
  }
}
