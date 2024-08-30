


import 'package:json_annotation/json_annotation.dart';

part 'homeBanner.g.dart';

@JsonSerializable()
class HomeBanner {

  HomeBanner({required this.id, required this.name, required this.image, required this.link});

  final int? id;
  final String? name;
  final String image;
  final String? link;

  factory HomeBanner.fromJson(Map<String, dynamic> json) =>
      _$HomeBannerFromJson(json);

  Map<String, dynamic> toJson() => _$HomeBannerToJson(this);

}