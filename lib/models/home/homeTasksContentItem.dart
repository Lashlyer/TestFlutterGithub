
import 'package:json_annotation/json_annotation.dart';

part 'homeTasksContentItem.g.dart';

@JsonSerializable()
class TaskContentItem {

    TaskContentItem({
        required this.id,
        // this.type,
        this.status,
        this.title,
        required this.image,
        required this.point,
        required this.complete,
        this.name,
        this.link,
        this.summary,
        required this.task,
        // this.vege,
        this.category,
        this.newest,
        this.collected,
        this.startTime,
        this.endTime,
    });
    
    int id;
    // String? type;
    String? status;
    String? title;
    String image;
    int point;
    bool complete;
    String? name;
    String? link;
    String? summary;
    int? task;
    // String? vege;
    String? category;
    bool? newest;
    int? collected;
    String? startTime;
    String? endTime;

  factory TaskContentItem.fromJson(Map<String, dynamic> json) {
    return TaskContentItem(
      id: (json['id'] as num).toInt(), 
      status: (json['status'] as String?),
      title: (json['title'] as String?),
      name: (json['name'] as String?),
      link: (json['link'] as String?),
      image: (json['image'] as String), 
      point: (json['point'] as num).toInt(), 
      summary: (json['summary'] as String?),
      complete: (json['complete'] as bool), 
      category: (json['category'] as String?),
      collected: (json['collected'] as int?),
      startTime: (json['start_time'] as String?),
      endTime: (json['end_time'] as String?),
      newest: (json['newest'] as bool?),
      task: (json['task'] as int?));
  }

  Map<String, dynamic> toJson() => _$TaskContentItemToJson(this);
}