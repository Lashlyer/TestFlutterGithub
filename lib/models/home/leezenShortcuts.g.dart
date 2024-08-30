// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leezenShortcuts.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LeezenHomeShortucts _$LeezenHomeShortuctsFromJson(Map<String, dynamic> json) =>
    LeezenHomeShortucts(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      image: json['image'] as String,
      link: json['link'] as String?,
    );

Map<String, dynamic> _$LeezenHomeShortuctsToJson(
        LeezenHomeShortucts instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'link': instance.link,
    };
