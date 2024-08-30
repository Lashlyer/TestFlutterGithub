// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'LeezenHome.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LeezenHome _$LeezenHomeFromJson(Map<String, dynamic> json) => LeezenHome(
      (json['banners'] as List<dynamic>)
          .map((e) => HomeBanner.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['shortcuts'] as List<dynamic>)
          .map((e) => LeezenHomeShortucts.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['promotions'] as List<dynamic>)
          .map((e) => HomePromotion.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['activities'] as List<dynamic>)
          .map((e) => HomeActivity.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['recipes'] as List<dynamic>)
          .map((e) => HomeRecipe.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['articles'] as List<dynamic>)
          .map((e) => HomeArticle.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LeezenHomeToJson(LeezenHome instance) =>
    <String, dynamic>{
      'banners': instance.banners,
      'shortcuts': instance.shortcuts,
      'promotions': instance.promotions,
      'activities': instance.activities,
      'recipes': instance.recipes,
      'articles': instance.articles,
    };
