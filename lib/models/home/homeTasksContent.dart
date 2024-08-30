import 'package:json_annotation/json_annotation.dart';
import 'package:shopping_list/models/home/homeTasksContentItem.dart';

part 'homeTasksContent.g.dart';

enum TaskContentType { notice, video, article, activity, share }

@JsonSerializable()
class TaskContent {
  TaskContent({required this.type, required this.name, required this.items});

  final String? type;
  final String? name;
  final List<TaskContentItem?>? items;

  TaskContentType getContentType() {
    switch (type) {
      case 'notice':
        return TaskContentType.notice;
      case 'video':
        return TaskContentType.video;
      case 'article':
        return TaskContentType.article;
      case 'activity':
        return TaskContentType.activity;
      case 'share':
        return TaskContentType.share;
    }
    return TaskContentType.notice;
  }

  factory TaskContent.fromJson(Map<String, dynamic> json) =>
      _$TaskContentFromJson(json);

  Map<String, dynamic> toJson() => _$TaskContentToJson(this);
}
