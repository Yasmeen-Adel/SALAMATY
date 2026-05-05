// lib\features\insurance_information\presentation\view\widgets\insurance_information_screen_body.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salamaty/core/widgets/app_snackbar.dart';
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
  static const Color _primaryColor = Color(0xFF0D2D9E);

  String? _autoFilledPolicy;
  String? _autoFilledValidUntil;
  String? _autoFilledStatus;

  @override
  void dispose() {
    _cardHolderIdController.dispose();
    _holderNameController.dispose();
    super.dispose();
  }

  void _submit(BuildContext context) {
    final cardHolderId = _cardHolderIdController.text.trim();
    if (cardHolderId.isEmpty) {
      AppSnackBar.show(
        context,
        message: 'Please enter your Insurance ID',
        type: SnackBarType.error,
      );
      return;
    }

    context.read<InsuranceInformationCubit>().submit(
          userId: _userId,
          cardHolderId: cardHolderId,
          holderName: _holderNameController.text.trim(),
          policyNumber: _autoFilledPolicy,
          validUntil: _autoFilledValidUntil,
          status: _autoFilledStatus,
        );
  }

  void _applyAutoFill(InsuranceInformationImagesUpdated state) {
    if (state.autoFilledId != null && state.autoFilledId!.isNotEmpty) {
      _cardHolderIdController.text = state.autoFilledId!;
    }
    if (state.autoFilledHolderName != null &&
        state.autoFilledHolderName!.isNotEmpty) {
      _holderNameController.text = state.autoFilledHolderName!;
    }

    _autoFilledPolicy = state.autoFilledPolicy;
    _autoFilledValidUntil = state.autoFilledValidUntil;
    _autoFilledStatus = state.autoFilledStatus;

    if (state.scanSuccess != null && state.scanMessage != null) {
      AppSnackBar.show(
        context,
        message: state.scanMessage!,
        type: state.scanSuccess! ? SnackBarType.success : SnackBarType.error,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<InsuranceInformationCubit, InsuranceInformationState>(
      listener: (context, state) {
        if (state is InsuranceInformationImagesUpdated) {
          _applyAutoFill(state);
        } else if (state is InsuranceInformationSuccess) {
          // استخدم الـ navigator الخاص بالـ tab
          Navigator.of(context, rootNavigator: false).pushNamed(
            InsuranceServicesScreen.routeName,
            arguments: widget.selectedProvider.id,
          );
        } else if (state is InsuranceInformationError) {
          AppSnackBar.show(
            context,
            message: state.message,
            type: SnackBarType.error,
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
                CustomTextFieldLabel(
                    labelText: 'Write Your Insurance ID Number'),
                TextInput(
                  controller: _cardHolderIdController,
                  hintText: 'Insurance ID Number',
                  isPassword: false,
                ),
                const SizedBox(height: 16),
                CustomTextFieldLabel(labelText: 'Card Holder Name'),
                TextInput(
                  controller: _holderNameController,
                  hintText: 'Card Holder Name',
                  isPassword: false,
                ),
                const SizedBox(height: 24),
                CustomTextFieldLabel(labelText: 'Upload Your Insurance photos'),
                if (isScanning)
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Row(
                      children: const [
                        SizedBox(
                          width: 16,
                          height: 16,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: _primaryColor,
                          ),
                        ),
                        SizedBox(width: 8),
                        Text(
                          'Scanning card...',
                          style: TextStyle(
                            color: _primaryColor,
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
                    ? const CircularProgressIndicator(color: _primaryColor)
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
