// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'homeTasksContentItem.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaskContentItem _$TaskContentItemFromJson(Map<String, dynamic> json) =>
    TaskContentItem(
      id: (json['id'] as num).toInt(),
      status: json['status'] as String?,
      title: json['title'] as String?,
      image: json['image'] as String,
      point: (json['point'] as num).toInt(),
      complete: json['complete'] as bool,
      name: json['name'] as String?,
      link: json['link'] as String?,
      summary: json['summary'] as String?,
      task: (json['task'] as num?)?.toInt(),
      category: json['category'] as String?,
      newest: json['newest'] as bool?,
      collected: (json['collected'] as num?)?.toInt(),
      startTime: json['startTime'] as String?,
      endTime: json['endTime'] as String?,
    );

Map<String, dynamic> _$TaskContentItemToJson(TaskContentItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': instance.status,
      'title': instance.title,
      'image': instance.image,
      'point': instance.point,
      'complete': instance.complete,
      'name': instance.name,
      'link': instance.link,
      'summary': instance.summary,
      'task': instance.task,
      'category': instance.category,
      'newest': instance.newest,
      'collected': instance.collected,
      'startTime': instance.startTime,
      'endTime': instance.endTime,
    };
