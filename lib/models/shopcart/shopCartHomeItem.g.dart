// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shopCartHomeItem.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShopCartHomeItem _$ShopCartHomeItemFromJson(Map<String, dynamic> json) =>
    ShopCartHomeItem(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      image: json['image'] as String,
    );

Map<String, dynamic> _$ShopCartHomeItemToJson(ShopCartHomeItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
    };
