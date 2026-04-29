import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salamaty/features/nearby_pharmacy/data/repo/nearby_pharmacy_repo.dart';
import 'package:salamaty/features/nearby_pharmacy/presentation/cubit/nearby_pharmacy_cubit.dart';
import 'package:salamaty/features/nearby_pharmacy/presentation/view/widgets/nearby_pharmacy_header.dart';
import 'package:salamaty/features/nearby_pharmacy/presentation/view/widgets/nearby_pharmacy_list.dart';

class NearbyPharmacyScreenBody extends StatelessWidget {
  final int productId;

  const NearbyPharmacyScreenBody({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NearbyPharmacyCubit(NearbyPharmacyRepo())
        ..fetchNearbyPharmacies(productId: productId),
      child: const Column(
        children: [
          NearbyPharmacyHeader(),
          Expanded(child: NearbyPharmacyList()),
        ],
      ),
    );
  }
}