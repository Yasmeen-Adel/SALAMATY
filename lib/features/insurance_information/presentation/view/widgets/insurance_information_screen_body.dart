import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salamaty/core/services/auth_local_storage.dart';
import 'package:salamaty/core/widgets/app_snackbar.dart';
import 'package:salamaty/core/widgets/arrow_back.dart';
import 'package:salamaty/core/widgets/custom_screen_title.dart';
import 'package:salamaty/core/widgets/custom_text_field_label.dart';
import 'package:salamaty/core/widgets/large_app_button.dart';
import 'package:salamaty/core/widgets/main_screen.dart';
import 'package:salamaty/features/insurance_information/presentation/cubit/insurance_information_cubit.dart';
import 'package:salamaty/features/insurance_information/presentation/view/widgets/image_upload_card.dart';
import 'package:salamaty/features/select_insurance/data/models/select_insurance_provider.dart';
import 'package:salamaty/generated/l10n.dart';

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
  final _idController = TextEditingController();
  final _nameController = TextEditingController();

  String? _idError;
  String? _nameError;

  @override
  void dispose() {
    _idController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  bool _validate() {
    bool isValid = true;

    final id = _idController.text.trim();
    final name = _nameController.text.trim();

    if (id.isEmpty) {
      _idError = 'Insurance ID is required';
      isValid = false;
    } else if (!RegExp(r'^\d+$').hasMatch(id)) {
      _idError = 'ID must contain numbers only';
      isValid = false;
    } else if (id.length < 5 || id.length > 14) {
      _idError = 'ID must be between 5 and 14 digits';
      isValid = false;
    } else {
      _idError = null;
    }

    if (name.isEmpty) {
      _nameError = 'Full name is required';
      isValid = false;
    } else if (RegExp(r'\d').hasMatch(name)) {
      _nameError = 'Name must not contain numbers';
      isValid = false;
    } else {
      _nameError = null;
    }

    setState(() {});

    return isValid;
  }

  Future<void> _onSubmit() async {
    if (!_validate()) return;

    final cubit = context.read<InsuranceInformationCubit>();

    if (cubit.frontImage == null) {
      AppSnackBar.show(
        context,
        message: 'Please upload the Insurance Card image',
        type: SnackBarType.error,
      );
      return;
    }

    final userId = await AuthLocalStorage.getUserId() ?? '';

    await cubit.submitInfo(
      userId: userId,
      providerId: widget.selectedProvider.id,
      cardHolderId: _idController.text.trim(),
      fullName: _nameController.text.trim(),
      policyNumber: cubit.scannedPolicy,
      validUntil: cubit.scannedValidDate,
      status: cubit.scannedStatus,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<InsuranceInformationCubit, InsuranceInformationState>(
      listener: (context, state) async {
        if (state is InsuranceInformationScanMismatch) {
          AppSnackBar.show(
            context,
            message: state.message,
            type: SnackBarType.error,
          );
        } else if (state is InsuranceInformationScanSuccess) {
          final data = state.response;

          if (data.scannedId != null) {
            _idController.text = data.scannedId!;
          }
          if (data.scannedName != null) {
            _nameController.text = data.scannedName!;
          }

          AppSnackBar.show(
            context,
            message: state.response.message,
            type: SnackBarType.success,
          );
        } else if (state is InsuranceInformationSubmitSuccess) {
          // final prefs = await SharedPreferences.getInstance();

          // await prefs.setBool('has_insurance', true);

          // await prefs.setInt(
          //   'provider_id',
          //   widget.selectedProvider.id,
          // );
          await AuthLocalStorage.setHasInsurance(true);

          await AuthLocalStorage.saveProviderId(
            widget.selectedProvider.id,
          );

          if (!context.mounted) return;

          Navigator.pushNamedAndRemoveUntil(
            context,
            MainScreen.routeName,
            (route) => false,
            arguments: 3,
          );
        } else if (state is InsuranceInformationError) {
          AppSnackBar.show(
            context,
            message: state.message,
            type: SnackBarType.error,
          );
        } else if (state is InsuranceInformationMissingImages) {
          AppSnackBar.show(
            context,
            message: 'Please upload the Insurance Card image',
            type: SnackBarType.error,
          );
        }
      },
      child: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 60),
        child: Column(
          children: [
            const ArrowBack(),
            CustomScreenTitle(title: S.of(context).insuranceInformation),
            const SizedBox(height: 24),
            CustomTextFieldLabel(labelText: S.of(context).fullName),
            _buildNameField(),
            const SizedBox(height: 16),
            CustomTextFieldLabel(labelText: S.of(context).insuranceId),
            _buildIdField(),
            const SizedBox(height: 24),
            CustomTextFieldLabel(
                labelText: S.of(context).uploadInsurancePhotos),
            ImageUploadCard(
              title: S.of(context).insuranceCardFront,
              description: S.of(context).uploadFrontSide,
              providerId: widget.selectedProvider.id,
            ),
            const SizedBox(height: 32),
            BlocBuilder<InsuranceInformationCubit, InsuranceInformationState>(
              builder: (context, state) {
                final isLoading = state is InsuranceInformationSubmitLoading ||
                    state is InsuranceInformationScanLoading;

                return isLoading
                    ? const CircularProgressIndicator()
                    : LargeAppButton(
                        text: S.of(context).submit,
                        onPressed: _onSubmit,
                      );
              },
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildIdField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: TextFormField(
        controller: _idController,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          hintText: S.of(context).insuranceIdHint,
          errorText: _idError,
          filled: true,
          fillColor: const Color(0x33697DC3),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(24),
            borderSide: BorderSide.none,
          ),
        ),
        onChanged: (value) {
          final id = value.trim();

          if (id.isEmpty) {
            setState(() => _idError = 'Insurance ID is required');
          } else if (!RegExp(r'^\d+$').hasMatch(id)) {
            setState(() => _idError = 'ID must contain numbers only');
          } else if (id.length < 5 || id.length > 14) {
            setState(() => _idError = 'ID must be between 5 and 14 digits');
          } else {
            setState(() => _idError = null);
          }
        },
      ),
    );
  }

  Widget _buildNameField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: TextFormField(
        controller: _nameController,
        decoration: InputDecoration(
          hintText: S.of(context).fullNameHint,
          errorText: _nameError,
          filled: true,
          fillColor: const Color(0x33697DC3),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(24),
            borderSide: BorderSide.none,
          ),
        ),
        onChanged: (value) {
          final name = value.trim();

          if (name.isEmpty) {
            setState(() => _nameError = 'Full name is required');
          } else if (RegExp(r'\d').hasMatch(name)) {
            setState(() => _nameError = 'Name must not contain numbers');
          } else {
            setState(() => _nameError = null);
          }
        },
      ),
    );
  }
}
