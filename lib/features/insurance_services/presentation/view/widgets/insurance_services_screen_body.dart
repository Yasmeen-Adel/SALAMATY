// // import 'package:flutter/material.dart';
// // import 'package:flutter_bloc/flutter_bloc.dart';
// // import 'package:salamaty/core/utils/app_colors.dart';
// // import 'package:salamaty/core/widgets/custom_screen_subtitle.dart';
// // import 'package:salamaty/core/widgets/custom_screen_title.dart';
// // import 'package:salamaty/core/widgets/custom_text_field_label.dart';
// // import 'package:salamaty/features/insurance_services/data/models/facility_model.dart';
// // import 'package:salamaty/features/insurance_services/presentation/cubit/insurance_services_cubit.dart';
// // import 'package:url_launcher/url_launcher.dart';

// // class InsuranceServicesScreenBody extends StatefulWidget {
// //   const InsuranceServicesScreenBody({super.key});

// //   @override
// //   State<InsuranceServicesScreenBody> createState() =>
// //       _InsuranceServicesScreenBodyState();
// // }

// // class _InsuranceServicesScreenBodyState
// //     extends State<InsuranceServicesScreenBody> {
// //   // ✅ نحتفظ بالـ selected filter في الـ widget state عشان يفضل ظاهر في كل الـ states
// //   String _selectedFilter = 'All';

