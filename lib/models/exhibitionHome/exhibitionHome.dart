

import 'package:shopping_list/models/exhibitionHome/activity.dart';
import 'package:shopping_list/models/exhibitionHome/exhibition.dart';
import 'package:shopping_list/models/exhibitionHome/recipe.dart';
import 'package:shopping_list/models/exhibitionHome/topic.dart';

class ExhibitionHome {
    List<Exhibition> exhibitions;
    List<Activity> activities;
    List<Recipe> recipes;
    List<Topic> topics;

    ExhibitionHome({
        required this.exhibitions,
        required this.activities,
        required this.recipes,
        required this.topics,
    });

    factory ExhibitionHome.fromJson(Map<String, dynamic> json) => ExhibitionHome(
        exhibitions: List<Exhibition>.from(json["exhibitions"].map((x) => Exhibition.fromJson(x))),
        activities: List<Activity>.from(json["activities"].map((x) => Activity.fromJson(x))),
        recipes: List<Recipe>.from(json["recipes"].map((x) => Recipe.fromJson(x))),
        topics: List<Topic>.from(json["topics"].map((x) => Topic.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "exhibitions": List<dynamic>.from(exhibitions.map((x) => x.toJson())),
        "activities": List<dynamic>.from(activities.map((x) => x.toJson())),
        "recipes": List<dynamic>.from(recipes.map((x) => x.toJson())),
        "topics": List<dynamic>.from(topics.map((x) => x.toJson())),
    };
}