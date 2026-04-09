import 'package:flutter/material.dart';
import 'package:salamaty/features/drug_store/data/models/drug_store_model.dart';
import 'package:salamaty/features/medicine/presentation/view/medicine_details_screen.dart';
import 'medicine_card.dart';

class MedicineList extends StatelessWidget {
  final List<DrugStoreProduct> products;

  const MedicineList({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    if (products.isEmpty) {
      return const Center(child: Text('No products found'));
    }
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 14,
        crossAxisSpacing: 8,
        childAspectRatio: 0.75,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];

        return MedicineCard(
          imageUrl: Uri.encodeFull(product.imageUrl),
          name: product.name,
          price: 'Rp${product.price.toStringAsFixed(0)}',
          onFindPharmacy: () {},
          onTap: () {
            Navigator.pushNamed(
              context,
              MedicineDetailsScreen.routeName,
              arguments: product.id,
            );
          },
        );
      },
    );
  }
}
