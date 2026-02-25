import 'package:flutter/material.dart';
import 'package:salamaty/features/medicine_alternatives/presentation/view/medicine_alternatives_screen.dart';

class MedicineActionsSection extends StatefulWidget {
  const MedicineActionsSection({super.key});

  @override
  State<MedicineActionsSection> createState() => _MedicineActionsSectionState();
}

class _MedicineActionsSectionState extends State<MedicineActionsSection> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Row(
            children: [
              // Favorite Icon Button
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: isFavorite ? Colors.red : const Color(0xFF0D2D9E),
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  icon: Icon(
                    isFavorite
                        ? Icons.favorite_rounded
                        : Icons.favorite_border_rounded,
                    color: Colors.white,
                    size: 26,
                  ),
                  onPressed: () {
                    setState(() {
                      isFavorite = !isFavorite;
                    });
                  },
                ),
              ),
              const SizedBox(width: 10),
              // See Alternatives Button
              Expanded(
                child: SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF0D2D9E),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, MedicineAlternativesScreen.routeName);
                    },
                    child: Text(
                      'See Alternatives',
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
