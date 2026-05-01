// import 'package:flutter/material.dart';
// import 'package:salamaty/core/widgets/arrow_back.dart';
// import 'package:salamaty/core/widgets/custom_screen_subtitle.dart';
// import 'package:salamaty/core/widgets/custom_screen_title.dart';
// import 'package:salamaty/core/widgets/custom_text_field_label.dart';
// import 'package:salamaty/features/facilities/presentation/view/widgets/facilities_list.dart';
// import 'package:salamaty/features/facilities/presentation/view/widgets/filter_tabs.dart';

// class InsuranceServicesScreenBody extends StatefulWidget {
//   const InsuranceServicesScreenBody({super.key});

//   @override
//   State<InsuranceServicesScreenBody> createState() =>
//       _InsuranceServicesScreenBodyState();
// }

// int selectedIndex = 0;

// class _InsuranceServicesScreenBodyState
//     extends State<InsuranceServicesScreenBody> {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         SizedBox(
//           height: 40,
//         ),
//         ArrowBack(),
//         CustomScreenTitle(title: 'Insurance Services'),
//         CustomScreenSubtitle(
//           subtitleText: 'A list of medicines marked as favorites by the user.',
//         ),
//         SizedBox(height: 12),
//         SizedBox(height: 10),
//         CustomTextFieldLabel(labelText: 'Nearby Services'),
//         SizedBox(height: 10),
//         FilterTabs(
//           filters: ['All', 'Labs', 'Hospitals', 'Pharmacies'],
//           selectedIndex: selectedIndex,
//           onChanged: (index) {
//             setState(() {
//               selectedIndex = index;
//             });
//           },
//         ),
//         Expanded(child: FacilitiesList()),
//       ],
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salamaty/core/widgets/arrow_back.dart';
import 'package:salamaty/core/widgets/custom_screen_subtitle.dart';
import 'package:salamaty/core/widgets/custom_screen_title.dart';
import 'package:salamaty/core/widgets/custom_text_field_label.dart';
import 'package:salamaty/features/insurance_services/presentation/cubit/insurance_services_cubit.dart';
import 'package:salamaty/features/insurance_services/presentation/view/widgets/nearby_service_card.dart';
import 'package:salamaty/features/facilities/presentation/view/widgets/filter_tabs.dart';

class InsuranceServicesScreenBody extends StatefulWidget {
  const InsuranceServicesScreenBody({super.key});

  @override
  State<InsuranceServicesScreenBody> createState() =>
      _InsuranceServicesScreenBodyState();
}

class _InsuranceServicesScreenBodyState
    extends State<InsuranceServicesScreenBody> {
  final List<String> _filters = ['All', 'Labs', 'Hospitals', 'Pharmacies'];
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    context.read<InsuranceServicesCubit>().fetchServices();
  }

  String _filterLabel(int index) {
    // API expects: All, Lab, Hospital, Pharmacy
    const map = {
      'All': 'All',
      'Labs': 'Lab',
      'Hospitals': 'Hospital',
      'Pharmacies': 'Pharmacy',
    };
    return map[_filters[index]] ?? 'All';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 40),
        const ArrowBack(),
        const CustomScreenTitle(title: 'Insurance Services'),
        const CustomScreenSubtitle(
          subtitleText:
              'A list of medicines marked as favorites by the user.',
        ),
        const SizedBox(height: 12),
        const CustomTextFieldLabel(labelText: 'Nearby Services'),
        const SizedBox(height: 10),
        FilterTabs(
          filters: _filters,
          selectedIndex: _selectedIndex,
          onChanged: (index) {
            setState(() => _selectedIndex = index);
            context
                .read<InsuranceServicesCubit>()
                .filterByType(_filterLabel(index));
          },
        ),
        const SizedBox(height: 10),
        Expanded(child: _buildBody()),
      ],
    );
  }

  Widget _buildBody() {
    return BlocBuilder<InsuranceServicesCubit, InsuranceServicesState>(
      builder: (context, state) {
        if (state is InsuranceServicesLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is InsuranceServicesError) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.error_outline, color: Colors.red, size: 48),
                const SizedBox(height: 12),
                Text(state.message),
                TextButton(
                  onPressed: () => context
                      .read<InsuranceServicesCubit>()
                      .fetchServices(),
                  child: const Text('Retry'),
                ),
              ],
            ),
          );
        }
        if (state is InsuranceServicesLoaded) {
          if (state.services.isEmpty) {
            return const Center(child: Text('No nearby services found.'));
          }
          return ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: state.services.length,
            itemBuilder: (context, index) =>
                NearbyServiceCard(service: state.services[index]),
          );
        }
        return const SizedBox();
      },
    );
  }
}