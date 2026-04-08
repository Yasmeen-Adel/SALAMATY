import 'package:flutter/material.dart';
import 'package:salamaty/features/drug_store/presentation/view/widgets/drug_store_screen_body.dart';

class DrugStoreScreen extends StatelessWidget {
  const DrugStoreScreen({super.key});

  static const String routeName = 'drug_store_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: DrugStoreScreenBody());
  }
}
