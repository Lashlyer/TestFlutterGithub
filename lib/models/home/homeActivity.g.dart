// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'homeActivity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeActivity _$HomeActivityFromJson(Map<String, dynamic> json) => HomeActivity(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      image: json['image'] as String,
      summary: json['summary'] as String,
      category: json['category'] as String,
      newest: json['newest'] as bool,
      status: json['status'] as String?,
      startTime: json['startTime'] as String,
      endTime: json['endTime'] as String,
      point: (json['point'] as num).toInt(),
    );

Map<String, dynamic> _$HomeActivityToJson(HomeActivity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'summary': instance.summary,
      'category': instance.category,
      'newest': instance.newest,
      'status': instance.status,
      'startTime': instance.startTime,
      'endTime': instance.endTime,
      'point': instance.point,
    };
