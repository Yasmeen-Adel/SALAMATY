import 'package:flutter/material.dart';
import 'package:salamaty/features/authentication/SignIn/presentation/view/sign_in_screen.dart';
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



    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
