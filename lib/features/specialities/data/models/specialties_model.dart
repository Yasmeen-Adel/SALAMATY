class SpecialtiesModel {
  final int id;
  final String providerName;
  final String specialty;
  final String governorate;
  final String workingHours;
  final String phone;
  final String locationUrl;
  final double distance;

  SpecialtiesModel({
    required this.id,
    required this.providerName,
    required this.specialty,
    required this.governorate,
    required this.workingHours,
    required this.phone,
    required this.locationUrl,
    required this.distance,
  });

  factory SpecialtiesModel.fromJson(Map<String, dynamic> json) {
    return SpecialtiesModel(
      id: json['id'],
      providerName: json['providerName'],
      specialty: json['specialty'],
      governorate: json['governorate'],
      workingHours: json['workingHours'],
      phone: json['phone'],
      locationUrl: json['locationUrl'],
      distance: (json['distance'] ?? 0).toDouble(),
    );
  }
}