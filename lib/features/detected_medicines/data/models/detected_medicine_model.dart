class DetectedMedicineModel {
  final int id;
  final String name;
  final String imageUrl;
  final String description;

  DetectedMedicineModel({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.description,
  });

  factory DetectedMedicineModel.fromJson(Map<String, dynamic> json) {
    return DetectedMedicineModel(
      id: json['id'],
      name: json['name'],
      imageUrl: json['imageUrl'],
      description: json['description'],
    );
  }
}
