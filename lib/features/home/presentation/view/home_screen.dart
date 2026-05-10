import 'package:flutter/material.dart';
import 'package:salamaty/features/home/presentation/view/widgets/home_screen_body.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = "home";

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: HomeScreenBody(),
    );
  }
}