import 'package:flutter/material.dart';
import 'package:salamaty/features/authentication/SignIn/presentation/view/sign_in_screen.dart';
import 'package:salamaty/features/authentication/SignUp/presentation/view/sign_up_screen.dart';
import 'package:salamaty/features/authentication/forgot%20password/presentation/view/forgot_password_screen.dart';
import 'package:salamaty/features/authentication/reset%20password/presentation/view/reset_password_screen.dart';
import 'package:salamaty/features/splash/presentation/view/splash_screen2.dart';
import 'package:salamaty/features/splash/presentation/view/splash_screen.dart';

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
    case ResetPasswordScreen.routeName:
      return MaterialPageRoute(builder: (_) => ResetPasswordScreen());

    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
