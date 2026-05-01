// import 'package:flutter/material.dart';
// import 'package:salamaty/core/widgets/arrow_back.dart';
// import 'package:salamaty/core/widgets/custom_screen_title.dart';
// import 'package:salamaty/features/insurance_profile/presentation/view/widgets/user_info_card.dart';
// import 'package:salamaty/features/insurance_profile/presentation/view/widgets/insurance_provider_card.dart';
// import 'package:salamaty/features/insurance_profile/presentation/view/widgets/coverage_benefits_section.dart';

// class InsuranceProfileBody extends StatelessWidget {
//   const InsuranceProfileBody({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: const [
//           //arrow back , title ...................................................
//           SizedBox(
//             height: 60,
//           ),
//           ArrowBack(),
//           CustomScreenTitle(title: 'Insurance Profile'),
//           SizedBox(height: 30),
//           UserInfoCard(),
//           SizedBox(height: 16),
//           InsuranceProviderCard(),
//           SizedBox(height: 16),
//           CoverageBenefitsSection(),
//           SizedBox(height: 20),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salamaty/core/widgets/arrow_back.dart';
import 'package:salamaty/core/widgets/custom_screen_title.dart';
import 'package:salamaty/features/insurance_profile/presentation/cubit/insurance_profile_cubit.dart';
import 'package:salamaty/features/insurance_profile/presentation/view/widgets/coverage_benefits_section.dart';
import 'package:salamaty/features/insurance_profile/presentation/view/widgets/insurance_provider_card.dart';
import 'package:salamaty/features/insurance_profile/presentation/view/widgets/user_info_card.dart';

class InsuranceProfileBody extends StatelessWidget {
  const InsuranceProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InsuranceProfileCubit, InsuranceProfileState>(
      builder: (context, state) {
        if (state is InsuranceProfileLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is InsuranceProfileError) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.error_outline, color: Colors.red, size: 48),
                const SizedBox(height: 12),
                Text(state.message),
                TextButton(
                  onPressed: () =>
                      context.read<InsuranceProfileCubit>().fetchProfile(
                            userId: '948f6f27-86b5-4545-864d-180c105632eb',
                          ),
                  child: const Text('Retry'),
                ),
              ],
            ),
          );
        }

        if (state is InsuranceProfileLoaded) {
          final profile = state.profile;
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 60),
                const ArrowBack(),
                const CustomScreenTitle(title: 'Insurance Profile'),
                const SizedBox(height: 30),
                UserInfoCard(
                  fullName: profile.fullName,
                  cardHolderId: profile.cardHolderId,
                ),
                const SizedBox(height: 16),
                InsuranceProviderCard(provider: profile.provider),
                const SizedBox(height: 16),
                CoverageBenefitsSection(
                  coverage: profile.coverage,
                  labTests: profile.labTests,
                ),
                const SizedBox(height: 20),
              ],
            ),
          );
        }

        return const SizedBox();
      },
    );
  }
}