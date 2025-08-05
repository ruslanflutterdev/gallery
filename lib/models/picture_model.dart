class PictureModel {
  final int id;
  final String url;

  PictureModel({required this.id, required this.url});

  factory PictureModel.fromJson(Map<String, dynamic> json) {
    return PictureModel(id: json['id'] as int, url: json['url'] as String);
  }
}
