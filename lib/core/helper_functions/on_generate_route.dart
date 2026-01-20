import 'package:flutter/material.dart';
import 'package:salamaty/features/splash/presentation/views/splash_screen2.dart';
import 'package:salamaty/features/splash/presentation/views/splash_screen.dart';

Route<dynamic>? onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    //Splash Screen :)
    case SplashScreen.routeName:
      return MaterialPageRoute(builder: (_) => SplashScreen());
      //Splash Screen2 :)
    case SplashScreen2.routeName:
      return MaterialPageRoute(builder: (_) => SplashScreen2());
    default:
      return MaterialPageRoute(builder: (context)=>const Scaffold()); 
  }
}