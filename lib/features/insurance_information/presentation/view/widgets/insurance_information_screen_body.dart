// // // import 'package:flutter/material.dart';
// // // import 'package:salamaty/core/widgets/arrow_back.dart';
// // // import 'package:salamaty/core/widgets/custom_screen_title.dart';
// // // import 'package:salamaty/core/widgets/custom_text_field_label.dart';
// // // import 'package:salamaty/core/widgets/large_app_button.dart';
// // // import 'package:salamaty/features/insurance_information/presentation/view/widgets/image_upload_card.dart';
// // // import 'package:salamaty/features/insurance_information/presentation/view/widgets/text_input.dart';
// // // import 'package:salamaty/features/insurance_services/presentation/view/insurance_services_screen.dart';

// // // class InsuranceInformationScreenBody extends StatelessWidget {
// // //   const InsuranceInformationScreenBody({super.key});

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return SingleChildScrollView(
// // //       padding: const EdgeInsets.only(top: 60),
// // //       child: Column(
// // //         children: [
// // //           ArrowBack(),
// // //           CustomScreenTitle(title: 'Insurance Information'),
// // //           SizedBox(
// // //             height: 24,
// // //           ),
// // //           CustomTextFieldLabel(labelText: 'Write Your Insurance ID Number'),
// // //           TextInput(
// // //             hintText: 'Insurance ID Number',
// // //             isPassword: true,
// // //           ),
// // //           SizedBox(
// // //             height: 24,
// // //           ),
// // //           CustomTextFieldLabel(labelText: 'Upload Your Insurance photos'),
// // //           const ImageUploadCard(
// // //             title: 'Insurance Card Front',
// // //             description: 'Upload the front side of your Insurance Card.',
// // //           ),
// // //           const ImageUploadCard(
// // //             title: 'Insurance Card Back',
// // //             description: 'Upload the back side of your Insurance Card.',
// // //           ),
// // //           SizedBox(
// // //             height: 32,
// // //           ),
// // //           LargeAppButton(
// // //               text: 'Submit',
// // //               onPressed: () {
// // //                 Navigator.pushNamed(context, InsuranceServicesScreen.routeName);
// // //               }),
// // //         ],
// // //       ),
// // //     );
// // //   }
// // // }

// // import 'package:flutter/material.dart';
// // import 'package:flutter_bloc/flutter_bloc.dart';
// // import 'package:salamaty/core/widgets/arrow_back.dart';
// // import 'package:salamaty/core/widgets/custom_screen_title.dart';
// // import 'package:salamaty/core/widgets/custom_text_field_label.dart';
// // import 'package:salamaty/core/widgets/large_app_button.dart';
// // import 'package:salamaty/features/insurance_information/presentation/cubit/insurance_information_cubit.dart';
// // import 'package:salamaty/features/insurance_information/presentation/view/widgets/image_upload_card.dart';
// // import 'package:salamaty/features/insurance_information/presentation/view/widgets/text_input.dart';
// // import 'package:salamaty/features/insurance_services/presentation/view/insurance_services_screen.dart';
// // import 'package:salamaty/features/select_insurance/data/models/select_insurance_provider.dart';

// // class InsuranceInformationScreenBody extends StatefulWidget {
// //   final InsuranceProvider selectedProvider;

// //   const InsuranceInformationScreenBody({
// //     super.key,
// //     required this.selectedProvider,
// //   });

// //   @override
// //   State<InsuranceInformationScreenBody> createState() =>
// //       _InsuranceInformationScreenBodyState();
// // }

// // class _InsuranceInformationScreenBodyState
// //     extends State<InsuranceInformationScreenBody> {
// //   final TextEditingController _cardHolderIdController = TextEditingController();

// //   // TODO: استبدل بال userId الحقيقي من SharedPreferences أو AuthCubit
// //   static const String _userId = '948f6f27-86b5-4545-864d-180c105632eb';

// //   @override
// //   void dispose() {
// //     _cardHolderIdController.dispose();
// //     super.dispose();
// //   }

// //   void _submit(BuildContext context) {
// //     final cardHolderId = _cardHolderIdController.text.trim();
// //     if (cardHolderId.isEmpty) {
// //       ScaffoldMessenger.of(context).showSnackBar(
// //         const SnackBar(content: Text('Please enter your Insurance ID')),
// //       );
// //       return;
// //     }

// //     context.read<InsuranceInformationCubit>().submit(
// //           userId: _userId,
// //           providerId: widget.selectedProvider.id,
// //           cardHolderId: cardHolderId,
// //         );
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return BlocListener<InsuranceInformationCubit, InsuranceInformationState>(
// //       listener: (context, state) {
// //         if (state is InsuranceInformationSuccess) {
// //           Navigator.pushNamed(
// //             context,
// //             InsuranceServicesScreen.routeName,
// //             arguments: widget.selectedProvider.id,
// //           );
// //         } else if (state is InsuranceInformationError) {
// //           ScaffoldMessenger.of(context).showSnackBar(
// //             SnackBar(content: Text(state.message)),
// //           );
// //         }
// //       },
// //       child: BlocBuilder<InsuranceInformationCubit, InsuranceInformationState>(
// //         builder: (context, state) {
// //           final isLoading = state is InsuranceInformationLoading;
// //           return SingleChildScrollView(
// //             padding: const EdgeInsets.only(top: 60),
// //             child: Column(
// //               children: [
// //                 const ArrowBack(),
// //                 const CustomScreenTitle(title: 'Insurance Information'),
// //                 const SizedBox(height: 24),
// //                 CustomTextFieldLabel(
// //                     labelText: 'Write Your Insurance ID Number'),
// //                 TextInput(
// //                   controller: _cardHolderIdController,
// //                   hintText: 'Insurance ID Number',
// //                   isPassword: false,
// //                 ),
// //                 const SizedBox(height: 24),
// //                 CustomTextFieldLabel(labelText: 'Upload Your Insurance photos'),
// //                 ImageUploadCard(
// //                   title: 'Insurance Card Front',
// //                   description:
// //                       'Upload the front side of your Insurance Card.',
// //                   onImagePicked: (file) =>
// //                       context
// //                           .read<InsuranceInformationCubit>()
// //                           .setFrontImage(file),
// //                 ),
// //                 ImageUploadCard(
// //                   title: 'Insurance Card Back',
// //                   description:
// //                       'Upload the back side of your Insurance Card.',
// //                   onImagePicked: (file) =>
// //                       context
// //                           .read<InsuranceInformationCubit>()
// //                           .setBackImage(file),
// //                 ),
// //                 const SizedBox(height: 32),
// //                 isLoading
// //                     ? const CircularProgressIndicator()
// //                     : LargeAppButton(
// //                         text: 'Submit',
// //                         onPressed: () => _submit(context),
// //                       ),
// //                 const SizedBox(height: 32),
// //               ],
// //             ),
// //           );
// //         },
// //       ),
// //     );
// //   }
// // }

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:salamaty/core/widgets/arrow_back.dart';
// import 'package:salamaty/core/widgets/custom_screen_title.dart';
// import 'package:salamaty/core/widgets/custom_text_field_label.dart';
// import 'package:salamaty/core/widgets/large_app_button.dart';
// import 'package:salamaty/features/insurance_information/presentation/cubit/insurance_information_cubit.dart';
// import 'package:salamaty/features/insurance_information/presentation/view/widgets/image_upload_card.dart';
// import 'package:salamaty/features/insurance_information/presentation/view/widgets/text_input.dart';
// // import 'package:salamaty/features/insurance_profile/presentation/view/insurance_profile_screen.dart';
// import 'package:salamaty/features/select_insurance/data/models/select_insurance_provider.dart';
// import 'package:salamaty/features/insurance_services/presentation/view/insurance_services_screen.dart';
// class InsuranceInformationScreenBody extends StatefulWidget {
//   final InsuranceProvider selectedProvider;

//   const InsuranceInformationScreenBody({
//     super.key,
//     required this.selectedProvider,
//   });

//   @override
//   State<InsuranceInformationScreenBody> createState() =>
//       _InsuranceInformationScreenBodyState();
// }

// class _InsuranceInformationScreenBodyState
//     extends State<InsuranceInformationScreenBody> {
//   final TextEditingController _cardHolderIdController = TextEditingController();

//   static const String _userId = '948f6f27-86b5-4545-864d-180c105632eb';

//   @override
//   void dispose() {
//     _cardHolderIdController.dispose();
//     super.dispose();
//   }

//   void _submit(BuildContext context) {
//     final cardHolderId = _cardHolderIdController.text.trim();
//     if (cardHolderId.isEmpty) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Please enter your Insurance ID')),
//       );
//       return;
//     }

//     context.read<InsuranceInformationCubit>().submit(
//           userId: _userId,
//           providerId: widget.selectedProvider.id,
//           cardHolderId: cardHolderId,
//         );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocListener<InsuranceInformationCubit, InsuranceInformationState>(
//       listener: (context, state) {
//         if (state is InsuranceInformationSuccess) {
//           Navigator.pushNamed(
//             context,
//             InsuranceServicesScreen.routeName,
//     arguments: widget.selectedProvider.id,
//           );
//         } else if (state is InsuranceInformationError) {
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(content: Text(state.message)),
//           );
//         }
//       },
//       child: BlocBuilder<InsuranceInformationCubit, InsuranceInformationState>(
//         builder: (context, state) {
//           final isLoading = state is InsuranceInformationLoading;
//           return SingleChildScrollView(
//             padding: const EdgeInsets.only(top: 60),
//             child: Column(
//               children: [
//                 const ArrowBack(),
//                 const CustomScreenTitle(title: 'Insurance Information'),
//                 const SizedBox(height: 24),
//                 CustomTextFieldLabel(
//                     labelText: 'Write Your Insurance ID Number'),
//                 TextInput(
//                   controller: _cardHolderIdController,
//                   hintText: 'Insurance ID Number',
//                   isPassword: false,
//                 ),
//                 const SizedBox(height: 24),
//                 CustomTextFieldLabel(labelText: 'Upload Your Insurance photos'),
//                 ImageUploadCard(
//                   title: 'Insurance Card Front',
//                   description: 'Upload the front side of your Insurance Card.',
//                   onImagePicked: (file) => context
//                       .read<InsuranceInformationCubit>()
//                       .setFrontImage(file),
//                 ),
//                 ImageUploadCard(
//                   title: 'Insurance Card Back',
//                   description: 'Upload the back side of your Insurance Card.',
//                   onImagePicked: (file) => context
//                       .read<InsuranceInformationCubit>()
//                       .setBackImage(file),
//                 ),
//                 const SizedBox(height: 32),
//                 isLoading
//                     ? const CircularProgressIndicator()
//                     : LargeAppButton(
//                         text: 'Submit',
//                         onPressed: () => _submit(context),
//                       ),
//                 const SizedBox(height: 32),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }


// lib\features\insurance_information\presentation\view\widgets\insurance_information_screen_body.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salamaty/core/widgets/arrow_back.dart';
import 'package:salamaty/core/widgets/custom_screen_title.dart';
import 'package:salamaty/core/widgets/custom_text_field_label.dart';
import 'package:salamaty/core/widgets/large_app_button.dart';
import 'package:salamaty/features/insurance_information/presentation/cubit/insurance_information_cubit.dart';
import 'package:salamaty/features/insurance_information/presentation/view/widgets/image_upload_card.dart';
import 'package:salamaty/features/insurance_information/presentation/view/widgets/text_input.dart';
import 'package:salamaty/features/select_insurance/data/models/select_insurance_provider.dart';
import 'package:salamaty/features/insurance_services/presentation/view/insurance_services_screen.dart';

class InsuranceInformationScreenBody extends StatefulWidget {
  final InsuranceProvider selectedProvider;

  const InsuranceInformationScreenBody({
    super.key,
    required this.selectedProvider,
  });

  @override
  State<InsuranceInformationScreenBody> createState() =>
      _InsuranceInformationScreenBodyState();
}

class _InsuranceInformationScreenBodyState
    extends State<InsuranceInformationScreenBody> {
  final TextEditingController _cardHolderIdController = TextEditingController();
  final TextEditingController _holderNameController = TextEditingController();

  static const String _userId = '948f6f27-86b5-4545-864d-180c105632eb';

  @override
  void dispose() {
    _cardHolderIdController.dispose();
    _holderNameController.dispose();
    super.dispose();
  }

  void _submit(BuildContext context) {
    final cardHolderId = _cardHolderIdController.text.trim();
    if (cardHolderId.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter your Insurance ID')),
      );
      return;
    }

    context.read<InsuranceInformationCubit>().submit(
          userId: _userId,
          cardHolderId: cardHolderId,
          holderName: _holderNameController.text.trim(),
        );
  }

  /// Auto-fill controllers when scan returns data
  void _applyAutoFill(InsuranceInformationImagesUpdated state) {
    if (state.autoFilledId != null && state.autoFilledId!.isNotEmpty) {
      _cardHolderIdController.text = state.autoFilledId!;
    }
    if (state.autoFilledHolderName != null &&
        state.autoFilledHolderName!.isNotEmpty) {
      _holderNameController.text = state.autoFilledHolderName!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<InsuranceInformationCubit, InsuranceInformationState>(
      listener: (context, state) {
        if (state is InsuranceInformationImagesUpdated) {
          _applyAutoFill(state);
        } else if (state is InsuranceInformationSuccess) {
          Navigator.pushNamed(
            context,
            InsuranceServicesScreen.routeName,
            arguments: widget.selectedProvider.id,
          );
        } else if (state is InsuranceInformationError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        }
      },
      child: BlocBuilder<InsuranceInformationCubit, InsuranceInformationState>(
        builder: (context, state) {
          final isLoading = state is InsuranceInformationLoading;
          final isScanning = state is InsuranceInformationScanLoading;

          return SingleChildScrollView(
            padding: const EdgeInsets.only(top: 60),
            child: Column(
              children: [
                const ArrowBack(),
                const CustomScreenTitle(title: 'Insurance Information'),
                const SizedBox(height: 24),

                // ── Insurance ID ──────────────────────────────────────────
                CustomTextFieldLabel(
                    labelText: 'Write Your Insurance ID Number'),
                TextInput(
                  controller: _cardHolderIdController,
                  hintText: 'Insurance ID Number',
                  isPassword: false,
                ),
                const SizedBox(height: 16),

                // ── Holder Name ───────────────────────────────────────────
                CustomTextFieldLabel(labelText: 'Card Holder Name'),
                TextInput(
                  controller: _holderNameController,
                  hintText: 'Card Holder Name',
                  isPassword: false,
                ),
                const SizedBox(height: 24),

                // ── Upload Photos ─────────────────────────────────────────
                CustomTextFieldLabel(labelText: 'Upload Your Insurance photos'),

                // Scanning indicator overlay
                if (isScanning)
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 8),
                    child: Row(
                      children: const [
                        SizedBox(
                          width: 16,
                          height: 16,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        ),
                        SizedBox(width: 8),
                        Text(
                          'Scanning card...',
                          style: TextStyle(
                            color: Color(0xFF0D2D9E),
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),

                ImageUploadCard(
                  title: 'Insurance Card Front',
                  description: 'Upload the front side of your Insurance Card.',
                  onImagePicked: (file) => context
                      .read<InsuranceInformationCubit>()
                      .setFrontImage(file),
                ),
                ImageUploadCard(
                  title: 'Insurance Card Back',
                  description: 'Upload the back side of your Insurance Card.',
                  onImagePicked: (file) => context
                      .read<InsuranceInformationCubit>()
                      .setBackImage(file),
                ),
                const SizedBox(height: 32),

                isLoading
                    ? const CircularProgressIndicator()
                    : LargeAppButton(
                        text: 'Submit',
                        onPressed: () => _submit(context),
                      ),
                const SizedBox(height: 32),
              ],
            ),
          );
        },
      ),
    );
  }
}