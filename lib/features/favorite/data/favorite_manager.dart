class FavoriteManager {
  static final List<Map<String, dynamic>> _favorites = [];

  static List<Map<String, dynamic>> get favorites => _favorites;

  static bool isFavorite(String title) {
    return _favorites.any((item) => item['title'] == title);
  }

  static void toggleFavorite(Map<String, dynamic> medicine) {
    if (isFavorite(medicine['title'])) {
      _favorites.removeWhere((item) => item['title'] == medicine['title']);
    } else {
      _favorites.add(medicine);
    }
  }

  static void remove(String title) {
    _favorites.removeWhere((item) => item['title'] == title);
  }
}