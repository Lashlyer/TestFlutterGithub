class Nutrition {
  Nutrition(
    this.sugar,
    this.calory,
    this.copies,
    this.sodium,
    this.weight,
    this.fat_100,
    this.product,
    this.protein,
    this.sugar100,
    this.transFat100,
    this.calory100,
    this.sodium100,
    this.protein100,
    this.weightUnit,
    this.carbohydrate,
    this.saturatedFat,
    this.transFat,
    this.carbohydrate100,
    this.saturatedFat100, 
    this.fat
  );

  final String fat;
  final String sugar;
  final String calory;
  final String copies;
  final String sodium;
  final String weight;
  final String fat_100;
  final String product;
  final String protein;
  final String sugar100;
  final String transFat;
  final String calory100;
  final String sodium100;
  final String protein100;
  final String weightUnit;
  final String carbohydrate;
  final String saturatedFat;
  final String transFat100;
  final String carbohydrate100;
  final String saturatedFat100;

  factory Nutrition.fromJson(Map<String, dynamic> json) {
    return Nutrition(
      json['sugar'] ?? '', 
      json['calory'] ?? '', 
      json['copies'] ?? '', 
      json['sodium'] ?? '', 
      json['weight'] ?? '', 
      json['fat_100'] ?? '', 
      json['product'] ?? '', 
      json['protein'] ?? '', 
      json['sugar_100'] ?? '', 
      json['trans_fat_100'] ?? '', 
      json['calory_100'] ?? '', 
      json['sodium_100'] ?? '', 
      json['protein_100'] ?? '', 
      json['weight_unit'] ?? '', 
      json['carbohydrate'] ?? '', 
      json['saturated_fat'], 
      json['trans_fat'] ?? '', 
      json['carbohydrate_100'] ?? '', 
      json['saturated_fat_100'] ?? '', 
      json['fat'] ?? '');
  }
}
