import 'package:flutter/material.dart';
import 'package:salamaty/features/scan/presentation/view/widgets/scan_screen_body.dart';

class ScanScreen extends StatelessWidget {
  const ScanScreen({super.key});

  static const String routeName = 'scan';
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: ScanScreenBody());
  }
}

