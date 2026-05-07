import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salamaty/core/utils/app_colors.dart';
import 'package:salamaty/core/widgets/arrow_back.dart';
import 'package:salamaty/core/widgets/custom_screen_title.dart';
import 'package:salamaty/features/insurance_profile/presentation/cubit/insurance_profile_cubit.dart';
import 'package:salamaty/features/insurance_profile/presentation/view/widgets/coverage_benefits_section.dart';
import 'package:salamaty/features/insurance_profile/presentation/view/widgets/insurance_provider_card.dart';
import 'package:salamaty/features/insurance_profile/presentation/view/widgets/user_info_card.dart';
import 'package:salamaty/features/select_insurance/presentation/view/insurance_screen.dart';
import 'package:salamaty/generated/l10n.dart';

class InsuranceProfileBody extends StatelessWidget {
  const InsuranceProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InsuranceProfileCubit, InsuranceProfileState>(
      builder: (context, state) {
        if (state is InsuranceProfileLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is InsuranceProfileNoInsurance) {
          return _NoInsuranceView();
        }

        if (state is InsuranceProfileError) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.error_outline, color: Colors.red, size: 48),
                const SizedBox(height: 12),
                Text(state.message),
                const SizedBox(height: 8),
                TextButton(
                  onPressed: () =>
                      context.read<InsuranceProfileCubit>().loadProfile(),
                  child: Text(S.of(context).retry),
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
                CustomScreenTitle(title: S.of(context).insuranceProfile),
                const SizedBox(height: 30),
                UserInfoCard(profile: profile),
                const SizedBox(height: 16),
                InsuranceProviderCard(provider: profile.provider),
                const SizedBox(height: 16),
                CoverageBenefitsSection(coverage: profile.coverage),
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

class _NoInsuranceView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          const SizedBox(height: 60),
          const ArrowBack(),
          CustomScreenTitle(title: S.of(context).insuranceProfile),
          const Spacer(),
          Container(
            width: 90,
            height: 90,
            decoration: BoxDecoration(
              color: AppColors.primaryColor.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.shield_outlined,
              size: 42,
              color: AppColors.primaryColor,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            S.of(context).noInsuranceSelected,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            S.of(context).selectInsuranceSubtitle,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: Color(0xFF989898),
              height: 1.6,
            ),
          ),
          const Spacer(),
          SizedBox(
            width: double.infinity,
            height: 54,
            child: ElevatedButton.icon(
              // onPressed: () {
              //   Navigator.pushNamed(context, InsuranceScreen.routeName);
              // },
              onPressed: () {
                Navigator.pushNamed(context, InsuranceScreen.routeName)
                    .then((_) {
                  context.read<InsuranceProfileCubit>().loadProfile();
                });
              },
              icon: const Icon(Icons.add, color: Colors.white),
              label: Text(
                // 'Select insurance plan',
                S.of(context).selectInsurancePlan,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
          ),
          const SizedBox(height: 50),
        ],
      ),
    );
  }
}
