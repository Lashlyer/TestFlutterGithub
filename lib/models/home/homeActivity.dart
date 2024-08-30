import 'package:json_annotation/json_annotation.dart';

part 'homeActivity.g.dart';

@JsonSerializable()
class HomeActivity {
  int id;
  String name;
  String image;
  String summary;
  String category;
  bool newest;
  String? status;
  String startTime;
  String endTime;
  int point;

  HomeActivity({
    required this.id,
    required this.name,
    required this.image,
    required this.summary,
    required this.category,
    required this.newest,
    required this.status,
    required this.startTime,
    required this.endTime,
    required this.point,
  });

  factory HomeActivity.fromJson(Map<String, dynamic> json) =>
      _$HomeActivityFromJson(json);

  Map<String, dynamic> toJson() => _$HomeActivityToJson(this);
}
