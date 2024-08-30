// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'homeTaskMeta.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Meta _$MetaFromJson(Map<String, dynamic> json) => Meta(
      (json['progress'] as num?)?.toInt(),
      (json['max'] as num?)?.toInt(),
    );

Map<String, dynamic> _$MetaToJson(Meta instance) => <String, dynamic>{
      'progress': instance.progress,
      'max': instance.max,
    };
