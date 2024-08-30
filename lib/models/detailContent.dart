import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';
import 'package:shopping_list/models/deatilNutrition/detailNurtritions.dart';
import 'package:shopping_list/models/deatilNutrition/nutrition.dart';

enum SpecificationType {
  other,
  press,
  author,
  origin,
  pubdate,
  allergen,
  language,
  revision,
  standard,
  shelfLife,
  composition,
  consumption,
  preservation
}

extension SpecificationTypeExtention on SpecificationType {
  String typeName() {
    switch (this) {
      case SpecificationType.other:
        return '其他';
      case SpecificationType.origin:
        return '產地';
      case SpecificationType.standard:
        return '規格';
      case SpecificationType.composition:
        return '成分';
      case SpecificationType.shelfLife:
        return '保存期限';
      case SpecificationType.preservation:
        return '保存方法';
      case SpecificationType.consumption:
        return '食/使用方式';
      case SpecificationType.allergen:
        return '過敏源資訊';
      case SpecificationType.author:
        return '作者';
      case SpecificationType.press:
        return '出版社';
      case SpecificationType.language:
        return '語言';
      case SpecificationType.pubdate:
        return '出版日期';
      case SpecificationType.revision:
        return '版次';
    }
  }
}

class DetailContentSpecifications {
  const DetailContentSpecifications({
    required this.other,
    required this.press,
    required this.author,
    required this.origin,
    required this.pubdate,
    required this.allergen,
    required this.language,
    required this.revision,
    required this.standard,
    required this.shelfLife,
    required this.composition,
    required this.consumption,
    required this.preservation,
  });

  final String other;
  final String press;
  final String author;
  final String origin;
  final String pubdate;
  final String allergen;
  final String language;
  final String revision;
  final String standard;
  final String shelfLife;
  final String composition;
  final String consumption;
  final String preservation;

  factory DetailContentSpecifications.fromJson(Map<String, dynamic> json) {
    return DetailContentSpecifications(
        other: json['other'] ?? '',
        press: json['press'] ?? '',
        author: json['author'] ?? '',
        origin: json['origin'] ?? '',
        pubdate: json['pubdate'] ?? '',
        allergen: json['allergen'] ?? '',
        language: json['language'] ?? '',
        revision: json['revision'] ?? '',
        standard: json['standard'] ?? '',
        shelfLife: json['shelf_life'] ?? '',
        composition: json['composition'] ?? '',
        consumption: json['consumption'] ?? '',
        preservation: json['preservation'] ?? '');
  }
}

class Specifications {
  Specifications(DetailContentSpecifications s, this.other) {
    specifications = customInit(s);
  }

  late List<Specification> specifications;
  late String other;

  void printProperty() {
    for (final i in specifications) {
      print(i.title);
      print(i.value);
    }
  }

  List<Specification> customInit(DetailContentSpecifications s) {
    List<Specification> currentSpec = [];
    if (s.origin.isNotEmpty) {
      currentSpec.add(Specification(
          title: SpecificationType.origin.typeName(), value: s.origin));
    }
    if (s.standard.isNotEmpty) {
      currentSpec.add(Specification(
          title: SpecificationType.standard.typeName(), value: s.standard));
    }
    if (s.composition.isNotEmpty) {
      currentSpec.add(Specification(
          title: SpecificationType.composition.typeName(),
          value: s.composition));
    }
    if (s.shelfLife.isNotEmpty) {
      currentSpec.add(Specification(
          title: SpecificationType.shelfLife.typeName(), value: s.shelfLife));
    }
    if (s.preservation.isNotEmpty) {
      currentSpec.add(Specification(
          title: SpecificationType.preservation.typeName(),
          value: s.preservation));
    }
    if (s.consumption.isNotEmpty) {
      currentSpec.add(Specification(
          title: SpecificationType.consumption.typeName(),
          value: s.consumption));
    }
    if (s.allergen.isNotEmpty) {
      currentSpec.add(Specification(
          title: SpecificationType.allergen.typeName(), value: s.allergen));
    }
    if (s.author.isNotEmpty) {
      currentSpec.add(Specification(
          title: SpecificationType.author.typeName(), value: s.author));
    }
    if (s.press.isNotEmpty) {
      currentSpec.add(Specification(
          title: SpecificationType.press.typeName(), value: s.press));
    }
    if (s.language.isNotEmpty) {
      currentSpec.add(Specification(
          title: SpecificationType.language.typeName(), value: s.language));
    }
    if (s.pubdate.isNotEmpty) {
      currentSpec.add(Specification(
          title: SpecificationType.pubdate.typeName(), value: s.pubdate));
    }
    if (s.revision.isNotEmpty) {
      currentSpec.add(Specification(
          title: SpecificationType.revision.typeName(), value: s.revision));
    }
    if (s.other.isNotEmpty) {
      currentSpec.add(Specification(
          title: SpecificationType.other.typeName(), value: s.other));
    }

    return currentSpec;
  }
}

class Specification {
  Specification({required this.title, required this.value});

  final String title;
  final String value;
}

class DetailContent {
  DetailContent(
      {required this.content,
      required this.shipping,
      required this.specifications, 
      required this.nutritions});

  final String content;
  final String shipping;
  final Specifications? specifications;
  final List<DetailNutrtion>? nutritions;

  factory DetailContent.fromJson(Map<String, dynamic> json) {
    final content = json['content'] ?? '';
    final shipping = json['shipping'] ?? '';
    final nutritionDecode = json['nutritions'];
    
    Specifications? specifications;
    List<DetailNutrtion> nutritions = [];

    if (json['specifications'] != null) {
      final specificationsData =
          DetailContentSpecifications.fromJson(json['specifications']);

      specifications =
          Specifications(specificationsData, json['specification_other'] ?? '');

    } else {
      specifications = null;
    }

    if (nutritionDecode != []) {
      for (final n in nutritionDecode) {
        nutritions.add(DetailNutrtion(Nutrition.fromJson(n)));
      }
    } 

    return DetailContent(
          content: content, shipping: shipping, specifications: specifications, nutritions: nutritions);
  }
}
