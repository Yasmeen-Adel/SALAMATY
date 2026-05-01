// import 'package:flutter/material.dart';
// import 'package:salamaty/features/authentication/SignIn/presentation/view/sign_in_screen.dart';
// import 'package:salamaty/features/authentication/SignUp/presentation/view/sign_up_screen.dart';
// import 'package:salamaty/features/authentication/forgot_password/presentation/view/forgot_password_screen.dart';
// import 'package:salamaty/features/authentication/reset_password/presentation/view/reset_password_screen.dart';
// import 'package:salamaty/core/widgets/main_screen.dart';
// import 'package:salamaty/features/authentication/verification/presentation/view/verification_screen.dart';
// import 'package:salamaty/features/detected_medicines/presentation/view/detected_medicine_screen.dart';
// import 'package:salamaty/features/drug_store/presentation/view/drug_store_screen.dart';
// import 'package:salamaty/features/edit_profile/presentation/view/edit_profile_screen.dart';
// import 'package:salamaty/features/facilities/presentation/view/facilities_screen.dart';
// import 'package:salamaty/features/favorite/presentation/view/favorite_screen.dart';
// import 'package:salamaty/features/insurance_information/presentation/view/insurance_information_screen.dart';
// import 'package:salamaty/features/insurance_services/presentation/view/insurance_services_screen.dart';
// import 'package:salamaty/features/insurance_profile/presentation/view/insurance_profile_screen.dart';
// import 'package:salamaty/features/medicine/presentation/view/medicine_details_screen.dart';
// import 'package:salamaty/features/medicine_alternatives/presentation/view/medicine_alternatives_screen.dart';
// import 'package:salamaty/features/notifications/presentation/view/notifications_screen.dart';
// import 'package:salamaty/features/select_insurance/presentation/view/insurance_screen.dart';
// import 'package:salamaty/features/profile/presentation/view/profile_screen.dart';
// import 'package:salamaty/features/scan/presentation/view/scan_screen.dart';
// import 'package:salamaty/features/splash/presentation/view/splash_screen2.dart';
// import 'package:salamaty/features/splash/presentation/view/splash_screen.dart';
// import 'package:salamaty/features/home/presentation/view/home_screen.dart';
// import 'package:salamaty/features/nearby_pharmacy/presentation/view/nearby_pharmacy_screen.dart';
// import 'package:salamaty/features/select_insurance/data/models/select_insurance_provider.dart';

// Route<dynamic>? onGenerateRoute(RouteSettings settings) {
//   switch (settings.name) {
//     case SplashScreen.routeName:
//       return MaterialPageRoute(builder: (_) => SplashScreen());
//     //Splash Screen2 :)
//     case SplashScreen2.routeName:
//       return MaterialPageRoute(builder: (_) => SplashScreen2());
//     //Sign In Screen :)
//     case SignInScreen.routeName:
//       return MaterialPageRoute(builder: (_) => SignInScreen());
//     //Sign Up Screen :)
//     case SignUpScreen.routeName:
//       return MaterialPageRoute(builder: (_) => SignUpScreen());
//     //Forgot Password Screen :)
//     case ForgotPasswordScreen.routeName:
//       return MaterialPageRoute(builder: (_) => ForgotPasswordScreen());
// //Reset Password Screen :)
//     case ResetPasswordScreen.routeName:
//       final args = settings.arguments as Map;
//       return MaterialPageRoute(
//         builder: (_) => ResetPasswordScreen(
//           email: args['email'],
//           otpCode: args['otpCode'],
//         ),
//       );

//     //Home Screen :)
//     case HomeScreen.routeName:
//       return MaterialPageRoute(builder: (_) => HomeScreen());
//     //Main Screen :)
//     case MainScreen.routeName:
//       return MaterialPageRoute(builder: (_) => MainScreen());
//     //Profile Screen :)
//     case ProfileScreen.routeName:
//       return MaterialPageRoute(builder: (_) => ProfileScreen());
//     //Verification Screen :)
//     case VerificationScreen.routeName:
//       final args = settings.arguments as Map<String, dynamic>?;
//       final email = args?['email'];
//       if (email == null) {
//         return MaterialPageRoute(
//           builder: (_) => SignUpScreen(),
//         );
//       }
//       return MaterialPageRoute(
//         builder: (_) => VerificationScreen(email: email),
//       );

//     //Insurance Screen :)
//     case InsuranceScreen.routeName:
//       return MaterialPageRoute(builder: (_) => InsuranceScreen());
//     //Edit Profile Screen :)
//     case EditProfileScreen.routeName:
//       return MaterialPageRoute(builder: (_) => EditProfileScreen());
//     //Insurance Information Screen :)
//     // case InsuranceInformationScreen.routeName:
//     //   return MaterialPageRoute(builder: (_) => InsuranceInformationScreen());
//     case InsuranceInformationScreen.routeName:
//       final args = settings.arguments;