// //   @override
// //   void initState() {
// //     super.initState();
// //     context.read<InsuranceServicesCubit>().loadFacilities();
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return BlocConsumer<InsuranceServicesCubit, InsuranceServicesState>(
// //       // ✅ نستخدم BlocConsumer عشان نسمع التغييرات ونحدث الـ _selectedFilter
// //       listener: (context, state) {
// //         if (state is InsuranceServicesLoaded) {
// //           setState(() {
// //             _selectedFilter = state.selectedFilter;
// //           });
// //         }
// //       },
// //       builder: (context, state) {
// //         return Column(
// //           children: [
// //             const SizedBox(height: 40),
// //             const CustomScreenTitle(title: 'Insurance Services'),
// //             const CustomScreenSubtitle(
// //               subtitleText: 'A list of covered services near your location.',
// //             ),
// //             const SizedBox(height: 12),
// //             const CustomTextFieldLabel(labelText: 'Nearby Services'),
// //             const SizedBox(height: 10),
// //             // ✅ الـ filter دايماً ظاهر بغض النظر عن الـ state
// //             _buildFilterTabs(),
// //             const SizedBox(height: 10),
// //             Expanded(child: _buildBody(state)),
// //           ],
// //         );
// //       },
// //     );
// //   }

// //   // ✅ الـ filter tabs بتعتمد على الـ _selectedFilter المحلية مش على الـ state
// //   Widget _buildFilterTabs() {
// //     final filters = ['All', 'Labs', 'Hospitals', 'Pharmacies'];

// //     return SingleChildScrollView(
// //       scrollDirection: Axis.horizontal,
// //       padding: const EdgeInsets.symmetric(horizontal: 16),
// //       child: Row(
// //         children: filters.map((f) {
// //           final isSelected = f == _selectedFilter;
// //           return Padding(
// //             padding: const EdgeInsets.only(right: 8),
// //             child: GestureDetector(
// //               onTap: () {
// //                 // ✅ نحدث الـ local state فوراً عشان الـ UI يستجيب على طول
// //                 setState(() {
// //                   _selectedFilter = f;
// //                 });
// //                 context.read<InsuranceServicesCubit>().changeFilter(f);
// //               },
// //               child: Container(
// //                 padding:
// //                     const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
// //                 decoration: BoxDecoration(
// //                   color:
// //                       isSelected ? AppColors.primaryColor : Colors.transparent,
// //                   borderRadius: BorderRadius.circular(30),
// //                   border: Border.all(
// //                     color: isSelected
// //                         ? AppColors.primaryColor
// //                         : Colors.grey.shade400,
// //                   ),
// //                 ),
// //                 child: Text(
// //                   f,
// //                   style: TextStyle(
// //                     color: isSelected ? Colors.white : Colors.black,
// //                     fontWeight: FontWeight.w500,
// //                   ),
// //                 ),
// //               ),
// //             ),
// //           );
// //         }).toList(),
// //       ),
// //     );
// //   }

// //   Widget _buildBody(InsuranceServicesState state) {
// //     if (state is InsuranceServicesLoading) {
// //       return const Center(child: CircularProgressIndicator());
// //     }

// //     if (state is InsuranceServicesLocationDisabled) {
// //       return _LocationErrorView(
// //         icon: Icons.location_off_outlined,
// //         title: 'Location is turned off',
// //         description:
// //             'Please enable location services on your device to find covered facilities near you.',
// //         primaryLabel: 'Open location settings',
// //         onPrimary: () =>
// //             context.read<InsuranceServicesCubit>().openLocationSettings(),
// //         onRetry: () => context.read<InsuranceServicesCubit>().loadFacilities(),
// //       );
// //     }

// //     if (state is InsuranceServicesLocationDenied) {
// //       return _LocationErrorView(
// //         icon: Icons.location_disabled_outlined,
// //         title: 'Location access denied',
// //         description:
// //             'Please allow location permission for this app from your phone settings to continue.',
// //         primaryLabel: 'Open location settings', // ✅ تم التصحيح
// //         onPrimary: () =>
// //             // ✅ تم التصحيح: بنفتح location settings مش app settings
// //             context.read<InsuranceServicesCubit>().openLocationSettings(),
// //         onRetry: () => context.read<InsuranceServicesCubit>().loadFacilities(),
// //       );
// //     }

// //     if (state is InsuranceServicesError) {
// //       return Center(
// //         child: Column(
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           children: [
// //             const Icon(Icons.error_outline, color: Colors.red, size: 48),
// //             const SizedBox(height: 12),
// //             Padding(
// //               padding: const EdgeInsets.symmetric(horizontal: 24),
// //               child: Text(
// //                 state.message,
// //                 textAlign: TextAlign.center,
// //                 style: const TextStyle(fontSize: 14),
// //               ),
// //             ),
// //             const SizedBox(height: 8),
// //             TextButton(
// //               onPressed: () =>
// //                   context.read<InsuranceServicesCubit>().loadFacilities(),
// //               child: const Text('Retry'),
// //             ),
// //           ],
// //         ),
// //       );
// //     }

// //     if (state is InsuranceServicesLoaded) {
// //       if (state.facilities.isEmpty) {
// //         return const Center(
// //           child: Text('No facilities found nearby.'),
// //         );
// //       }
// //       return ListView.builder(
// //         padding: const EdgeInsets.symmetric(horizontal: 16),
// //         itemCount: state.facilities.length,
// //         itemBuilder: (context, index) =>
// //             _FacilityCard(facility: state.facilities[index]),
// //       );
// //     }

// //     return const SizedBox();
// //   }
// // }

// // // ===================== Location Error View =====================

// // class _LocationErrorView extends StatelessWidget {
// //   final IconData icon;
// //   final String title;
// //   final String description;
// //   final String primaryLabel;
// //   final VoidCallback onPrimary;
// //   final VoidCallback onRetry;

// //   const _LocationErrorView({
// //     required this.icon,
// //     required this.title,
// //     required this.description,
// //     required this.primaryLabel,
// //     required this.onPrimary,
// //     required this.onRetry,
// //   });

// //   @override
// //   Widget build(BuildContext context) {
// //     return Padding(
// //       padding: const EdgeInsets.symmetric(horizontal: 32),
// //       child: Column(
// //         mainAxisAlignment: MainAxisAlignment.center,
// //         children: [
// //           Container(
// //             width: 80,
// //             height: 80,
// //             decoration: BoxDecoration(
// //               color: AppColors.primaryColor.withOpacity(0.08),
// //               shape: BoxShape.circle,
// //             ),
// //             child: Icon(icon, size: 38, color: AppColors.primaryColor),
// //           ),
// //           const SizedBox(height: 20),
// //           Text(
// //             title,
// //             style: const TextStyle(
// //               fontSize: 17,
// //               fontWeight: FontWeight.w600,
// //             ),
// //             textAlign: TextAlign.center,
// //           ),
// //           const SizedBox(height: 10),
// //           Text(
// //             description,
// //             style: const TextStyle(
// //               fontSize: 14,
// //               color: Color(0xFF989898),
// //               height: 1.6,
// //             ),
// //             textAlign: TextAlign.center,
// //           ),
// //           const SizedBox(height: 28),
// //           SizedBox(
// //             width: double.infinity,
// //             height: 50,
// //             child: ElevatedButton.icon(
// //               onPressed: onPrimary,
// //               icon: const Icon(Icons.settings_outlined,
// //                   color: Colors.white, size: 18),
// //               label: Text(
// //                 primaryLabel,
// //                 style: const TextStyle(
// //                     fontSize: 15,
// //                     fontWeight: FontWeight.w500,
// //                     color: Colors.white),
// //               ),
// //               style: ElevatedButton.styleFrom(
// //                 backgroundColor: AppColors.primaryColor,
// //                 shape: RoundedRectangleBorder(
// //                   borderRadius: BorderRadius.circular(14),
// //                 ),
// //               ),
// //             ),
// //           ),
// //           const SizedBox(height: 12),
// //           SizedBox(
// //             width: double.infinity,
// //             height: 50,
// //             child: OutlinedButton.icon(
// //               onPressed: onRetry,
// //               icon:
// //                   Icon(Icons.refresh, color: AppColors.primaryColor, size: 18),
// //               label: Text(
// //                 'Try again',
// //                 style: TextStyle(
// //                     fontSize: 15,
// //                     fontWeight: FontWeight.w500,
// //                     color: AppColors.primaryColor),
// //               ),
// //               style: OutlinedButton.styleFrom(
// //                 side: BorderSide(color: AppColors.primaryColor, width: 1.5),
// //                 shape: RoundedRectangleBorder(
// //                   borderRadius: BorderRadius.circular(14),
// //                 ),
// //               ),
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }

// // // ===================== Facility Card =====================

// // class _FacilityCard extends StatelessWidget {
// //   final FacilityModel facility;

// //   const _FacilityCard({required this.facility});

// //   @override
// //   Widget build(BuildContext context) {
// //     return Container(
// //       margin: const EdgeInsets.only(bottom: 12),
// //       padding: const EdgeInsets.all(16),
// //       decoration: BoxDecoration(
// //         color: Colors.white,
// //         borderRadius: BorderRadius.circular(16),
// //         boxShadow: [
// //           BoxShadow(
// //             color: Colors.black.withOpacity(0.07),
// //             blurRadius: 8,
// //             offset: const Offset(0, 2),
// //           ),
// //         ],
// //       ),
// //       child: Column(
// //         crossAxisAlignment: CrossAxisAlignment.start,
// //         children: [
// //           Row(
// //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //             children: [
// //               Expanded(
// //                 child: Text(
// //                   facility.name,
// //                   style: const TextStyle(
// //                     fontSize: 16,
// //                     fontWeight: FontWeight.bold,
// //                   ),
// //                 ),
// //               ),
// //               Container(
// //                 padding:
// //                     const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
// //                 decoration: BoxDecoration(
// //                   color: Colors.grey.shade100,
// //                   borderRadius: BorderRadius.circular(12),
// //                 ),
// //                 child: Text(
// //                   _formatType(facility.type),
// //                   style: const TextStyle(fontSize: 12, color: Colors.grey),
// //                 ),
// //               ),
// //             ],
// //           ),
// //           if (facility.address != null) ...[
// //             const SizedBox(height: 4),
// //             Text(
// //               facility.distanceKm != null
// //                   ? '${facility.distanceKm!.toStringAsFixed(1)} KM away — ${facility.address}'
// //                   : facility.address!,
// //               style: const TextStyle(fontSize: 13, color: Colors.grey),
// //             ),
// //           ],
// //           const SizedBox(height: 4),
// //           Text(
// //             facility.openUntil ?? (facility.isOpen ? 'Open' : 'Closed'),
// //             style: TextStyle(
// //               fontSize: 13,
// //               color: facility.isOpen ? Colors.green : Colors.red,
// //               fontWeight: FontWeight.w500,
// //             ),
// //           ),
// //           const SizedBox(height: 12),
// //           Row(
// //             children: [
// //               if (facility.phone != null) ...[
// //                 Expanded(
// //                   child: OutlinedButton.icon(
// //                     onPressed: () => _callPhone(facility.phone!),
// //                     icon: const Icon(Icons.phone, size: 16),
// //                     label: const Text('Call'),
// //                     style: OutlinedButton.styleFrom(
// //                       foregroundColor: AppColors.primaryColor,
// //                       side: const BorderSide(color: AppColors.primaryColor),
// //                     ),
// //                   ),
// //                 ),
// //                 const SizedBox(width: 8),
// //               ],
// //               Expanded(
// //                 child: ElevatedButton.icon(
// //                   onPressed: () => _openLocation(),
// //                   icon: const Icon(Icons.location_on, size: 16),
// //                   label: const Text('Location'),
// //                   style: ElevatedButton.styleFrom(
// //                     backgroundColor: AppColors.primaryColor,
// //                     foregroundColor: Colors.white,
// //                   ),
// //                 ),
// //               ),
// //             ],
// //           ),
// //         ],
// //       ),
// //     );
// //   }

// //   String _formatType(String type) {
// //     final map = {
// //       'hospital': 'Hospital',
// //       'analysis laboratories': 'Lab',
// //       'pharmacies': 'Pharmacy',
// //       'radiology center': 'Radiology',
// //       'physical therapy': 'Physiotherapy',
// //     };
// //     return map[type.toLowerCase()] ?? type;
// //   }

// //   Future<void> _callPhone(String phone) async {
// //     final uri = Uri.parse('tel:$phone');
// //     if (await canLaunchUrl(uri)) {
// //       await launchUrl(uri);
// //     }
// //   }

// //   Future<void> _openLocation() async {
// //     if (facility.locationUrl != null) {
// //       final uri = Uri.parse(facility.locationUrl!);
// //       if (await canLaunchUrl(uri)) {
// //         await launchUrl(uri, mode: LaunchMode.externalApplication);
// //       }
// //     } else if (facility.latitude != null && facility.longitude != null) {
// //       final uri = Uri.parse(
// //           'https://www.google.com/maps/search/?api=1&query=${facility.latitude},${facility.longitude}');
// //       if (await canLaunchUrl(uri)) {
// //         await launchUrl(uri, mode: LaunchMode.externalApplication);
// //       }
// //     }
// //   }
// // }

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:salamaty/core/services/auth_local_storage.dart';
// import 'package:salamaty/core/widgets/app_snackbar.dart';
// import 'package:salamaty/core/widgets/arrow_back.dart';
// import 'package:salamaty/core/widgets/custom_screen_title.dart';
// import 'package:salamaty/core/widgets/custom_text_field_label.dart';
// import 'package:salamaty/core/widgets/large_app_button.dart';
// import 'package:salamaty/core/widgets/main_screen.dart';
// import 'package:salamaty/features/insurance_information/presentation/cubit/insurance_information_cubit.dart';
// import 'package:salamaty/features/insurance_information/presentation/view/widgets/image_upload_card.dart';
// import 'package:salamaty/features/select_insurance/data/models/select_insurance_provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';

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
//   final _idController = TextEditingController();
//   final _nameController = TextEditingController();

//   String? _idError;
//   String? _nameError;

//   @override
//   void dispose() {
//     _idController.dispose();
//     _nameController.dispose();
//     super.dispose();
//   }

//   bool _validate() {
//     bool isValid = true;

//     final id = _idController.text.trim();
//     final name = _nameController.text.trim();

//     if (id.isEmpty) {
//       _idError = 'Insurance ID is required';
//       isValid = false;
//     } else if (!RegExp(r'^\d+$').hasMatch(id)) {
//       _idError = 'ID must contain numbers only';
//       isValid = false;
//     } else if (id.length < 5 || id.length > 14) {
//       _idError = 'ID must be between 5 and 14 digits';
//       isValid = false;
//     } else {
//       _idError = null;
//     }

//     if (name.isEmpty) {
//       _nameError = 'Full name is required';
//       isValid = false;
//     } else if (RegExp(r'\d').hasMatch(name)) {
//       _nameError = 'Name must not contain numbers';
//       isValid = false;
//     } else {
//       _nameError = null;
//     }

//     setState(() {});

//     return isValid;
//   }

//   Future<void> _onSubmit() async {
//     if (!_validate()) return;

//     final cubit = context.read<InsuranceInformationCubit>();

//     if (cubit.frontImage == null || cubit.backImage == null) {
//       AppSnackBar.show(
//         context,
//         message: 'Please upload both Insurance Card images',
//         type: SnackBarType.error,
//       );
//       return;
//     }

//     final userId = await AuthLocalStorage.getUserId() ?? '';

//     await cubit.submitInfo(
//       userId: userId,
//       providerId: widget.selectedProvider.id,
//       cardHolderId: _idController.text.trim(),
//       fullName: _nameController.text.trim(),
//       policyNumber: cubit.scannedPolicy,
//       validUntil: cubit.scannedValidDate,
//       status: cubit.scannedStatus,
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocListener<InsuranceInformationCubit, InsuranceInformationState>(
//       listener: (context, state) async {
//         if (state is InsuranceInformationScanMismatch) {
//           AppSnackBar.show(
//             context,
//             message: state.message,
//             type: SnackBarType.error,
//           );
//         } else if (state is InsuranceInformationScanSuccess) {
//           final data = state.response;

//           if (data.scannedId != null) {
//             _idController.text = data.scannedId!;
//           }
//           if (data.scannedName != null) {
//             _nameController.text = data.scannedName!;
//           }

//           AppSnackBar.show(
//             context,
//             message: state.response.message,
//             type: SnackBarType.success,
//           );
//         } else if (state is InsuranceInformationSubmitSuccess) {
//           final prefs = await SharedPreferences.getInstance();
//           await prefs.setBool('has_insurance', true);
//           await prefs.setInt('provider_id', widget.selectedProvider.id);

//           // ✅ بنرجع لـ MainScreen من أول ونفتح insurance tab (index 3)
//           // مع إزالة كل الـ screens اللي فوقيه عشان الـ nav bar يظهر صح
//           Navigator.pushNamedAndRemoveUntil(
//             context,
//             MainScreen.routeName,
//             (route) => false,
//             arguments: 3,
//           );
//         } else if (state is InsuranceInformationError) {
//           AppSnackBar.show(
//             context,
//             message: state.message,
//             type: SnackBarType.error,
//           );
//         } else if (state is InsuranceInformationMissingImages) {
//           AppSnackBar.show(
//             context,
//             message: 'Please upload both Insurance Card images',
//             type: SnackBarType.error,
//           );
//         }
//       },
//       child: SingleChildScrollView(
//         padding: const EdgeInsets.only(top: 60),
//         child: Column(
//           children: [
//             const ArrowBack(),
//             const CustomScreenTitle(title: 'Insurance Information'),
//             const SizedBox(height: 24),
//             const CustomTextFieldLabel(labelText: 'Full Name'),
//             _buildNameField(),
//             const SizedBox(height: 16),
//             const CustomTextFieldLabel(
//                 labelText: 'Write Your Insurance ID Number'),
//             _buildIdField(),
//             const SizedBox(height: 24),
//             const CustomTextFieldLabel(
//                 labelText: 'Upload Your Insurance Photos'),
//             ImageUploadCard(
//               title: 'Insurance Card Front',
//               description: 'Upload the front side of your Insurance Card.',
//               cardType: ImageCardType.front,
//               providerId: widget.selectedProvider.id,
//             ),
//             ImageUploadCard(
//               title: 'Insurance Card Back',
//               description: 'Upload the back side of your Insurance Card.',
//               cardType: ImageCardType.back,
//               providerId: widget.selectedProvider.id,
//             ),
//             const SizedBox(height: 32),
//             BlocBuilder<InsuranceInformationCubit, InsuranceInformationState>(
//               builder: (context, state) {
//                 final isLoading = state is InsuranceInformationSubmitLoading ||
//                     state is InsuranceInformationScanLoading;

//                 return isLoading
//                     ? const CircularProgressIndicator()
//                     : LargeAppButton(
//                         text: 'Submit',
//                         onPressed: _onSubmit,
//                       );
//               },
//             ),
//             const SizedBox(height: 32),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildIdField() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//       child: TextFormField(
//         controller: _idController,
//         keyboardType: TextInputType.text,
//         decoration: InputDecoration(
//           hintText: 'Insurance ID Number',
//           errorText: _idError,
//           filled: true,
//           fillColor: const Color(0x33697DC3),
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(24),
//             borderSide: BorderSide.none,
//           ),
//         ),
//         onChanged: (value) {
//           final id = value.trim();

//           if (id.isEmpty) {
//             setState(() => _idError = 'Insurance ID is required');
//           } else if (!RegExp(r'^\d+$').hasMatch(id)) {
//             setState(() => _idError = 'ID must contain numbers only');
//           } else if (id.length < 5 || id.length > 14) {
//             setState(() => _idError = 'ID must be between 5 and 14 digits');
//           } else {
//             setState(() => _idError = null);
//           }
//         },
//       ),
//     );
//   }

//   Widget _buildNameField() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//       child: TextFormField(
//         controller: _nameController,
//         decoration: InputDecoration(
//           hintText: 'Full Name',
//           errorText: _nameError,
//           filled: true,
//           fillColor: const Color(0x33697DC3),
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(24),
//             borderSide: BorderSide.none,
//           ),
//         ),
//         onChanged: (value) {
//           final name = value.trim();

//           if (name.isEmpty) {
//             setState(() => _nameError = 'Full name is required');
//           } else if (RegExp(r'\d').hasMatch(name)) {
//             setState(() => _nameError = 'Name must not contain numbers');
//           } else {
//             setState(() => _nameError = null);
//           }
//         },
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salamaty/core/utils/app_colors.dart';
import 'package:salamaty/core/widgets/custom_screen_subtitle.dart';
import 'package:salamaty/core/widgets/custom_screen_title.dart';
import 'package:salamaty/core/widgets/custom_text_field_label.dart';
import 'package:salamaty/features/insurance_services/data/models/facility_model.dart';
import 'package:salamaty/features/insurance_services/presentation/cubit/insurance_services_cubit.dart';
import 'package:url_launcher/url_launcher.dart';

class InsuranceServicesScreenBody extends StatefulWidget {
  const InsuranceServicesScreenBody({super.key});

  @override
  State<InsuranceServicesScreenBody> createState() =>
      _InsuranceServicesScreenBodyState();
}

class _InsuranceServicesScreenBodyState
    extends State<InsuranceServicesScreenBody> {
  String _selectedFilter = 'All';

  // @override
  // void initState() {
  //   super.initState();
  //   context.read<InsuranceServicesCubit>().loadFacilities();
  // }
@override
void initState() {
  super.initState();

  final cubit = context.read<InsuranceServicesCubit>();

  if (cubit.state is! InsuranceServicesLoaded) {
    cubit.loadFacilities();
  }
}
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<InsuranceServicesCubit, InsuranceServicesState>(
      listener: (context, state) {
        if (state is InsuranceServicesLoaded) {
          setState(() {
            _selectedFilter = state.selectedFilter;
          });
        }
      },
      builder: (context, state) {
        return Column(
          children: [
            const SizedBox(height: 40),
            const CustomScreenTitle(title: 'Insurance Services'),
            const CustomScreenSubtitle(
              subtitleText: 'A list of covered services near your location.',
            ),
            const SizedBox(height: 12),
            const CustomTextFieldLabel(labelText: 'Nearby Services'),
            const SizedBox(height: 10),
            _buildFilterTabs(),
            const SizedBox(height: 10),
            Expanded(child: _buildBody(state)),
          ],
        );
      },
    );
  }

  Widget _buildFilterTabs() {
    final filters = ['All', 'Labs', 'Hospitals', 'Pharmacies'];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: filters.map((f) {
          final isSelected = f == _selectedFilter;
          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _selectedFilter = f;
                });
                context.read<InsuranceServicesCubit>().changeFilter(f);
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  color:
                      isSelected ? AppColors.primaryColor : Colors.transparent,
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                    color: isSelected
                        ? AppColors.primaryColor
                        : Colors.grey.shade400,
                  ),
                ),
                child: Text(
                  f,
                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildBody(InsuranceServicesState state) {
    if (state is InsuranceServicesLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (state is InsuranceServicesLocationDisabled) {
      return _LocationErrorView(
        icon: Icons.location_off_outlined,
        title: 'Location is turned off',
        description:
            'Please enable location services on your device to find covered facilities near you.',
        primaryLabel: 'Open location settings',
        onPrimary: () =>
            context.read<InsuranceServicesCubit>().openLocationSettings(),
        onRetry: () => context.read<InsuranceServicesCubit>().loadFacilities(),
      );
    }

    if (state is InsuranceServicesLocationDenied) {
      return _LocationErrorView(
        icon: Icons.location_disabled_outlined,
        title: 'Location access denied',
        description:
            'Please allow location permission for this app from your phone settings to continue.',
        primaryLabel: 'Open location settings',
        onPrimary: () =>
            context.read<InsuranceServicesCubit>().openLocationSettings(),
        onRetry: () => context.read<InsuranceServicesCubit>().loadFacilities(),
      );
    }

    if (state is InsuranceServicesError) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, color: Colors.red, size: 48),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                state.message,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 14),
              ),
            ),
            const SizedBox(height: 8),
            TextButton(
              onPressed: () =>
                  context.read<InsuranceServicesCubit>().loadFacilities(),
              child: const Text('Retry'),
            ),
          ],
        ),
      );
    }

    if (state is InsuranceServicesLoaded) {
      if (state.facilities.isEmpty) {
        return const Center(
          child: Text('No facilities found nearby.'),
        );
      }
      return ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: state.facilities.length,
        itemBuilder: (context, index) =>
            _FacilityCard(facility: state.facilities[index]),
      );
    }

    return const SizedBox();
  }
}

