class MedicineDetailsModel {
  final int id;
  final String name;
  final double price;
  final String imageUrl;
  final String category;
  final String description;
  final String sideEffects;

  MedicineDetailsModel({
    required this.id,
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.category,
    required this.description,
    required this.sideEffects,
  });

  factory MedicineDetailsModel.fromJson(Map<String, dynamic> json) {
    return MedicineDetailsModel(
      id: json['id'],
      name: json['name'],
      price: (json['price'] is num)
          ? (json['price'] as num).toDouble()
          : double.tryParse(json['price'].toString()) ?? 0.0,
      imageUrl: json['imageUrl'] ?? '',
      category: json['category'] ?? '',
      description: json['description'] ?? '',
      sideEffects: json['sideEffects'] ?? '',
    );
  }
}
