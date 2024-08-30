// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'homePromotion.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomePromotion _$HomePromotionFromJson(Map<String, dynamic> json) =>
    HomePromotion(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      image: json['image'] as String,
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => HomePromotionItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HomePromotionToJson(HomePromotion instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'items': instance.items,
    };
