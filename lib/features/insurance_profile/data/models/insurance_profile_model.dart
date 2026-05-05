





class InsuranceProfileModel {
  final String fullName;
  final String cardHolderId;
  final ProfileProvider provider;
  final Coverage coverage;
  final LabTests labTests;

  InsuranceProfileModel({
    required this.fullName,
    required this.cardHolderId,
    required this.provider,
    required this.coverage,
    required this.labTests,
  });

  factory InsuranceProfileModel.fromJson(Map<String, dynamic> json) {
    final coverageJson = json['coverage'] ?? {};

    return InsuranceProfileModel(
      fullName: json['user']?['fullName'] ?? '',
      cardHolderId: json['user']?['cardHolderId'] ?? '',
      provider: ProfileProvider.fromJson(json['provider'] ?? {}),
      coverage: Coverage.fromJson(coverageJson),
      labTests: LabTests.fromJson(coverageJson['labTests'] ?? {}),
    );
  }
}

class ProfileProvider {
  final int id;
  final String name;
  final String? logoUrl;
  final String? policyNumber;
  final String? validUntil;
  final String? status;

  ProfileProvider({
    required this.id,
    required this.name,
    this.logoUrl,
    this.policyNumber,
    this.validUntil,
    this.status,
  });

  factory ProfileProvider.fromJson(Map<String, dynamic> json) {
    return ProfileProvider(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      logoUrl: json['logoUrl'],
      policyNumber: json['policyNumber'],
      validUntil: json['validUntil'],
      status: json['status'],
    );
  }
}

class Coverage {
  final Benefit medicines;
  final Benefit hospitals;

  Coverage({
    required this.medicines,
    required this.hospitals,
  });

  factory Coverage.fromJson(Map<String, dynamic> json) {
    return Coverage(
      medicines: Benefit.fromJson(json['medicines'] ?? {}),
      hospitals: Benefit.fromJson(json['hospitals'] ?? {}),
    );
  }
}

class Benefit {
  final bool isCovered;
  final List<String> items;

  Benefit({
    required this.isCovered,
    required this.items,
  });

  factory Benefit.fromJson(Map<String, dynamic> json) {
    return Benefit(
      isCovered: json['isCovered'] ?? false,
      items: List<String>.from(json['items'] ?? []),
    );
  }
}

class LabTests extends Benefit {
  LabTests({
    required super.isCovered,
    required super.items,
  });

  factory LabTests.fromJson(Map<String, dynamic> json) {
    return LabTests(
      isCovered: json['isCovered'] ?? false,
      items: List<String>.from(json['items'] ?? []),
    );
  }
}