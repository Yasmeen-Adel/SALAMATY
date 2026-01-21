import 'package:flutter/material.dart';
import 'package:salamaty/features/authentication/SignIn/presentation/view/widgets/sign_in_screen_body.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  static const String routeName = 'sign_in';
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SignInBodyScreen());
  }
}

