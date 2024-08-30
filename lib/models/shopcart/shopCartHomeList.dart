

import 'package:json_annotation/json_annotation.dart';
import 'package:shopping_list/models/shopcart/shopCartHomeGroup.dart';

part 'shopCartHomeList.g.dart';

@JsonSerializable()
class ShopCartHomeList {

  final List<ShopCartHomeGroup> groups;

  ShopCartHomeList({required this.groups});

  factory ShopCartHomeList.fromJson(Map<String, dynamic> json) => _$ShopCartHomeListFromJson(json);

}