import 'package:flutter/material.dart';
import 'package:salamaty/features/authentication/SignUp/presentation/view/widgets/sign_up_screen_body.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  static const String routeName = 'sign_up';
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SignUpScreenBody());
  }
}

