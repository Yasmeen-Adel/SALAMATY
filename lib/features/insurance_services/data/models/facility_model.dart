class FacilityModel {
  final int id;
  final String name;
  final String type;
  final String? address;
  final double? distanceKm;
  final String status; // "open" or "closed"
  final String? openUntil;
  final double? latitude;
  final double? longitude;
  final String? phone;
  final String? locationUrl;

  FacilityModel({
    required this.id,
    required this.name,
    required this.type,
    this.address,
    this.distanceKm,
    required this.status,
    this.openUntil,
    this.latitude,
    this.longitude,
    this.phone,
    this.locationUrl,
  });

  bool get isOpen => status.toLowerCase() == 'open';

  factory FacilityModel.fromJson(Map<String, dynamic> json) {
    return FacilityModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      type: json['type'] ?? '',
      address: json['address'],
      distanceKm: (json['distanceKm'] as num?)?.toDouble(),
      status: json['status'] ?? 'closed',
      openUntil: json['openUntil'],
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      phone: json['phone'],
      locationUrl: json['locationUrl'],
    );
  }
}