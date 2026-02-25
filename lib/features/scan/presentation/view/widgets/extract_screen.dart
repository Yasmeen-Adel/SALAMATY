import 'dart:io';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:salamaty/core/widgets/arrow_back.dart';
import 'package:salamaty/core/widgets/custom_screen_title.dart';
import 'package:salamaty/core/widgets/large_app_button.dart';

class ExtractScreen extends StatelessWidget {
  final File imageFile;

  const ExtractScreen({super.key, required this.imageFile});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 50),
          const ArrowBack(),
          const SizedBox(height: 15),
          const CustomScreenTitle(title: 'Analyze Prescription'),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              width: double.infinity,
              height: 260,
              clipBehavior: Clip.antiAlias,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 1,
                    color: Colors.black.withAlpha(54),
                  ),
                  borderRadius: BorderRadius.circular(30),
                ),
                shadows: const [
                  BoxShadow(
                    color: Color(0x3F000000),
                    blurRadius: 4,
                    offset: Offset(0, 4),
                  )
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.file(
                  imageFile,
                  width: double.infinity,
                  height: 300,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(right: 50.0),
            child: Lottie.asset(
              'assets/animations/loading.json',
              width: 120,
              height: 120,
              fit: BoxFit.cover,
              repeat: true,
            ),
          ),
          const SizedBox(height: 30),
          LargeAppButton(
            text: 'View Detected Medicines',
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
