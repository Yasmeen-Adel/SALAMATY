class ScanResponseModel {
  final bool success;
  final String message;
  final String? scannedId;
  final String? scannedName;
  final String? scannedProvider;
  final String? scannedPolicy;
  final String? scannedValidDate;
  final String? scannedStatus;

  ScanResponseModel({
    required this.success,
    required this.message,
    this.scannedId,
    this.scannedName,
    this.scannedProvider,
    this.scannedPolicy,
    this.scannedValidDate,
    this.scannedStatus,
  });

  factory ScanResponseModel.fromJson(Map<String, dynamic> json) {
    final data = json['data'];
    return ScanResponseModel(
      success: json['success'] ?? false,
      message: json['message'] ?? '',
      scannedId: data?['scannedId']?.toString(),
      scannedName: data?['scannedName'],
      scannedProvider: data?['scannedProvider'],
      scannedPolicy: data?['scannedPolicy']?.toString(),
      scannedValidDate: data?['scannedValidDate']?.toString(),
      scannedStatus: data?['scannedStatus']?.toString(),
    );
  }
}