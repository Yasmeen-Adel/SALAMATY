import 'package:flutter/material.dart';
import 'package:salamaty/core/widgets/large_app_button.dart';
import 'package:salamaty/features/authentication/SignIn/presentation/view/sign_in_screen.dart';
import 'package:salamaty/core/widgets/main_screen.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      height: screenHeight * 0.60,
      padding: EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 16),
          Image.asset(
            'assets/images/drawer.png',
            height: 200,
          ),
          SizedBox(height: 16),
          Text(
            'Password Changed',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.blue[900],
            ),
          ),
          SizedBox(height: 12),
          Text(
            'Your password has been changed successfully. You can login again with your new password.',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey[700], fontSize: 16),
          ),
          Spacer(),
          //navigate to sign in screen
          LargeAppButton(
            text: 'Return to Sign In',
            onPressed: () {
              // Navigator.pushNamed(context, MainScreen.routeName);
              Navigator.pop(context);
              Navigator.pushNamed(
                context,
                SignInScreen.routeName,
              );
            },
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}
