import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salamaty/core/widgets/app_snackbar.dart';
import 'package:salamaty/core/widgets/arrow_back.dart';
import 'package:salamaty/core/widgets/custom_screen_title.dart';
import 'package:salamaty/core/widgets/large_app_button.dart';
import 'package:salamaty/features/edit_profile/presentation/cubit/edit_profile_cubit.dart';
import 'package:salamaty/features/edit_profile/presentation/cubit/edit_profile_state.dart';
import 'package:salamaty/features/edit_profile/presentation/view/widgets/birthday_field.dart';
import 'package:salamaty/features/edit_profile/presentation/view/widgets/edit_profile_text_field.dart';
import 'package:salamaty/features/edit_profile/presentation/view/widgets/gender_field.dart';
import 'package:salamaty/generated/l10n.dart';

class EditProfileScreenBody extends StatefulWidget {
  const EditProfileScreenBody({super.key});

  @override
  State<EditProfileScreenBody> createState() => _EditProfileScreenBodyState();
}

class _EditProfileScreenBodyState extends State<EditProfileScreenBody> {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController birthDateController = TextEditingController();

  String selectedGender = '';
  bool isDataLoaded = false;

  @override
  void initState() {
    super.initState();
    context.read<EditProfileCubit>().loadProfile();
  }

  @override
  void dispose() {
    fullNameController.dispose();
    addressController.dispose();
    birthDateController.dispose();
    super.dispose();
  }

  // void _fillData(Map<String, dynamic> data) {
  //   fullNameController.text = data["fullName"] ?? '';
  //   addressController.text = data["address"] ?? '';

  //   birthDateController.text = data["birthDate"] ?? '';

  //   selectedGender = data["genderText"] ?? '';
  // }
  void _fillData(Map<String, dynamic> data) {
    fullNameController.text = data["fullName"] ?? '';
    addressController.text = data["address"] ?? '';
    birthDateController.text = data["birthDate"] ?? '';

    final genderText = data["genderText"] ?? '';
    if (genderText == 'Male') {
      selectedGender = '0';
    } else if (genderText == 'Female') {
      selectedGender = '1';
    } else {
      selectedGender = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EditProfileCubit, EditProfileState>(
      listener: (context, state) {
        if (state is EditProfileSuccess) {
          final cubit = context.read<EditProfileCubit>();

          if (!isDataLoaded && cubit.profileData != null) {
            _fillData(cubit.profileData!);
            isDataLoaded = true;
            setState(() {});
            return;
          }

          AppSnackBar.show(
            context,
            message: S.of(context).profileUpdatedSuccessfully,
            type: SnackBarType.success,
          );

          Navigator.pop(context, true);
        }

        if (state is EditProfileFailure) {
          AppSnackBar.show(
            context,
            message: state.message,
            type: SnackBarType.error,
          );
        }
      },
      builder: (context, state) {
        if (state is EditProfileLoading && !isDataLoaded) {
          return const Center(child: CircularProgressIndicator());
        }

        return SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 60),
              const ArrowBack(),
              CustomScreenTitle(title: S.of(context).editProfile),
              const SizedBox(height: 30),
              EditProfileTextField(
                label: S.of(context).fullName,
                controller: fullNameController,
              ),
              const SizedBox(height: 10),
              EditProfileTextField(
                label: S.of(context).address,
                controller: addressController,
              ),
              const SizedBox(height: 10),
              GenderField(
                onChanged: (value) {
                  selectedGender = value ?? '';
                },
              ),
              const SizedBox(height: 10),
              BirthdayField(
                controller: birthDateController,
              ),
              const SizedBox(height: 40),
              LargeAppButton(
                text: state is EditProfileLoading
                    ? S.of(context).loading
                    : S.of(context).save,
                onPressed: state is EditProfileLoading
                    ? null
                    : () {
                        if (fullNameController.text.trim().isEmpty ||
                            addressController.text.trim().isEmpty ||
                            birthDateController.text.trim().isEmpty ||
                            selectedGender.isEmpty) {
                          AppSnackBar.show(
                            context,
                            message:
                                S.of(context).pleaseCompleteAllRequiredFields,
                            type: SnackBarType.error,
                          );

                          return;
                        }

                        context.read<EditProfileCubit>().updateProfile(
                              fullName: fullNameController.text.trim(),
                              gender: selectedGender,
                              birthDate: birthDateController.text.trim(),
                              address: addressController.text.trim(),
                            );
                      },
              ),
            ],
          ),
        );
      },
    );
  }
}
