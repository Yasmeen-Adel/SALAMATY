import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salamaty/features/home/presentation/cubit/home_cubit.dart';
import 'package:salamaty/features/home/presentation/view/widgets/facilities_section.dart';
import 'package:salamaty/features/home/presentation/view/widgets/header_section.dart';
import 'package:salamaty/features/home/presentation/view/widgets/med_tips.dart';
import 'package:salamaty/features/specialities/presentation/view/widgets/specialities_scection.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const HeaderSection(),
        Expanded(
          child: SingleChildScrollView(
            child: BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                final isLoading =
                    state is HomeLoading || state is HomeInitial;

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Specialties
                    isLoading
                        ? _buildSpecialtiesSkeleton()
                        : const SpecialtiesSection(),

                    const SizedBox(height: 6),

                    // Med Tips
                    isLoading ? _buildTipsSkeleton() : const MedTips(),

                    const SizedBox(height: 6),

                    // Facilities — عندها skeleton خاص بيها جوه
                    const FacilitiesSection(),

                    const SizedBox(height: 20),
                  ],
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSpecialtiesSkeleton() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _skeletonLine(120, 16),
          const SizedBox(height: 12),
          SizedBox(
            height: 90,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              separatorBuilder: (_, __) => const SizedBox(width: 12),
              itemBuilder: (_, __) => Column(
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  const SizedBox(height: 6),
                  _skeletonLine(50, 10),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTipsSkeleton() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: Container(
        height: 165,
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }

  Widget _skeletonLine(double width, double height) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}