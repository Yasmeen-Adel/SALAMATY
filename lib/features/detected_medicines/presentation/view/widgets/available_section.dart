import 'package:flutter/material.dart';
import 'package:salamaty/features/medicine/presentation/view/medicine_details_screen.dart';
import 'package:salamaty/generated/l10n.dart';
import 'detected_medicine_item.dart';

class AvailableSection extends StatelessWidget {
  final List<dynamic> available;

  const AvailableSection({super.key, required this.available});

  @override
  Widget build(BuildContext context) {
    if (available.isEmpty) return const SizedBox();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              // "Available Medicines",
              S.of(context).availableMedicines,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF0D2D9E),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: const Color(0xFFE8F5E9),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                // "IN STOCK",
                S.of(context).inStock,
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2E7D32),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        ListView.builder(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: available.length,
          itemBuilder: (context, index) {
            final item = available[index];
            return DetectedMedicineItem(
              title: item['name'] ?? '',
              description: "${item['price']} EGP",
              image: item['imageUrl'] ?? '',
              isNetworkImage: true,
              onTap: () {
                final id = item['id'];
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => MedicineDetailsScreen(productId: id),
                  ),
                );
              },
            );
          },
        ),
      ],
    );
  }
}
