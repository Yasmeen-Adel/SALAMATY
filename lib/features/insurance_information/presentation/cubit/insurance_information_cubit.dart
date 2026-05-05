




import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salamaty/features/insurance_information/data/repos/insurance_information_repo.dart';
import 'package:salamaty/features/insurance_information/data/models/insurance_scan_result.dart';

part 'insurance_information_state.dart';

class InsuranceInformationCubit extends Cubit<InsuranceInformationState> {
  final InsuranceInformationRepo repo;
  final int providerId;
  final String providerName; // اسم الـ provider اللي المستخدم اختاره

  InsuranceInformationCubit({
    required this.repo,
    required this.providerId,
    required this.providerName,
  }) : super(InsuranceInformationInitial());

  File? frontImage;
  File? backImage;

  Future<void> setFrontImage(File file) async {
    frontImage = file;
    if (isClosed) return;

    emit(InsuranceInformationScanLoading(
      frontImage: frontImage,
      backImage: backImage,
    ));

    try {
      final result = await repo.scanCard(
        providerId: providerId,
        cardHolderId: '',
        frontImage: frontImage,
      );

      // مقارنة اسم الـ provider المختار مع اللي رجع من الـ scan
      bool providerMatch = true;
      String scanMsg = result.message;

      if (result.scannedProvider != null &&
          result.scannedProvider!.isNotEmpty) {
        final scanned = result.scannedProvider!.trim().toLowerCase();
        final selected = providerName.trim().toLowerCase();
        providerMatch = scanned == selected || scanned.contains(selected) || selected.contains(scanned);

        if (!providerMatch) {
          scanMsg =
              'Provider mismatch: card belongs to "${result.scannedProvider}" but you selected "$providerName"';
        }
      }

      if (!isClosed) {
        emit(InsuranceInformationImagesUpdated(
          frontImage: frontImage,
          backImage: backImage,
          autoFilledId: result.scannedId,
          autoFilledHolderName: result.scannedName,
          autoFilledPolicy: result.scannedPolicy,
          autoFilledValidUntil: result.scannedValidDate,
          autoFilledStatus: result.scannedStatus,
          autoFilledProvider: result.scannedProvider,
          scanSuccess: providerMatch,
          scanMessage: scanMsg,
        ));
      }
    } on DioException catch (e) {
      if (!isClosed) {
        emit(InsuranceInformationImagesUpdated(
          frontImage: frontImage,
          backImage: backImage,
          scanSuccess: false,
          scanMessage: _extractErrorMessage(e),
        ));
      }
    } catch (e) {
      if (!isClosed) {
        emit(InsuranceInformationImagesUpdated(
          frontImage: frontImage,
          backImage: backImage,
          scanSuccess: false,
          scanMessage: e.toString(),
        ));
      }
    }
  }

  void setBackImage(File file) {
    backImage = file;
    if (!isClosed) {
      final current = state;
      String? existingId;
      String? existingName;
      String? existingPolicy;
      String? existingValidUntil;
      String? existingStatus;
      String? existingProvider;

      if (current is InsuranceInformationImagesUpdated) {
        existingId = current.autoFilledId;
        existingName = current.autoFilledHolderName;
        existingPolicy = current.autoFilledPolicy;
        existingValidUntil = current.autoFilledValidUntil;
        existingStatus = current.autoFilledStatus;
        existingProvider = current.autoFilledProvider;
      }

      emit(InsuranceInformationImagesUpdated(
        frontImage: frontImage,
        backImage: backImage,
        autoFilledId: existingId,
        autoFilledHolderName: existingName,
        autoFilledPolicy: existingPolicy,
        autoFilledValidUntil: existingValidUntil,
        autoFilledStatus: existingStatus,
        autoFilledProvider: existingProvider,
      ));
    }
  }

  Future<void> submit({
    required String userId,
    required String cardHolderId,
    String? holderName,
    String? policyNumber,
    String? validUntil,
    String? status,
  }) async {
    if (!isClosed) emit(InsuranceInformationLoading());
    try {
      final result = await repo.submitInsuranceInformation(
        userId: userId,
        providerId: providerId,
        cardHolderId: cardHolderId,
        holderName: holderName,
        policyNumber: policyNumber,
        validUntil: validUntil,
        status: status,
        frontImage: frontImage,
        backImage: backImage,
      );
      if (!isClosed) emit(InsuranceInformationSuccess(result: result));
    } on DioException catch (e) {
      if (!isClosed) {
        emit(InsuranceInformationError(message: _extractErrorMessage(e)));
      }
    } catch (e) {
      if (!isClosed) {
        emit(InsuranceInformationError(message: e.toString()));
      }
    }
  }

  String _extractErrorMessage(DioException e) {
    try {
      final data = e.response?.data;
      if (data is Map && data['message'] != null) {
        return data['message'].toString();
      }
    } catch (_) {}
    return e.message ?? 'Something went wrong';
  }
}