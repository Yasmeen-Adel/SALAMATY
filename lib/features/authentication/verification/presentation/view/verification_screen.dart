import 'package:flutter/material.dart';
import 'package:salamaty/features/authentication/verification/presentation/view/widgets/verification_screen_body.dart';
class VerificationScreen extends StatelessWidget {
  const VerificationScreen({super.key});
  static const String routeName = 'verification_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: VerificationScreenBody(),
    );
  }
}
