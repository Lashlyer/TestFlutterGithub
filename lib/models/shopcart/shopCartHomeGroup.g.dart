// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shopCartHomeGroup.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShopCartHomeGroup _$ShopCartHomeGroupFromJson(Map<String, dynamic> json) =>
    ShopCartHomeGroup(
      type: json['type'] as String,
      name: json['name'] as String,
      count: (json['count'] as num).toInt(),
      items: (json['items'] as List<dynamic>)
          .map((e) => ShopCartHomeItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ShopCartHomeGroupToJson(ShopCartHomeGroup instance) =>
    <String, dynamic>{
      'type': instance.type,
      'name': instance.name,
      'count': instance.count,
      'items': instance.items,
    };
