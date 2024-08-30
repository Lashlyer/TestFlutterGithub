// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shopCartHomeList.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShopCartHomeList _$ShopCartHomeListFromJson(Map<String, dynamic> json) =>

    ShopCartHomeList(
      groups: (json['groups'] as List<dynamic>)
          .map((e) => ShopCartHomeGroup.fromJson(e as Map<String, dynamic>))
          .toList()
    );

Map<String, dynamic> _$ShopCartHomeListToJson(ShopCartHomeList instance) =>
    <String, dynamic>{
      'groups': instance.groups,
    };
