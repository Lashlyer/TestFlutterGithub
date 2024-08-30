

import 'package:shopping_list/models/deatilNutrition/nutrition.dart';

enum NutritionType {

  fat,
  sugar,
  calory,
  sodium,
  protein,
  transFat,
  carbohydrate,
  saturatedFat,
}

extension NutritionTypeExtention on NutritionType {
  String getTypeTitle() {
    switch (this) {
      case NutritionType.calory:
      return '熱量';
      case NutritionType.protein:
      return '蛋白質';
      case NutritionType.fat:
      return '脂肪';
      case NutritionType.saturatedFat:
      return '  飽和脂肪';
      case NutritionType.transFat:
      return '  反式脂肪';
      case NutritionType.carbohydrate:
      return '碳水化合物';
      case NutritionType.sugar:
      return '  糖';
      case NutritionType.sodium:
      return '鈉';
    }
  }
}


class DetailNutrtion {

  DetailNutrtion(Nutrition n) {
    final String title = n.product;
    final String nutrition = '每一份量 ${n.weight} ${n.weightUnit}\n本包裝含 ${n.copies} 份';
    const String info = '熱量\n蛋白質\n脂肪\n   飽和脂肪\n   反式脂肪\n碳水化合物\n   糖\n鈉';
    final String perservingDescription = '${n.calory}大卡\n${n.protein}公克\n${n.fat}公克\n${n.saturatedFat}公克\n${n.transFat}公克\n${n.carbohydrate}公克\n${n.sugar}公克\n${n.sodium}毫克';
    final String per100mlDescription = '${n.calory100}大卡\n${n.protein100}公克\n${n.fat_100}公克\n${n.saturatedFat100}公克\n${n.transFat100}公克\n${n.carbohydrate100}公克\n${n.sugar100}公克\n${n.sodium100}毫克';

    productTitle = title;
    this.info = info;
    this.perservingDescription = perservingDescription;
    this.per100mlDescription = per100mlDescription;
    this.nutrition = nutrition;
  }


  late String productTitle;
  late String info;
  late String perservingDescription;
  late String per100mlDescription;
  late String nutrition;
}