// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'homeTasks.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeTasks _$HomeTasksFromJson(Map<String, dynamic> json) => HomeTasks(
      meta: json['meta'] == null
          ? null
          : Meta.fromJson(json['meta'] as Map<String, dynamic>),
      content: (json['content'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : TaskContent.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HomeTasksToJson(HomeTasks instance) => <String, dynamic>{
      'meta': instance.meta,
      'content': instance.content,
    };
