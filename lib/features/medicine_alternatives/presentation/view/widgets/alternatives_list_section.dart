import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salamaty/features/medicine/presentation/view/medicine_details_screen.dart';
import 'package:salamaty/features/medicine_alternatives/presentation/cubit/medicine_alternatives_cubit.dart';
import 'package:salamaty/features/medicine_alternatives/presentation/cubit/medicine_alternatives_state.dart';
import 'package:salamaty/features/medicine_alternatives/presentation/view/widgets/medicine_alternative_item.dart';

class AlternativesListSection extends StatelessWidget {
  const AlternativesListSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MedicineAlternativesCubit, MedicineAlternativesState>(
      builder: (context, state) {
        if (state is MedicineAlternativesLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is MedicineAlternativesFailure) {
          return Center(
            child: Column(
              children: [
                const Icon(Icons.error_outline, color: Colors.red, size: 48),
                const SizedBox(height: 12),
                Text(
                  state.error,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.red),
                ),
              ],
            ),
          );
        }

        if (state is MedicineAlternativesSuccess) {
          if (state.alternatives.isEmpty) {
            return const Center(child: Text('No alternatives found.'));
          }

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: state.alternatives.length,
              itemBuilder: (context, index) {
                final item = state.alternatives[index];
                return MedicineAlternativeItem(
                  title: item.name,
                  description: item.description,
                  image: item.imageUrl,
                  isNetworkImage: true,
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      MedicineDetailsScreen.routeName,
                      arguments: item.id,
                    );
                  },
                );
              },
            ),
          );
        }

        return const SizedBox();
      },
    );
  }
}
