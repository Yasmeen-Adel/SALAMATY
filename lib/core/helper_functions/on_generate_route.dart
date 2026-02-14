import 'package:flutter/material.dart';
import 'package:salamaty/features/authentication/SignIn/presentation/view/sign_in_screen.dart';
import 'package:salamaty/features/authentication/SignUp/presentation/view/sign_up_screen.dart';
import 'package:salamaty/features/authentication/forgot%20password/presentation/view/forgot_password_screen.dart';
import 'package:salamaty/features/authentication/reset%20password/presentation/view/reset_password_screen.dart';
import 'package:salamaty/core/widgets/main_screen.dart';
import 'package:salamaty/features/authentication/verification/presentation/view/verification_screen.dart';
import 'package:salamaty/features/drug%20store/presentation/view/drug_store_screen.dart';
import 'package:salamaty/features/edit%20profile/presentation/view/edit_profile_screen.dart';
import 'package:salamaty/features/facilities/presentation/view/facilities_screen.dart';
import 'package:salamaty/features/insurance%20information/presentation/view/insurance_information_screen.dart';
import 'package:salamaty/features/insurance%20services/presentation/view/insurance_services_screen.dart';
import 'package:salamaty/features/notifications/presentation/view/notifications_screen.dart';
import 'package:salamaty/features/select%20insurance/presentation/view/insurance_screen.dart';
import 'package:salamaty/features/profile/presentation/view/profile_screen.dart';
import 'package:salamaty/features/scan/presentation/view/scan_screen.dart';
import 'package:salamaty/features/splash/presentation/view/splash_screen2.dart';
import 'package:salamaty/features/splash/presentation/view/splash_screen.dart';
import 'package:salamaty/features/home/presentation/view/home_screen.dart';

Route<dynamic>? onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    //Splash Screen :)
    case SplashScreen.routeName:
      return MaterialPageRoute(builder: (_) => SplashScreen());
    //Splash Screen2 :)
    case SplashScreen2.routeName:
      return MaterialPageRoute(builder: (_) => SplashScreen2());
    //Sign In Screen :)
    case SignInScreen.routeName:
      return MaterialPageRoute(builder: (_) => SignInScreen());
    //Sign Up Screen :)
    case SignUpScreen.routeName:
      return MaterialPageRoute(builder: (_) => SignUpScreen());
    //Forgot Password Screen :)
    case ForgotPasswordScreen.routeName:
      return MaterialPageRoute(builder: (_) => ForgotPasswordScreen());
    //Reset Password Screen :)
    // case ResetPasswordScreen.routeName:
    //   return MaterialPageRoute(builder: (_) => ResetPasswordScreen());
    case ResetPasswordScreen.routeName:
      final args = settings.arguments as Map;
      return MaterialPageRoute(
        builder: (_) => ResetPasswordScreen(
          email: args['email'],
          otpCode: args['otpCode'],
        ),
      );

    //Home Screen :)
    case HomeScreen.routeName:
      return MaterialPageRoute(builder: (_) => HomeScreen());
    //Main Screen :)
    case MainScreen.routeName:
      return MaterialPageRoute(builder: (_) => MainScreen());
    //Profile Screen :)
    case ProfileScreen.routeName:
      return MaterialPageRoute(builder: (_) => ProfileScreen());
    //Verification Screen :)
    case VerificationScreen.routeName:
      final args = settings.arguments as Map<String, dynamic>?;
      final email = args?['email'];
      if (email == null) {
        return MaterialPageRoute(
          builder: (_) => SignUpScreen(),
        );
      }
      return MaterialPageRoute(
        builder: (_) => VerificationScreen(email: email),
      );

    // case VerificationScreen.routeName:
    //   return MaterialPageRoute(builder: (_) => VerificationScreen());

    //Insurance Screen :)
    case InsuranceScreen.routeName:
      return MaterialPageRoute(builder: (_) => InsuranceScreen());
    //Edit Profile Screen :)
    case EditProfileScreen.routeName:
      return MaterialPageRoute(builder: (_) => EditProfileScreen());
    //Insurance Information Screen :)
    case InsuranceInformationScreen.routeName:
      return MaterialPageRoute(builder: (_) => InsuranceInformationScreen());
    //Scan Screen :)
    case ScanScreen.routeName:
      return MaterialPageRoute(builder: (_) => ScanScreen());
    //Facilities Screen :)
    case FacilitiesScreen.routeName:
      return MaterialPageRoute(builder: (_) => FacilitiesScreen());
    //insurance services Screen :)
    case InsuranceServicesScreen.routeName:
      return MaterialPageRoute(builder: (_) => InsuranceServicesScreen());
    //Drug Store Screen :)
    case DrugStoreScreen.routeName:
      return MaterialPageRoute(builder: (_) => DrugStoreScreen());
    //Notification Screen :)
    case NotificationsScreen.routeName:
      return MaterialPageRoute(builder: (_) => NotificationsScreen());
    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
