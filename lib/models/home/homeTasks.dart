
import 'package:json_annotation/json_annotation.dart';
import 'package:shopping_list/models/home/homeTaskMeta.dart';
import 'package:shopping_list/models/home/homeTasksContent.dart';

part 'homeTasks.g.dart';

@JsonSerializable()
class HomeTasks {
  
  final Meta? meta;
  final List<TaskContent?>? content;

  HomeTasks({required this.meta, required this.content});

  // factory HomeTasks.fromJson(Map<String, dynamic> json) => _$HomeTasksFromJson(json);

  factory HomeTasks.fromJson(Map<String, dynamic> json) {
    final Meta? metaJ;
    final List<TaskContent>? contents;
    if (json['meta'] != null) {
      metaJ = Meta.fromJson(json['meta']);
    } else {
      metaJ = null;
    }

    if (json['content'] != null) {
      
      contents = (json['content'] as List<dynamic>).map((e) => TaskContent.fromJson(e)).toList();

    } else {
      contents = [];
    }

    return HomeTasks(meta: metaJ, content: contents);
  }

  Map<String, dynamic> toJson() => _$HomeTasksToJson(this);

}