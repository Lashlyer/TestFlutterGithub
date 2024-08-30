

import 'package:shopping_list/models/home/homePromotion.dart';
import 'package:json_annotation/json_annotation.dart';

part 'homePromotionItem.g.dart';

@JsonSerializable()

class HomePromotionItem {
      int id;
    String name;
    String brand;
    String category;
    String? type;
    String image;
    String? stamp;
    List<String> tags;
    String promotion;
    bool newest;
    int collected;
    int status;
    int price;
    int salePrice;

    HomePromotionItem({
        required this.id,
        required this.name,
        required this.brand,
        required this.category,
        required this.type,
        required this.image,
        required this.stamp,
        required this.tags,
        required this.promotion,
        required this.newest,
        required this.collected,
        required this.status,
        required this.price,
        required this.salePrice,
    });

  factory HomePromotionItem.fromJson(Map<String, dynamic> json) =>
      _$HomePromotionItemFromJson(json);

  Map<String, dynamic> toJson() => _$HomePromotionItemToJson(this);


}