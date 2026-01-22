import 'package:flutter/material.dart';
import 'package:salamaty/features/authentication/forgot%20password/presentation/view/widgets/forgot_password_screen_body.dart';
class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});
  static const String routeName = 'forgot_password_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ForgotPasswordScreenBody(),
    );
  }
}
