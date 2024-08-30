

import 'dart:math';

import 'package:shopping_list/models/category.dart';
import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';



class GroceryItem {
  const GroceryItem({required this.id, required this.name, required this.quantity, required this.category});
  
  final String id;
  final String name;
  final int quantity;
  final Category category;
}

@JsonSerializable()
class TestItem {

  const TestItem({
    required this.id, 
    required this.name, 
    required this.category, 
    required this.image, 
    required this.stamp,
    required this.tags,
    required this.brand,
    required this.price, 
    required this.salePrice,
    required this.promotion,
    required this.isColected
    });

  final int? id;
  final String? name;
  final String? category;
  final String? image;
  final String? stamp;
  final List<String> tags;
  final String? brand;
  final int price;
  final int salePrice;
  final String promotion;
  final int isColected;
 

  factory TestItem.fromJson(Map<String, dynamic> json) {
    final url = json['image'] ?? '';
    final price = (json['price'] ?? 0); 
    final salePrice = (json['sale_price'] ?? 0);
    final List<String> tags = [];
    final stamp = json['stamp'] ?? '';

    
    for (final tag in json['tags'] ?? []) {
      tags.add(tag);
    }


    return TestItem(
      id: json['id'] ?? 0, 
      name: json['name'] ?? '',
      category: json['category'] ?? '', 
      image: 'https://d1ireumi1ecmwq.cloudfront.net$url',
      stamp: stamp == '' ? '' : 'https://d1ireumi1ecmwq.cloudfront.net${stamp}', 
      brand: json['brand'] ?? '',
      tags: tags,
      price: price, 
      salePrice: salePrice,
      promotion: json['promotion'] ?? '',
      isColected:  Random().nextInt(2));
  }

  // TestItem.fromJson(Map<String, dynamic> json)
  //  : 
  //  id = json['id'] as int,
  //  name = json['name'] as String,
  //  category = json['category'] as String,
  //  image = json['image'] as String,
  //  price = json['price'] as int,
  //  salePrice = json['sale_price'] as int;


  //  Map<String, dynamic> toJson() => {
  //   'id': id,
  //   'name': name,
  //   'category': category,
  //   'image': image,
  //   'price': price,
  //   'sale_price': salePrice
  //  };

}