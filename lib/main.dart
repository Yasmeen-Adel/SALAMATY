import 'package:flutter/material.dart';
import 'package:salamaty/core/helper_functions/on_generate_route.dart';
import 'package:salamaty/features/splash/presentation/view/splash_screen.dart';

void main() {
  runApp(SalamatyApp());
}
class SalamatyApp extends StatelessWidget {
  const SalamatyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Salamaty',
      onGenerateRoute: onGenerateRoute,
      initialRoute: SplashScreen.routeName,
    );
  }
}
