
import 'package:json_annotation/json_annotation.dart';

part 'shopCartHomeItem.g.dart';

@JsonSerializable()
class ShopCartHomeItem {

  ShopCartHomeItem({required this.id, required this.name, required this.image});

  final int id;
  final String name;
  final String image;

  factory ShopCartHomeItem.fromJson(Map<String, dynamic> json) => _$ShopCartHomeItemFromJson(json);

}