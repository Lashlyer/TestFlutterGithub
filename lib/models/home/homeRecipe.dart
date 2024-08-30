import 'package:json_annotation/json_annotation.dart';

part 'homeRecipe.g.dart';

@JsonSerializable()
class HomeRecipe {

    String title;
    String image1;
    String image2;
    String image3;
    int id;

    HomeRecipe({
        required this.title,
        required this.image1,
        required this.image2,
        required this.image3,
        required this.id,
    }); 

      factory HomeRecipe.fromJson(Map<String, dynamic> json) =>
      _$HomeRecipeFromJson(json);

  Map<String, dynamic> toJson() => _$HomeRecipeToJson(this);
}