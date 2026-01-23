import 'package:flutter/material.dart';
import 'package:salamaty/features/profile/presentation/view/widgets/profile_screen_body.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  static const String routeName = 'profile';
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: ProfileScreenBody());
  }
}
