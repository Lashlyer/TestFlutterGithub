// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'homeRecipe.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeRecipe _$HomeRecipeFromJson(Map<String, dynamic> json) => HomeRecipe(
      title: json['title'] as String,
      image1: json['image1'] as String,
      image2: json['image2'] as String,
      image3: json['image3'] as String,
      id: (json['id'] as num).toInt(),
    );

Map<String, dynamic> _$HomeRecipeToJson(HomeRecipe instance) =>
    <String, dynamic>{
      'title': instance.title,
      'image1': instance.image1,
      'image2': instance.image2,
      'image3': instance.image3,
      'id': instance.id,
    };
