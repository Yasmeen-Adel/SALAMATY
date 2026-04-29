class NearbyPharmacy {
  final int id;
  final String name;
  final String type;
  final double distanceKm;
  final String distanceText;
  final String address;
  final String openStatusText;
  final bool isOpenNow;
  final String phone;
  final double latitude;
  final double longitude;
  final String locationUrl;

  NearbyPharmacy({
    required this.id,
    required this.name,
    required this.type,
    required this.distanceKm,
    required this.distanceText,
    required this.address,
    required this.openStatusText,
    required this.isOpenNow,
    required this.phone,
    required this.latitude,
    required this.longitude,
    required this.locationUrl,
  });

  factory NearbyPharmacy.fromJson(Map<String, dynamic> json) {
    return NearbyPharmacy(
      id: json['id'],
      name: json['name'],
      type: json['type'],
      distanceKm: (json['distanceKm'] is num)
          ? (json['distanceKm'] as num).toDouble()
          : double.tryParse(json['distanceKm'].toString()) ?? 0.0,
      distanceText: json['distanceText'] ?? '',
      address: json['address'] ?? '',
      openStatusText: json['openStatusText'] ?? '',
      isOpenNow: json['isOpenNow'] ?? false,
      phone: json['phone'] ?? '',
      latitude: (json['latitude'] is num)
          ? (json['latitude'] as num).toDouble()
          : double.tryParse(json['latitude'].toString()) ?? 0.0,
      longitude: (json['longitude'] is num)
          ? (json['longitude'] as num).toDouble()
          : double.tryParse(json['longitude'].toString()) ?? 0.0,
      locationUrl: json['locationUrl'] ?? '',
    );
  }
}