// ===================== Location Error View =====================

class _LocationErrorView extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final String primaryLabel;
  final VoidCallback onPrimary;
  final VoidCallback onRetry;

  const _LocationErrorView({
    required this.icon,
    required this.title,
    required this.description,
    required this.primaryLabel,
    required this.onPrimary,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: AppColors.primaryColor.withOpacity(0.08),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, size: 38, color: AppColors.primaryColor),
          ),
          const SizedBox(height: 20),
          Text(
            title,
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Text(
            description,
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xFF989898),
              height: 1.6,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 28),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton.icon(
              onPressed: onPrimary,
              icon: const Icon(Icons.settings_outlined,
                  color: Colors.white, size: 18),
              label: Text(
                primaryLabel,
                style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: OutlinedButton.icon(
              onPressed: onRetry,
              icon:
                  Icon(Icons.refresh, color: AppColors.primaryColor, size: 18),
              label: Text(
                'Try again',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: AppColors.primaryColor),
              ),
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: AppColors.primaryColor, width: 1.5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ===================== Facility Card =====================

class _FacilityCard extends StatelessWidget {
  final FacilityModel facility;

  const _FacilityCard({required this.facility});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.07),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  facility.name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  _formatType(facility.type),
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ),
            ],
          ),
          if (facility.address != null) ...[
            const SizedBox(height: 4),
            Text(
              facility.distanceKm != null
                  ? '${facility.distanceKm!.toStringAsFixed(1)} KM away — ${facility.address}'
                  : facility.address!,
              style: const TextStyle(fontSize: 13, color: Colors.grey),
            ),
          ],
          const SizedBox(height: 4),
          Text(
            facility.openUntil ?? (facility.isOpen ? 'Open' : 'Closed'),
            style: TextStyle(
              fontSize: 13,
              color: facility.isOpen ? Colors.green : Colors.red,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              if (facility.phone != null) ...[
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () => _callPhone(facility.phone!),
                    icon: const Icon(Icons.phone, size: 16),
                    label: const Text('Call'),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: AppColors.primaryColor,
                      side: const BorderSide(color: AppColors.primaryColor),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
              ],
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () => _openLocation(),
                  icon: const Icon(Icons.location_on, size: 16),
                  label: const Text('Location'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    foregroundColor: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  String _formatType(String type) {
    final map = {
      'hospital': 'Hospital',
      'analysis laboratories': 'Lab',
      'pharmacies': 'Pharmacy',
      'radiology center': 'Radiology',
      'physical therapy': 'Physiotherapy',
    };
    return map[type.toLowerCase()] ?? type;
  }

  Future<void> _callPhone(String phone) async {
    final uri = Uri.parse('tel:$phone');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  Future<void> _openLocation() async {
    if (facility.locationUrl != null) {
      final uri = Uri.parse(facility.locationUrl!);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      }
    } else if (facility.latitude != null && facility.longitude != null) {
      final uri = Uri.parse(
          'https://www.google.com/maps/search/?api=1&query=${facility.latitude},${facility.longitude}');
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      }
    }
  }
}
