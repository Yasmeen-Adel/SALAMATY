import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salamaty/core/widgets/custom_text_field_label.dart';
import 'package:salamaty/features/drug_store/data/repo/drug_store_repo.dart';
import 'package:salamaty/features/drug_store/presentation/cubit/drug_store_cubit.dart';
import 'package:salamaty/features/drug_store/presentation/cubit/drug_store_state.dart';
import 'package:salamaty/features/drug_store/presentation/view/widgets/drug_store_header.dart';
import 'package:salamaty/features/drug_store/presentation/view/widgets/medicine_list.dart';
import 'package:salamaty/features/facilities/presentation/view/widgets/filter_tabs.dart';
import 'package:salamaty/generated/l10n.dart';

class DrugStoreScreenBody extends StatelessWidget {
  const DrugStoreScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => DrugStoreCubit(DrugStoreRepo())..fetchProducts(),
      child: const _DrugStoreView(),
    );
  }
}

class _DrugStoreView extends StatefulWidget {
  const _DrugStoreView();

  @override
  State<_DrugStoreView> createState() => _DrugStoreViewState();
}

class _DrugStoreViewState extends State<_DrugStoreView> {
  int selectedIndex = 0;

  final List<String> medicineCategories = [
    'All',
    'General',
    'Antibiotics',
    'Neurology',
    'Gastrointestinal',
    'Cardiovascular',
    'Cardiology',
    'Endocrine',
    'Diabetes',
    'Immunology',
    'Rheumatology',
    'Oncology',
    'Infectious Diseases',
    'Emergency',
    'Obstetrics',
    'Bone & Joint',
    'General',
    'Psychiatry',
    'Respiratory & Allergy',
    'Pain Relief',
  ];

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<DrugStoreCubit>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Header + Search
        DrugStoreHeader(
          onSearch: (query) => cubit.changeSearch(query),
        ),

        const SizedBox(height: 12),

         CustomTextFieldLabel(labelText:S.of(context).filterBy),

        const SizedBox(height: 6),

        /// Filter Tabs
        FilterTabs(
          filters: medicineCategories,
          selectedIndex: selectedIndex,
          onChanged: (index) {
            setState(() => selectedIndex = index);
            cubit.changeCategory(medicineCategories[index]);
          },
        ),

        const SizedBox(height: 12),

        /// Products Grid
        Expanded(
          child: BlocBuilder<DrugStoreCubit, DrugStoreState>(
            builder: (context, state) {
              if (state is DrugStoreLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (state is DrugStoreFailure) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.error_outline,
                          color: Colors.red, size: 48),
                      const SizedBox(height: 12),
                      Text(
                        state.error,
                        textAlign: TextAlign.center,
                        style: const TextStyle(color: Colors.red),
                      ),
                      const SizedBox(height: 12),
                      ElevatedButton(
                        onPressed: () => cubit.fetchProducts(),
                        child: const Text('Try Again'),
                      ),
                    ],
                  ),
                );
              }

              if (state is DrugStoreSuccess) {
                return MedicineList(products: state.products);
              }

              return const SizedBox();
            },
          ),
        ),
      ],
    );
  }
}
