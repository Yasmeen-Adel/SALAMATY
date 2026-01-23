import 'package:flutter/material.dart';
import 'package:salamaty/features/home/presentation/view/widgets/home_screen_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const String routeName = 'home';
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: HomeScreenBody());
  }
}
