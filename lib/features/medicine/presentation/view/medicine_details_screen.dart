import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salamaty/features/favorite/data/repo/favorite_repo.dart';
import 'package:salamaty/features/favorite/presentation/cubit/favorite_cubit.dart';
import 'package:salamaty/features/medicine/data/repo/medicine_details_repo.dart';
import 'package:salamaty/features/medicine/presentation/cubit/medicine_details_cubit.dart';
import 'package:salamaty/features/medicine/presentation/cubit/medicine_details_state.dart';
import 'widgets/medicine_details_body.dart';

class MedicineDetailsScreen extends StatelessWidget {
  final int productId;

  const MedicineDetailsScreen({super.key, required this.productId});

  static const String routeName = 'medicine_details';

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => MedicineDetailsCubit(MedicineDetailsRepo())
            ..fetchMedicineDetails(productId),
        ),
        BlocProvider(
          create: (_) => FavoriteCubit(FavoriteRepo())..fetchFavorites(),
        ),
      ],
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: BlocBuilder<MedicineDetailsCubit, MedicineDetailsState>(
            builder: (context, state) {
              if (state is MedicineDetailsLoading) {
                return const Center(child: CircularProgressIndicator());
              }

              if (state is MedicineDetailsFailure) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.error_outline,
                          color: Colors.red, size: 48),
                      const SizedBox(height: 12),
                      Text(state.error,
                          textAlign: TextAlign.center,
                          style: const TextStyle(color: Colors.red)),
                      const SizedBox(height: 12),
                      ElevatedButton(
                        onPressed: () => context
                            .read<MedicineDetailsCubit>()
                            .fetchMedicineDetails(productId),
                        child: const Text('Try Again'),
                      ),
                    ],
                  ),
                );
              }

              if (state is MedicineDetailsSuccess) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: MedicineDetailsBody(medicine: state.medicine),
                    ),
                  ],
                );
              }

              return const SizedBox();
            },
          ),
        ),
      ),
    );
  }
}