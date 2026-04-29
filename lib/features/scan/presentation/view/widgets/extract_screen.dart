import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:salamaty/core/widgets/arrow_back.dart';
import 'package:salamaty/core/widgets/custom_screen_title.dart';
import 'package:salamaty/core/widgets/large_app_button.dart';
import 'package:salamaty/features/detected_medicines/data/repo/detected_medicine_repo.dart';
import 'package:salamaty/features/detected_medicines/presentation/cubit/detected_medicine_cubit.dart';
import 'package:salamaty/features/detected_medicines/presentation/cubit/detected_medicine_state.dart';
import 'package:salamaty/features/detected_medicines/presentation/view/detected_medicine_screen.dart';
import 'package:salamaty/generated/l10n.dart';

class ExtractScreen extends StatelessWidget {
  final File imageFile;

  const ExtractScreen({super.key, required this.imageFile});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => DetectedMedicineCubit(DetectedMedicineRepo()),
      child: Scaffold(
        body: BlocListener<DetectedMedicineCubit, DetectedMedicineState>(
          listener: (context, state) {
            if (state is DetectedMedicineSuccess) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => DetectedMedicineScreen(data: state.data),
                ),
              );
            }
          },
          child: BlocBuilder<DetectedMedicineCubit, DetectedMedicineState>(
            builder: (context, state) {
              final cubit = context.read<DetectedMedicineCubit>();

              return Column(
                children: [
                  const SizedBox(height: 50),
                  const ArrowBack(),
                  const SizedBox(height: 15),
                  CustomScreenTitle(
                    title: S.of(context).analyzePrescription,
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 20),
                          width: double.infinity,
                          height: 260,
                          clipBehavior: Clip.antiAlias,
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                width: 1,
                                color: Colors.black.withAlpha(54),
                              ),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            shadows: const [
                              BoxShadow(
                                color: Color(0x3F000000),
                                blurRadius: 4,
                                offset: Offset(0, 4),
                              )
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(30),
                            child: Image.file(
                              imageFile,
                              width: double.infinity,
                              height: 260,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        if (state is DetectedMedicineLoading)
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 20),
                            width: double.infinity,
                            height: 260,
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Center(
                              child: Lottie.asset(
                                'assets/animations/loading.json',
                                width: 120,
                                height: 120,
                                repeat: true,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  // if (state is! DetectedMedicineLoading)
                  //   LargeAppButton(
                  //     text: S.of(context).viewDetectedMedicines,
                  //     onPressed: () {
                  //       cubit.scan(
                  //         image: imageFile,
                  //         userId: "1",
                  //       );
                  //     },
                  //   ),
                  LargeAppButton(
                    text: S.of(context).viewDetectedMedicines,
                    onPressed: state is DetectedMedicineLoading
                        ? null
                        : () {
                            cubit.scan(
                              image: imageFile,
                              userId: "1",
                            );
                          },
                  ),

                  const SizedBox(height: 30),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
