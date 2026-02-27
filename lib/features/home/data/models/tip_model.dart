class TipModel {
  final int id;
  final String title;
  final String summary;
  final String imageUrl;
  final String detailsUrl;

  TipModel({
    required this.id,
    required this.title,
    required this.summary,
    required this.imageUrl,
    required this.detailsUrl,
  });

  factory TipModel.fromJson(Map<String, dynamic> json) {
    return TipModel(
      id: json['id'],
      title: json['title'],
      summary: json['summary'],
      imageUrl: json['imageUrl'],
      detailsUrl: json['detailsUrl'],
    );
  }
}