//       if (args is! InsuranceProvider) {
//         return MaterialPageRoute(
//           builder: (_) => const Scaffold(
//             body: Center(child: Text('No provider selected')),
//           ),
//         );
//       }

//       return MaterialPageRoute(
//         builder: (_) => InsuranceInformationScreen(),
//         settings: RouteSettings(arguments: args),
//       );
//     //Scan Screen :)
//     case ScanScreen.routeName:
//       return MaterialPageRoute(builder: (_) => ScanScreen());
//     //Facilities Screen :)
//     case FacilitiesScreen.routeName:
//       return MaterialPageRoute(builder: (_) => FacilitiesScreen());
//     //insurance services Screen :)
//     case InsuranceServicesScreen.routeName:
//       return MaterialPageRoute(builder: (_) => InsuranceServicesScreen());
//     //Drug Store Screen :)
//     case DrugStoreScreen.routeName:
//       return MaterialPageRoute(builder: (_) => DrugStoreScreen());
//     //Notification Screen :)
//     case NotificationsScreen.routeName:
//       return MaterialPageRoute(builder: (_) => NotificationsScreen());
//     //    //Specialties Section  :)
//     // case SpecialtiesSection.routeName:
//     //   return MaterialPageRoute(builder: (_) => SpecialtiesSection());
//     //Medicine Details Screen :)

//     case MedicineDetailsScreen.routeName:
//       final id = settings.arguments as int;

//       return MaterialPageRoute(
//         builder: (_) => MedicineDetailsScreen(
//           key: ValueKey(id),
//           productId: id,
//         ),
//       );
//     //Medicine Alternatives Screen :)
//     // case MedicineAlternativesScreen.routeName:
//     //   return MaterialPageRoute(
//     //       builder: (_) => const MedicineAlternativesScreen());
//     case MedicineAlternativesScreen.routeName:
//       final id = settings.arguments as int;
//       return MaterialPageRoute(
//         builder: (_) => MedicineAlternativesScreen(productId: id),
//       );
//     //Insurance Profile Screen :)
//     case InsuranceProfileScreen.routeName:
//       return MaterialPageRoute(builder: (_) => const InsuranceProfileScreen());
//     //favorite Screen :)
//     case FavoriteScreen.routeName:
//       return MaterialPageRoute(builder: (_) => const FavoriteScreen());
//     //detected medicine Screen :)
//     case DetectedMedicineScreen.routeName:
//       final data = settings.arguments;
//       return MaterialPageRoute(
//         builder: (_) => DetectedMedicineScreen(data: data),
//       );
//     // case DetectedMedicineScreen.routeName:
//     //   return MaterialPageRoute(builder: (_) => const DetectedMedicineScreen());

//     //Nearby Pharmacy Screen :)
//     case NearbyPharmacyScreen.routeName:
//       final id = settings.arguments as int;
//       return MaterialPageRoute(
//         builder: (_) => const NearbyPharmacyScreen(),
//         settings: RouteSettings(arguments: id),
//       );
//     default:
//       return MaterialPageRoute(builder: (context) => const Scaffold());
//   }
// }


import 'package:flutter/material.dart';
import 'package:salamaty/features/authentication/SignIn/presentation/view/sign_in_screen.dart';
import 'package:salamaty/features/authentication/SignUp/presentation/view/sign_up_screen.dart';
import 'package:salamaty/features/authentication/forgot_password/presentation/view/forgot_password_screen.dart';
import 'package:salamaty/features/authentication/reset_password/presentation/view/reset_password_screen.dart';
import 'package:salamaty/core/widgets/main_screen.dart';
import 'package:salamaty/features/authentication/verification/presentation/view/verification_screen.dart';
import 'package:salamaty/features/detected_medicines/presentation/view/detected_medicine_screen.dart';
import 'package:salamaty/features/drug_store/presentation/view/drug_store_screen.dart';
import 'package:salamaty/features/edit_profile/presentation/view/edit_profile_screen.dart';
import 'package:salamaty/features/facilities/presentation/view/facilities_screen.dart';
import 'package:salamaty/features/favorite/presentation/view/favorite_screen.dart';
import 'package:salamaty/features/insurance_information/presentation/view/insurance_information_screen.dart';
import 'package:salamaty/features/insurance_services/presentation/view/insurance_services_screen.dart';
import 'package:salamaty/features/insurance_profile/presentation/view/insurance_profile_screen.dart';
import 'package:salamaty/features/medicine/presentation/view/medicine_details_screen.dart';
import 'package:salamaty/features/medicine_alternatives/presentation/view/medicine_alternatives_screen.dart';
import 'package:salamaty/features/notifications/presentation/view/notifications_screen.dart';
import 'package:salamaty/features/select_insurance/presentation/view/insurance_screen.dart';
import 'package:salamaty/features/profile/presentation/view/profile_screen.dart';
import 'package:salamaty/features/scan/presentation/view/scan_screen.dart';
import 'package:salamaty/features/splash/presentation/view/splash_screen2.dart';
import 'package:salamaty/features/splash/presentation/view/splash_screen.dart';
import 'package:salamaty/features/home/presentation/view/home_screen.dart';
import 'package:salamaty/features/nearby_pharmacy/presentation/view/nearby_pharmacy_screen.dart';
import 'package:salamaty/features/select_insurance/data/models/select_insurance_provider.dart';

