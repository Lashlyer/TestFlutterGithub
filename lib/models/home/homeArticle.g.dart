// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'homeArticle.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeArticle _$HomeArticleFromJson(Map<String, dynamic> json) => HomeArticle(
      id: (json['id'] as num).toInt(),
      type: json['type'] as String,
      title: json['title'] as String,
      image: json['image'] as String,
      vege: json['vege'] as String,
      category: json['category'] as String,
      newest: json['newest'] as bool,
      collected: (json['collected'] as num).toInt(),
      point: (json['point'] as num).toInt(),
    );

Map<String, dynamic> _$HomeArticleToJson(HomeArticle instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'title': instance.title,
      'image': instance.image,
      'vege': instance.vege,
      'category': instance.category,
      'newest': instance.newest,
      'collected': instance.collected,
      'point': instance.point,
    };
