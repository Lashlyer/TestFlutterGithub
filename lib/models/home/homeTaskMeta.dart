
import 'package:json_annotation/json_annotation.dart';

part 'homeTaskMeta.g.dart';

@JsonSerializable()

class Meta {

  Meta(this.progress, this.max);

  final int? progress;
  final int? max;

  factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);

  Map<String, dynamic> toJson() => _$MetaToJson(this);
  
}