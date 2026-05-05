

// lib\features\insurance_information\data\models\insurance_scan_result.dart

class InsuranceScanResult {
  final String message;
  final String? scannedId;
  final String? scannedName;
  final String? scannedHolderName;
  final String? scannedPolicy;
  final String? scannedValidDate;
  final String? scannedStatus;
  final String? scannedProvider;
  final String? frontImagePath;
  final String? backImagePath;

  InsuranceScanResult({
    required this.message,
    this.scannedId,
    this.scannedName,
    this.scannedHolderName,
    this.scannedPolicy,
    this.scannedValidDate,
    this.scannedStatus,
    this.scannedProvider,
    this.frontImagePath,
    this.backImagePath,
  });

  factory InsuranceScanResult.fromJson(Map<String, dynamic> json) {
    final data = json['data'] as Map<String, dynamic>? ?? json;

    // API بيرجع scannedName للاسم — fallback على كل الأسماء المحتملة
    final name = data['scannedName'] ??
        data['fullName'] ??
        data['cardHolderName'] ??
        data['holderName'];

    return InsuranceScanResult(
      message: json['message'] ?? '',
      scannedId: data['scannedId'],
      scannedName: name,
      scannedHolderName: data['scannedHolderName'],
      scannedPolicy: data['scannedPolicy'],
      scannedValidDate: data['scannedValidDate'],
      scannedStatus: data['scannedStatus'],
      scannedProvider: data['scannedProvider'],
      frontImagePath: data['frontImagePath'],
      backImagePath: data['backImagePath'],
    );
  }
}
