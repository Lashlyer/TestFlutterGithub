
import 'package:json_annotation/json_annotation.dart';

part 'homeArticle.g.dart';

@JsonSerializable()
class HomeArticle {
  int id;
  String type;
  String title;
  String image;
  String vege;
  String category;
  bool newest;
  int collected;
  int point;

  HomeArticle({
    required this.id,
    required this.type,
    required this.title,
    required this.image,
    required this.vege,
    required this.category,
    required this.newest,
    required this.collected,
    required this.point,
  });

  factory HomeArticle.fromJson(Map<String, dynamic> json) =>
      _$HomeArticleFromJson(json);

  Map<String, dynamic> toJson() => _$HomeArticleToJson(this);
}

enum TypeEnum { ARTICLE, RECIPE }

final typeEnumValues =
    EnumValues({"article": TypeEnum.ARTICLE, "recipe": TypeEnum.RECIPE});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
