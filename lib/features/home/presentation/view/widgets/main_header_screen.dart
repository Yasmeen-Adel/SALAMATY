import 'package:flutter/material.dart';

class MainHeaderScreen extends StatelessWidget {
  const MainHeaderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 430,
      height: 207,
      child: Stack(
        children: [
          // Search Box
          Positioned(
            left: 20,
            top: 123,
            child: Container(
              width: 322,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.black.withOpacity(0.1), width: 1),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'What can we help you find?',
                    style: TextStyle(color: Color(0xFF989898), fontSize: 15),
                  ),
                ),
              ),
            ),
          ),

          // Hello User
          Positioned(
            left: 79,
            top: 40,
            child: Text(
              'Hello, User',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          // Welcome Text
          Positioned(
            left: 77,
            top: 62,
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Welcome to ',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  TextSpan(
                    text: 'Salamaty!',
                    style: TextStyle(color: Colors.white, fontSize: 21, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),

          // Left Circle Avatar
          Positioned(
            left: 24,
            top: 48,
            child: Container(
              width: 45,
              height: 45,
              decoration: BoxDecoration(color: Colors.black, shape: BoxShape.circle),
            ),
          ),

          // Top Right Box Decoration
          Positioned(
            left: 359,
            top: 40,
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.15),
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
