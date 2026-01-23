import 'package:flutter/material.dart';
import 'package:salamaty/core/widgets/large_app_button.dart';
import 'package:salamaty/features/authentication/verification/presentation/view/widgets/lottie_animation.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer(
      {super.key,
      required this.title,
      required this.description,
      required this.buttonText,
      required this.nextScreen});
  final String title;
  final String description;
  final String buttonText;
  final Widget nextScreen;
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
          LottieAnimation(animationUrl: 'assets/animations/success.json'),
          SizedBox(height: 16),
          Text(
            title,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.blue[900],
            ),
          ),
          SizedBox(height: 12),
          Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey[700], fontSize: 16),
          ),
          Spacer(),
          LargeAppButton(
            text: buttonText,
            onPressed: () {
              Navigator.pop(context);
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (_) => nextScreen,
                ),
                (route) => false,
              );
            },
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}
