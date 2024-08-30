
import 'package:json_annotation/json_annotation.dart';

part 'leezenShortcuts.g.dart';

@JsonSerializable()
class LeezenHomeShortucts {

  LeezenHomeShortucts({required this.id, required this.name, required this.image, required this.link});

  final int? id;
  final String? name;
  final String image;
  final String? link;


    factory LeezenHomeShortucts.fromJson(Map<String, dynamic> json) => _$LeezenHomeShortuctsFromJson(json);

  Map<String, dynamic> toJson() => _$LeezenHomeShortuctsToJson(this);
}

extension StringExtension on String {
  String withLeeznUrl() {
    return 'https://d1ireumi1ecmwq.cloudfront.net$this';
  }
}