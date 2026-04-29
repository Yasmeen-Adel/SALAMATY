import 'package:flutter/material.dart';
import 'package:salamaty/core/utils/app_text_styles.dart';
import 'package:salamaty/core/widgets/arrow_back.dart';
import 'package:salamaty/features/detected_medicines/presentation/view/widgets/available_section.dart';
import 'package:salamaty/features/detected_medicines/presentation/view/widgets/detected_section.dart';
import 'package:salamaty/features/detected_medicines/presentation/view/widgets/not_available_section.dart';
import 'package:salamaty/features/scan/presentation/view/scan_screen.dart';
import 'package:salamaty/generated/l10n.dart';

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
          const SizedBox(height: 20),
          const ArrowBack(),

          Align(
            alignment: AlignmentDirectional.centerStart,
            child: Text(
              // 'Detected Medicines',
              S.of(context).detectedMedicines,
              style: AppTextStyles.semiBold24.copyWith(
                color: const Color(0xFF0D2D9E),
              ),
            ),
          ),
          SizedBox(
            height: 10,
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
          SizedBox(
            height: 12,
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
              label: Text(
                // "Scan Again",
                S.of(context).scanAgain,
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
