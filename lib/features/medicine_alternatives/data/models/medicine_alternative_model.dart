class MedicineAlternativeModel {
  final int id;
  final String name;
  final String description;
  final String imageUrl;

  MedicineAlternativeModel({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
  });

  factory MedicineAlternativeModel.fromJson(Map<String, dynamic> json) {
    return MedicineAlternativeModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
    );
  }
}