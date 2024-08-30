

import 'package:shopping_list/models/home/homeArticle.dart';
import 'package:shopping_list/models/home/homePromotionItem.dart';

import 'package:json_annotation/json_annotation.dart';

part 'homePromotion.g.dart';

@JsonSerializable()
class HomePromotion {

    int id;
    String name;
    String image;
    List<HomePromotionItem>? items;

    HomePromotion({
        required this.id,
        required this.name,
        required this.image,
        this.items,
    });

  factory HomePromotion.fromJson(Map<String, dynamic> json) =>
      _$HomePromotionFromJson(json);

  Map<String, dynamic> toJson() => _$HomePromotionToJson(this);
}

enum Tag {
    EMPTY,
    PURPLE,
    TAG
}

final tagValues = EnumValues({
    "純素": Tag.EMPTY,
    "冷凍": Tag.PURPLE,
    "線上專賣": Tag.TAG
});