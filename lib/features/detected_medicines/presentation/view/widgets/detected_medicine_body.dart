import 'package:flutter/material.dart';
import 'package:salamaty/core/utils/app_text_styles.dart';
import 'package:salamaty/core/widgets/arrow_back.dart';
import 'package:salamaty/features/detected_medicines/presentation/view/widgets/available_section.dart';
import 'package:salamaty/features/detected_medicines/presentation/view/widgets/detected_section.dart';
import 'package:salamaty/features/detected_medicines/presentation/view/widgets/not_available_section.dart';
import 'package:salamaty/features/scan/presentation/view/scan_screen.dart';

class DetectedMedicineBody extends StatelessWidget {
  final dynamic data;

  const DetectedMedicineBody({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final extracted = data.extractedMedicines;
    final available = data.availableMedicines;
    final notAvailable = data.notAvailableMedicines;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          const SizedBox(height: 40),
          const ArrowBack(),
          // Text(
          //   'Detected Medicines',
          //   style: AppTextStyles.semiBold24.copyWith(
          //     color: const Color(0xFF0D2D9E),
          //   ),
          // ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Detected Medicines',
              style: AppTextStyles.semiBold24.copyWith(
                color: const Color(0xFF0D2D9E),
              ),
            ),
          ),
          SizedBox(
            height: 16,
          ),
          DetectedSection(extracted: extracted),

          AvailableSection(
            available: available
                .map((e) => {
                      "id": e.id,
                      "name": e.name,
                      "price": e.price,
                      "imageUrl": e.imageUrl
                          ?.replaceFirst(
                            'https://localhost:7140',
                            'http://salamaty.runasp.net',
                          )
                          .toString(),
                    })
                .toList(),
          ),

          NotAvailableSection(
            notAvailable: notAvailable.map((e) => {"name": e.name}).toList(),
          ),

          // Scan Again Button
          SizedBox(
            width: double.infinity,
            height: 56,
            child: ElevatedButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, ScanScreen.routeName);
              },
              icon: const Icon(
                Icons.document_scanner_outlined,
                size: 24,
              ),
              label: const Text(
                "Scan Again",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF0D2D9E),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                elevation: 0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
