final class WeightEntity {
  final String imperial;
  final String metric;

  WeightEntity({required this.imperial, required this.metric});

  factory WeightEntity.fromJson(Map<String, dynamic> json) {
    return WeightEntity(
      imperial: json['imperial'] ?? "",
      metric: json['metric'] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'imperial': imperial,
      'metric': metric,
    };
  }
}
