
class NearbyService {
  final int id;
  final String name;
  final String type;
  final String address;
  final double? latitude;
  final double? longitude;
  final double? distanceKm;
  final String? status;
  final bool? openNow;
  final String? locationUrl;
  final String? phone; // ← NEW

  NearbyService({
    required this.id,
    required this.name,
    required this.type,
    required this.address,
    this.latitude,
    this.longitude,
    this.distanceKm,
    this.status,
    this.openNow,
    this.locationUrl,
    this.phone, // ← NEW
  });

  factory NearbyService.fromJson(Map<String, dynamic> json) {
    return NearbyService(
      id: json['id'],
      name: json['name'] ?? '',
      type: json['type'] ?? '',
      address: json['address'] ?? '',
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      distanceKm: (json['distanceKm'] as num?)?.toDouble(),
      status: json['status'],
      openNow: json['openNow'],
      locationUrl: json['locationUrl'],
      phone: json['phone'], // ← NEW
    );
  }
}