import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salamaty/core/widgets/app_snackbar.dart';
import 'package:salamaty/core/widgets/custom_screen_subtitle.dart';
import 'package:salamaty/core/widgets/custom_screen_title.dart';
import 'package:salamaty/core/widgets/large_app_button.dart';
import 'package:salamaty/features/insurance_information/presentation/view/insurance_information_screen.dart';
import 'package:salamaty/features/select_insurance/presentation/cubit/select_insurance_cubit.dart';
import 'package:salamaty/features/select_insurance/presentation/view/widgets/insurance_card.dart';

class InsuranceScreenBody extends StatefulWidget {
  const InsuranceScreenBody({super.key});

  @override
  State<InsuranceScreenBody> createState() => _InsuranceScreenBodyState();
}

class _InsuranceScreenBodyState extends State<InsuranceScreenBody> {
  @override
  void initState() {
    super.initState();
    context.read<InsuranceCubit>().fetchProviders();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InsuranceCubit, InsuranceState>(
      builder: (context, state) {
        return Column(
          children: [
            const SizedBox(height: 90),
            const CustomScreenTitle(title: 'Select Insurance'),
            const CustomScreenSubtitle(
              subtitleText: 'Select your insurance to view covered services.',
            ),
            const SizedBox(height: 30),
            Expanded(child: _buildBody(context, state)),
            if (state is InsuranceLoaded)
              LargeAppButton(
                text: 'Continue',
                onPressed: () {
                  if (state.selectedProvider == null) {
                    AppSnackBar.show(
                      context,
                      message: 'Please select an insurance provider',
                      type: SnackBarType.info,
                    );
                    return;
                  }
                  // بنبعت الـ provider كـ arguments
                  Navigator.pushNamed(
                    context,
                    InsuranceInformationScreen.routeName,
                    arguments: state.selectedProvider,
                  );
                },
              ),
            const SizedBox(height: 50),
          ],
        );
      },
    );
  }

  Widget _buildBody(BuildContext context, InsuranceState state) {
    if (state is InsuranceLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (state is InsuranceError) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, color: Colors.red, size: 48),
            const SizedBox(height: 12),
            const Text('Failed to load providers',
                style:
                    TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            TextButton(
              onPressed: () =>
                  context.read<InsuranceCubit>().fetchProviders(),
              child: const Text('Retry'),
            ),
          ],
        ),
      );
    }

    if (state is InsuranceLoaded) {
      return ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: state.providers.length,
        itemBuilder: (context, index) {
          final provider = state.providers[index];
          return InsuranceCard(
            name: provider.name,
            imageUrl: provider.logoUrl ?? '',
            selected: state.selectedProvider?.id == provider.id,
            onTap: () =>
                context.read<InsuranceCubit>().selectProvider(provider),
          );
        },
      );
    }

    return const SizedBox();
  }
}