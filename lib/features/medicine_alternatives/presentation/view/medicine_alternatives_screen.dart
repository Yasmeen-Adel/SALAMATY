// import 'package:flutter/material.dart';
// import 'package:salamaty/features/medicine_alternatives/presentation/view/widgets/medicine_alternatives_body.dart';

// class MedicineAlternativesScreen extends StatelessWidget {
//   const MedicineAlternativesScreen({super.key});

//   static const String routeName = 'medicine-alternatives';

//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//       body: MedicineAlternativesBody(),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salamaty/features/medicine_alternatives/data/repo/medicine_alternatives_repo.dart';
import 'package:salamaty/features/medicine_alternatives/presentation/cubit/medicine_alternatives_cubit.dart';
import 'package:salamaty/features/medicine_alternatives/presentation/view/widgets/medicine_alternatives_body.dart';

class MedicineAlternativesScreen extends StatelessWidget {
  final int productId;

  const MedicineAlternativesScreen({super.key, required this.productId});

  static const String routeName = 'medicine-alternatives';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MedicineAlternativesCubit(MedicineAlternativesRepo())
        ..fetchAlternatives(productId),
      child: const Scaffold(
        body: MedicineAlternativesBody(),
      ),
    );
  }
}