

import 'package:json_annotation/json_annotation.dart';
import 'package:shopping_list/models/home/homeActivity.dart';
import 'package:shopping_list/models/home/homeArticle.dart';
import 'package:shopping_list/models/home/homeBanner.dart';
import 'package:shopping_list/models/home/homePromotion.dart';
import 'package:shopping_list/models/home/homeRecipe.dart';
import 'package:shopping_list/models/home/homeTasks.dart';
import 'package:shopping_list/models/home/leezenShortcuts.dart';

part 'LeezenHome.g.dart';

@JsonSerializable()
class LeezenHome {

  LeezenHome(this.banners, this.shortcuts, this.promotions, this.activities, this.recipes, this.articles);

  // final List<dynamic> announces;
  final List<HomeBanner> banners;
  final List<LeezenHomeShortucts> shortcuts;
  // final HomeTasks? tasks;
  final List<HomePromotion> promotions;
  final List<HomeActivity> activities;
  final List<HomeRecipe> recipes;
  final List<HomeArticle> articles;
  // final dynamic adver1;
  // final dynamic adver2;

  factory LeezenHome.fromJson(Map<String, dynamic> json) => _$LeezenHomeFromJson(json);

  Map<String, dynamic> toJson() => _$LeezenHomeToJson(this);

  // factory LeezenHome.fromJson(Map<String, dynamic> json) {
  //   List<LeezenHomeBanner> banners = [];
  //   List<LeezenHomeShortucts> shortcuts = [];
  //   final bannersJson = json['banners'];
  //   final shorttcutsjson = json['shortcuts'];
  //   final tasks = HomeTasks.fromJson(json['tasks']);

 
  //   if (bannersJson != []) {
  //     for (final b in bannersJson) {
  //       banners.add(LeezenHomeBanner.fromjson(b));
  //     }
  //   }

  //   if (shorttcutsjson != []) {
  //     for (final s in shorttcutsjson) {
  //       shortcuts.add(LeezenHomeShortucts.fromjson(s));
  //     }
  //   }
  //   // print(tasks);
  //   return LeezenHome(banners, shortcuts, tasks);
  // } 

}



