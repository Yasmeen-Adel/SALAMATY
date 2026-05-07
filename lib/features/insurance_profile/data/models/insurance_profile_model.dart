

class InsuranceProfileModel {
  final String fullName;
  final String cardHolderId;
  final ProviderInfo provider;
  final CoverageInfo coverage;

  InsuranceProfileModel({
    required this.fullName,
    required this.cardHolderId,
    required this.provider,
    required this.coverage,
  });

  factory InsuranceProfileModel.fromJson(Map<String, dynamic> json) {
    return InsuranceProfileModel(
      fullName: json['user']?['fullName'] ?? json['fullName'] ?? '',
      cardHolderId: json['user']?['cardHolderId'] ?? json['cardHolderId'] ?? '',
      provider: ProviderInfo.fromJson(json['provider'] ?? {}),
      coverage: CoverageInfo.fromJson(json['coverage'] ?? {}),
    );
  }
}

class ProviderInfo {
  final int? id;
  final String name;
  final String? logoUrl;
  final String? policyNumber;
  final String? validUntil;
  final String? status;

  ProviderInfo({
    this.id,
    required this.name,
    this.logoUrl,
    this.policyNumber,
    this.validUntil,
    this.status,
  });

  factory ProviderInfo.fromJson(Map<String, dynamic> json) {
    return ProviderInfo(
      id: json['id'],
      name: json['name'] ?? '',
      logoUrl: json['logoUrl'],
      policyNumber: json['policyNumber'],
      validUntil: json['validUntil'],
      status: json['status'],
    );
  }
}

class CoverageInfo {
  final CoverageItem medicines;
  final CoverageItem labTests;
  final CoverageItem hospitals;

  CoverageInfo({
    required this.medicines,
    required this.labTests,
    required this.hospitals,
  });

  factory CoverageInfo.fromJson(Map<String, dynamic> json) {
    return CoverageInfo(
      medicines: CoverageItem.fromJson(json['medicines'] ?? {}),
      labTests: CoverageItem.fromJson(json['labTests'] ?? {}),
      hospitals: CoverageItem.fromJson(json['hospitals'] ?? {}),
    );
  }
}

class CoverageItem {
  final bool isCovered;
  final List<String> items;

  CoverageItem({required this.isCovered, required this.items});

  factory CoverageItem.fromJson(Map<String, dynamic> json) {
    return CoverageItem(
      isCovered: json['isCovered'] ?? false,
      items: List<String>.from(json['items'] ?? []),
    );
  }
}
