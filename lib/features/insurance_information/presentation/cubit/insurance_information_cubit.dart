import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salamaty/features/insurance_information/data/models/scan_response_model.dart';
import 'package:salamaty/features/insurance_information/data/repos/insurance_information_repo.dart';

part 'insurance_information_state.dart';

class InsuranceInformationCubit extends Cubit<InsuranceInformationState> {
  final InsuranceInformationRepo repo;

  InsuranceInformationCubit({required this.repo})
      : super(InsuranceInformationInitial());

  String? scannedName;
  String? scannedId;
  String? scannedProvider;
  String? scannedPolicy;
  String? scannedValidDate;
  String? scannedStatus;

  File? frontImage;

  void setFrontImage(File file) {
    frontImage = file;

    if (isClosed) return;

    emit(
      InsuranceInformationImagesUpdated(
        frontImage: frontImage,
      ),
    );
  }

  Future<ScanResponseModel?> scanFrontCard({
    required int providerId,
    required File frontImage,
  }) async {
    if (isClosed) return null;

    emit(InsuranceInformationScanLoading());

    try {
      final result = await repo.scanCard(
        providerId: providerId,
        frontImage: frontImage,
      );

      if (isClosed) return null;

      if (result.success) {
        scannedName = result.scannedName;
        scannedId = result.scannedId;
        scannedProvider = result.scannedProvider;
        scannedPolicy = result.scannedPolicy;
        scannedValidDate = result.scannedValidDate;
        scannedStatus = result.scannedStatus;

        emit(
          InsuranceInformationScanSuccess(
            response: result,
          ),
        );
      } else {
        emit(
          InsuranceInformationScanMismatch(
            message: result.message,
          ),
        );
      }

      return result;
    } on DioException catch (e) {
      if (isClosed) return null;

      final responseData = e.response?.data;

      String message = 'Something went wrong. Please try again.';

      if (responseData is Map && responseData['message'] != null) {
        message = responseData['message'].toString();
      }

      if (e.response?.statusCode == 400) {
        emit(
          InsuranceInformationScanMismatch(
            message: message,
          ),
        );
      } else {
        emit(
          InsuranceInformationError(
            message: message,
          ),
        );
      }

      return null;
    } catch (e) {
      if (isClosed) return null;

      emit(
        InsuranceInformationError(
          message: 'Unexpected error occurred.',
        ),
      );

      return null;
    }
  }

  Future<void> submitInfo({
    required String userId,
    required int providerId,
    required String cardHolderId,
    required String fullName,
    String? policyNumber,
    String? validUntil,
    String? status,
  }) async {
    if (frontImage == null) {
      if (isClosed) return;

      emit(InsuranceInformationMissingImages());

      return;
    }

    if (isClosed) return;

    emit(InsuranceInformationSubmitLoading());

    try {
      await repo.submitInsuranceInfo(
        userId: userId,
        providerId: providerId,
        cardHolderId: cardHolderId,
        policyNumber: policyNumber,
        validUntil: validUntil,
        status: status,
        fullName: fullName,
        frontImage: frontImage!,
      );

      if (isClosed) return;

      emit(InsuranceInformationSubmitSuccess());
    } on DioException catch (e) {
      if (isClosed) return;

      print('=== SUBMIT ERROR FULL ===');
      print('Status Code: ${e.response?.statusCode}');
      print('Response Data: ${e.response?.data}');
      print('Response Data Type: ${e.response?.data.runtimeType}');
      print('Headers: ${e.response?.headers}');
      print('Message: ${e.message}');

      String errorMsg = 'Error submitting';
      final responseData = e.response?.data;

      if (responseData is Map) {
        errorMsg = responseData['message']?.toString() ??
            responseData['errors']?.toString() ??
            responseData['title']?.toString() ??
            responseData.toString();
      } else if (responseData is String) {
        errorMsg = responseData;
      } else {
        errorMsg = e.message ?? 'Unknown error';
      }

      emit(
        InsuranceInformationError(
          message: errorMsg,
        ),
      );
    } catch (e) {
      if (isClosed) return;

      print('=== UNKNOWN SUBMIT ERROR ===');
      print(e.toString());

      emit(
        InsuranceInformationError(
          message: e.toString(),
        ),
      );
    }
  }
}