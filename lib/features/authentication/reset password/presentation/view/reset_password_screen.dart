import 'package:flutter/material.dart';
import 'package:salamaty/features/authentication/reset%20password/presentation/view/widgets/reset_password_screen_body.dart';
class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});
  static const String routeName = 'reset_password_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ResetPasswordScreenBody(),
    );
  }
}
