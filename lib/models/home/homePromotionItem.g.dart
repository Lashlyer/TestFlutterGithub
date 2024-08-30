// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'homePromotionItem.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomePromotionItem _$HomePromotionItemFromJson(Map<String, dynamic> json) =>
    HomePromotionItem(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      brand: json['brand'] as String,
      category: json['category'] as String,
      type: json['type'] as String?,
      image: json['image'] as String,
      stamp: json['stamp'] as String?,
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
      promotion: json['promotion'] as String,
      newest: json['newest'] as bool,
      collected: (json['collected'] as num).toInt(),
      status: (json['status'] as num).toInt(),
      price: (json['price'] as num).toInt(),
      salePrice: (json['salePrice'] as num).toInt(),
    );

Map<String, dynamic> _$HomePromotionItemToJson(HomePromotionItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'brand': instance.brand,
      'category': instance.category,
      'type': instance.type,
      'image': instance.image,
      'stamp': instance.stamp,
      'tags': instance.tags,
      'promotion': instance.promotion,
      'newest': instance.newest,
      'collected': instance.collected,
      'status': instance.status,
      'price': instance.price,
      'salePrice': instance.salePrice,
    };
