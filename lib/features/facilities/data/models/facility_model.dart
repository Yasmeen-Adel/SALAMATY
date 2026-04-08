class FacilityModel {
  final int id;
  final String name;
  final String type;
  final String address;
  final String phone;
  final String operatingHours;
  final double distance;
  final String locationUrl;

  FacilityModel({
    required this.id,
    required this.name,
    required this.type,
    required this.address,
    required this.phone,
    required this.operatingHours,
    required this.distance,
    required this.locationUrl,
  });

  factory FacilityModel.fromJson(Map<String, dynamic> json) {
    return FacilityModel(
      id: json['id'],
      name: json['name'],
      type: json['type'],
      address: json['address'],
      phone: json['phoneNumber'],
      operatingHours: json['operatingHours'],
      distance: (json['distance'] as num).toDouble(),
      locationUrl: json['locationUrl'],
    );
  }
}