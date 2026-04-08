class DrugStoreProduct {
  final int id;
  final String name;
  final double price;
  final String imageUrl;
  final String category;

  DrugStoreProduct({
    required this.id,
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.category,
  });

  factory DrugStoreProduct.fromJson(Map<String, dynamic> json) {
    return DrugStoreProduct(
      id: json['id'],
      name: json['name'],
      price: (json['price'] is num)
          ? (json['price'] as num).toDouble()
          : double.tryParse(json['price'].toString()) ?? 0.0,
      imageUrl: json['imageUrl'],
      category: json['category'],
    );
  }
}
