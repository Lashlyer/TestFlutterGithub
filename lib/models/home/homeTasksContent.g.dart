// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'homeTasksContent.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaskContent _$TaskContentFromJson(Map<String, dynamic> json) => TaskContent(
      type: json['type'] as String?,
      name: json['name'] as String?,
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : TaskContentItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TaskContentToJson(TaskContent instance) =>
    <String, dynamic>{
      'type': instance.type,
      'name': instance.name,
      'items': instance.items,
    };
