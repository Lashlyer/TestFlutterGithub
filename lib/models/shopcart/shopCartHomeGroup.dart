

import 'package:json_annotation/json_annotation.dart';
import 'package:shopping_list/models/shopcart/shopCartHomeItem.dart';

part 'shopCartHomeGroup.g.dart';

@JsonSerializable()
class ShopCartHomeGroup {

  final String type;
  final String name;
  final int count;
  final List<ShopCartHomeItem> items;

  ShopCartHomeGroup({required this.type, required this.name, required this.count, required this.items});

  factory ShopCartHomeGroup.fromJson(Map<String, dynamic> json) => _$ShopCartHomeGroupFromJson(json);

}

enum ShopCartType {
  normal,
  sponsor,
  preorder
}

extension ShopCartTypeExtensions on ShopCartType {
  static ShopCartType typeCheck(String type) {
    switch (type) {
      case 'normal':
        return ShopCartType.normal;
      case 'donate':
        return ShopCartType.sponsor;
      case 'preorder':
        return ShopCartType.preorder;
      default:
        throw ArgumentError('dddd');
    }
  }
}