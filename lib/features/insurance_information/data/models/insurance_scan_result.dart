// class InsuranceScanResult {
//   final String message;
//   final String? scannedId;
//   final String? scannedName;
//   final String? scannedHolderName;
//   final String? scannedPolicy;
//   final String? frontImagePath;
//   final String? backImagePath;

//   InsuranceScanResult({
//     required this.message,
//     this.scannedId,
//     this.scannedName,
//     this.scannedHolderName,
//     this.scannedPolicy,
//     this.frontImagePath,
//     this.backImagePath,
//   });

//   factory InsuranceScanResult.fromJson(Map<String, dynamic> json) {
//     return InsuranceScanResult(
//       message: json['message'] ?? '',
//       scannedId: json['scannedId'],
//       scannedName: json['scannedName'],
//       scannedHolderName: json['scannedHolderName'],
//       scannedPolicy: json['scannedPolicy'],
//       frontImagePath: json['frontImagePath'],
//       backImagePath: json['backImagePath'],
//     );
//   }
// }

// lib\features\insurance_information\data\models\insurance_scan_result.dart

class InsuranceScanResult {
  final String message;
  final String? scannedId;
  final String? scannedName;
  final String? scannedHolderName;
  final String? scannedPolicy;
  final String? frontImagePath;
  final String? backImagePath;

  InsuranceScanResult({
    required this.message,
    this.scannedId,
    this.scannedName,
    this.scannedHolderName,
    this.scannedPolicy,
    this.frontImagePath,
    this.backImagePath,
  });

  factory InsuranceScanResult.fromJson(Map<String, dynamic> json) {
    // الـ API بيرجع { success, message, data: { scannedId, scannedName, ... } }
    final data = json['data'] as Map<String, dynamic>? ?? json;
    return InsuranceScanResult(
      message: json['message'] ?? '',
      scannedId: data['scannedId'],
      scannedName: data['scannedName'],
      scannedHolderName: data['scannedHolderName'],
      scannedPolicy: data['scannedPolicy'],
      frontImagePath: data['frontImagePath'],
      backImagePath: data['backImagePath'],
    );
  }
}