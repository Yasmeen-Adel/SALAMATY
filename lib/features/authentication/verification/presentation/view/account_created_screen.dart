import 'package:flutter/material.dart';
import 'package:salamaty/features/authentication/verification/presentation/view/widgets/account_created_screen_body.dart';
class AccountCreatedScreen extends StatelessWidget {
  const AccountCreatedScreen({super.key});
  static const String routeName = 'account_created_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: AccountCreatedScreenBody(),
    );
  }
}
