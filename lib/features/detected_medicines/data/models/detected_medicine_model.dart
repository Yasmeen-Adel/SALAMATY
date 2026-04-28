class DetectedMedicineModel {
  final List<String> extractedMedicines;
  final List<Medicine> availableMedicines;
  final List<Medicine> notAvailableMedicines;

  DetectedMedicineModel({
    required this.extractedMedicines,
    required this.availableMedicines,
    required this.notAvailableMedicines,
  });

  factory DetectedMedicineModel.fromJson(Map<String, dynamic> json) {
    final data = json['data'];

    return DetectedMedicineModel(
      extractedMedicines:
          List<String>.from(data['extractedMedicines'] ?? []),
      availableMedicines: (data['availableMedicines'] as List)
          .map((e) => Medicine.fromJson(e))
          .toList(),
      notAvailableMedicines: (data['notAvailableMedicines'] as List)
          .map((e) => Medicine.fromJson(e))
          .toList(),
    );
  }
}

class Medicine {
  final int? id;
  final String name;
  final double? price;
  final String? imageUrl;
  final bool? isAvailable;

  Medicine({
    this.id,
    required this.name,
    this.price,
    this.imageUrl,
    this.isAvailable,
  });

  factory Medicine.fromJson(Map<String, dynamic> json) {
    return Medicine(
      id: json['id'],
      name: json['name'] ?? '',
      price: (json['price'] ?? 0).toDouble(),
      imageUrl: json['imageUrl'],
      isAvailable: json['isAvailable'],
    );
  }
}