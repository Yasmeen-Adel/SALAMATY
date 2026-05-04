// // import 'dart:io';
// // import 'package:flutter_bloc/flutter_bloc.dart';
// // import 'package:salamaty/features/insurance_information/data/repos/insurance_information_repo.dart';
// // import 'package:salamaty/features/insurance_information/data/models/insurance_scan_result.dart';

// // part 'insurance_information_state.dart';

// // class InsuranceInformationCubit extends Cubit<InsuranceInformationState> {
// //   final InsuranceInformationRepo repo;

// //   InsuranceInformationCubit({required this.repo})
// //       : super(InsuranceInformationInitial());

// //   File? frontImage;
// //   File? backImage;

// //   void setFrontImage(File file) {
// //     frontImage = file;
// //     emit(InsuranceInformationImagesUpdated(
// //       frontImage: frontImage,
// //       backImage: backImage,
// //     ));
// //   }

// //   void setBackImage(File file) {
// //     backImage = file;
// //     emit(InsuranceInformationImagesUpdated(
// //       frontImage: frontImage,
// //       backImage: backImage,
// //     ));
// //   }

// //   Future<void> submit({
// //     required String userId,
// //     required int providerId,
// //     required String cardHolderId,
// //   }) async {
// //     emit(InsuranceInformationLoading());
// //     try {
// //       final result = await repo.submitInsuranceInformation(
// //         userId: userId,
// //         providerId: providerId,
// //         cardHolderId: cardHolderId,
// //         frontImage: frontImage,
// //         backImage: backImage,
// //       );
// //       emit(InsuranceInformationSuccess(result: result));
// //     } catch (e) {
// //       emit(InsuranceInformationError(message: e.toString()));
// //     }
// //   }
// // }

// import 'dart:io';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:salamaty/features/insurance_information/data/repos/insurance_information_repo.dart';
// import 'package:salamaty/features/insurance_information/data/models/insurance_scan_result.dart';

// part 'insurance_information_state.dart';

// class InsuranceInformationCubit extends Cubit<InsuranceInformationState> {
//   final InsuranceInformationRepo repo;

//   InsuranceInformationCubit({required this.repo})
//       : super(InsuranceInformationInitial());

//   File? frontImage;
//   File? backImage;

//   void setFrontImage(File file) {
//     frontImage = file;
//     if (!isClosed) {
//       emit(InsuranceInformationImagesUpdated(
//         frontImage: frontImage,
//         backImage: backImage,
//       ));
//     }
//   }

//   void setBackImage(File file) {
//     backImage = file;
//     if (!isClosed) {
//       emit(InsuranceInformationImagesUpdated(
//         frontImage: frontImage,
//         backImage: backImage,
//       ));
//     }
//   }

//   Future<void> submit({
//     required String userId,
//     required int providerId,
//     required String cardHolderId,
//   }) async {
//     if (!isClosed) emit(InsuranceInformationLoading());
//     try {
//       final result = await repo.submitInsuranceInformation(
//         userId: userId,
//         providerId: providerId,
//         cardHolderId: cardHolderId,
//         frontImage: frontImage,
//         backImage: backImage,
//       );
//       if (!isClosed) emit(InsuranceInformationSuccess(result: result));
//     } catch (e) {
//       if (!isClosed) emit(InsuranceInformationError(message: e.toString()));
//     }
//   }
// }


// lib\features\insurance_information\presentation\cubit\insurance_information_cubit.dart

import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salamaty/features/insurance_information/data/repos/insurance_information_repo.dart';
import 'package:salamaty/features/insurance_information/data/models/insurance_scan_result.dart';

part 'insurance_information_state.dart';

class InsuranceInformationCubit extends Cubit<InsuranceInformationState> {
  final InsuranceInformationRepo repo;
  final int providerId;

  InsuranceInformationCubit({
    required this.repo,
    required this.providerId,
  }) : super(InsuranceInformationInitial());

  File? frontImage;
  File? backImage;

  /// Called when front image is picked — triggers auto-scan
  Future<void> setFrontImage(File file) async {
    frontImage = file;
    if (isClosed) return;

    // Show scan loading state
    emit(InsuranceInformationScanLoading(
      frontImage: frontImage,
      backImage: backImage,
    ));

    try {
      // Call scan API with a placeholder holder id (empty string is fine)
      final result = await repo.scanCard(
        providerId: providerId,
        cardHolderId: '',
        frontImage: frontImage,
      );

      if (!isClosed) {
        emit(InsuranceInformationImagesUpdated(
          frontImage: frontImage,
          backImage: backImage,
          autoFilledId: result.scannedId,
          autoFilledHolderName: result.scannedHolderName,
        ));
      }
    } catch (_) {
      // Scan failed — still update images without auto-fill
      if (!isClosed) {
        emit(InsuranceInformationImagesUpdated(
          frontImage: frontImage,
          backImage: backImage,
        ));
      }
    }
  }

  void setBackImage(File file) {
    backImage = file;
    if (!isClosed) {
      // Preserve existing auto-filled values
      final current = state;
      String? existingId;
      String? existingName;

      if (current is InsuranceInformationImagesUpdated) {
        existingId = current.autoFilledId;
        existingName = current.autoFilledHolderName;
      }

      emit(InsuranceInformationImagesUpdated(
        frontImage: frontImage,
        backImage: backImage,
        autoFilledId: existingId,
        autoFilledHolderName: existingName,
      ));
    }
  }

  Future<void> submit({
    required String userId,
    required String cardHolderId,
    String? holderName,
  }) async {
    if (!isClosed) emit(InsuranceInformationLoading());
    try {
      final result = await repo.submitInsuranceInformation(
        userId: userId,
        providerId: providerId,
        cardHolderId: cardHolderId,
        holderName: holderName,
        frontImage: frontImage,
        backImage: backImage,
      );
      if (!isClosed) emit(InsuranceInformationSuccess(result: result));
    } catch (e) {
      if (!isClosed) emit(InsuranceInformationError(message: e.toString()));
    }
  }
}