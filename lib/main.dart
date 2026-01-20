import 'package:flutter/material.dart';
import 'package:salamaty/core/helper_functions/on_generate_route.dart';
import 'package:salamaty/features/splash/presentation/views/splash_screen2.dart';
import 'package:salamaty/features/splash/presentation/views/splash_screen.dart';

void main() {
  runApp(SalamatyApp());
}

class SalamatyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Salamaty',
      // home:SplashScreen(),
      onGenerateRoute: onGenerateRoute,
      initialRoute: SplashScreen2.routeName,
      
    );
  }
}
