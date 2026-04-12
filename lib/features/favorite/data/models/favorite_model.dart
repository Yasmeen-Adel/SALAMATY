class FavoriteModel {
  final int favoriteId;
  final int productId;
  final String name;
  final String imageUrl;
  final String description;

  FavoriteModel({
    required this.favoriteId,
    required this.productId,
    required this.name,
    required this.imageUrl,
    required this.description,
  });


  factory FavoriteModel.fromJson(Map<String, dynamic> json) {
    const baseUrl = 'http://salamaty.runasp.net/';

    final rawImage = json['product']['imageUrl'] ?? '';
    final fullImageUrl =
        rawImage.startsWith('http') ? rawImage : '$baseUrl$rawImage';

    return FavoriteModel(
      favoriteId: json['favoriteId'],
      productId: json['product']['id'],
      name: json['product']['name'],
      imageUrl: fullImageUrl, // 👈 هنا
      description: json['product']['description'] ?? '',
    );
  }
}