Route<dynamic>? onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {

    case SplashScreen.routeName:
      return MaterialPageRoute(builder: (_) => SplashScreen());

    case SplashScreen2.routeName:
      return MaterialPageRoute(builder: (_) => SplashScreen2());

    case SignInScreen.routeName:
      return MaterialPageRoute(builder: (_) => SignInScreen());

    case SignUpScreen.routeName:
      return MaterialPageRoute(builder: (_) => SignUpScreen());

    case ForgotPasswordScreen.routeName:
      return MaterialPageRoute(builder: (_) => ForgotPasswordScreen());

    case ResetPasswordScreen.routeName:
      final args = settings.arguments as Map;
      return MaterialPageRoute(
        builder: (_) => ResetPasswordScreen(
          email: args['email'],
          otpCode: args['otpCode'],
        ),
      );

    case HomeScreen.routeName:
      return MaterialPageRoute(builder: (_) => HomeScreen());

    case MainScreen.routeName:
      return MaterialPageRoute(builder: (_) => MainScreen());

    case ProfileScreen.routeName:
      return MaterialPageRoute(builder: (_) => ProfileScreen());

    case VerificationScreen.routeName:
      final args = settings.arguments as Map<String, dynamic>?;
      final email = args?['email'];
      if (email == null) {
        return MaterialPageRoute(builder: (_) => SignUpScreen());
      }
      return MaterialPageRoute(
        builder: (_) => VerificationScreen(email: email),
      );

    case InsuranceScreen.routeName:
      return MaterialPageRoute(builder: (_) => InsuranceScreen());

    case EditProfileScreen.routeName:
      return MaterialPageRoute(builder: (_) => EditProfileScreen());

    // ✅ Insurance Information
    case InsuranceInformationScreen.routeName:
      final args = settings.arguments;

      if (args is! InsuranceProvider) {
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('No provider selected')),
          ),
        );
      }

      return MaterialPageRoute(
        builder: (_) => InsuranceInformationScreen(),
        settings: RouteSettings(arguments: args),
      );

    case ScanScreen.routeName:
      return MaterialPageRoute(builder: (_) => ScanScreen());

    case FacilitiesScreen.routeName:
      return MaterialPageRoute(builder: (_) => FacilitiesScreen());

    // ✅ Insurance Services
    case InsuranceServicesScreen.routeName:
      final args = settings.arguments;

      if (args is! int) {
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('No providerId provided')),
          ),
        );
      }

      return MaterialPageRoute(
        builder: (_) => InsuranceServicesScreen(),
        settings: RouteSettings(arguments: args),
      );

    case DrugStoreScreen.routeName:
      return MaterialPageRoute(builder: (_) => DrugStoreScreen());

    case NotificationsScreen.routeName:
      return MaterialPageRoute(builder: (_) => NotificationsScreen());

    case MedicineDetailsScreen.routeName:
      final id = settings.arguments as int;
      return MaterialPageRoute(
        builder: (_) => MedicineDetailsScreen(
          key: ValueKey(id),
          productId: id,
        ),
      );

    case MedicineAlternativesScreen.routeName:
      final id = settings.arguments as int;
      return MaterialPageRoute(
        builder: (_) => MedicineAlternativesScreen(productId: id),
      );

    case InsuranceProfileScreen.routeName:
      return MaterialPageRoute(builder: (_) => const InsuranceProfileScreen());

    case FavoriteScreen.routeName:
      return MaterialPageRoute(builder: (_) => const FavoriteScreen());

    case DetectedMedicineScreen.routeName:
      final data = settings.arguments;
      return MaterialPageRoute(
        builder: (_) => DetectedMedicineScreen(data: data),
      );

    case NearbyPharmacyScreen.routeName:
      final id = settings.arguments as int;
      return MaterialPageRoute(
        builder: (_) => const NearbyPharmacyScreen(),
        settings: RouteSettings(arguments: id),
      );

    default:
      return MaterialPageRoute(
        builder: (_) => const Scaffold(),
      );
  }
}