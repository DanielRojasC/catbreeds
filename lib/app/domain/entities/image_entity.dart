final class ImageEntity {
  final String id;
  final int width;
  final int height;
  final String url;

  ImageEntity({
    required this.id,
    required this.width,
    required this.height,
    required this.url,
  });
  factory ImageEntity.fromJson(Map<String, dynamic> json) {
    return ImageEntity(
      id: json['id'] ?? "",
      width: json['width'] ?? 0,
      height: json['height'] ?? 0,
      url: json['url'] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'width': width,
      'height': height,
      'url': url,
    };
  }
}
