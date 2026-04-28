class InsuranceProvider {
  final int id;
  final String name;
  final String? logoUrl;
  final String? policyNumber;
  final String? validUntil;
 
  InsuranceProvider({
    required this.id,
    required this.name,
    this.logoUrl,
    this.policyNumber,
    this.validUntil,
  });
 
  factory InsuranceProvider.fromJson(Map<String, dynamic> json) {
    return InsuranceProvider(
      id: json['id'],
      name: json['name'],
      logoUrl: json['logoUrl'],
      policyNumber: json['policyNumber'],
      validUntil: json['validUntil'],
    );
  }
}