
import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';
import 'package:shopping_list/models/detailContent.dart';

class DetailItemSku {
  const DetailItemSku({required this.sku, required this.boxMax});
  final String sku;
  final int boxMax;

  factory DetailItemSku.fromJson(Map<String, dynamic> json, int boxMax) {

    return DetailItemSku(sku: json['name'], boxMax: boxMax);
  }
}

class DetailItemStamp {

  const DetailItemStamp({required this.name, required this.image, required this.summary});

  final String name;
  final String image;
  final String summary;

  factory DetailItemStamp.fromJson(Map<String, dynamic> json) {
    final imagurl = json['image'] as String?;

    return DetailItemStamp(
      name: json['name'] ?? '', 
      image: imagurl == null ? '' : 'https://d1ireumi1ecmwq.cloudfront.net$imagurl', 
      summary: json['summary']
    );
  }

}


class DetailItem {
  const DetailItem({
    required this.name,
    required this.brand,
    required this.imageUrl,
    required this.price,
    required this.salePrice,
    required this.feature,
    required this.tags,
    required this.sku,
    required this.stamp,
    required this.content
  });


  final String name;
  final String brand;
  final List<String> imageUrl;
  final int price;
  final int salePrice;
  final String feature;
  final List<String> tags;
  final DetailItemSku? sku;
  final List<DetailItemStamp> stamp;
  final DetailContent content;


  factory DetailItem.fromJson(Map<String, dynamic> json) {
    final detail = json['detail'];
    final tagsData = json['tags'];
    final sku = json['skus'];
    final content = DetailContent.fromJson(json['content']);


    final url = detail['image_cover'] ?? '';
    final price = detail['price'] ?? 0;
    final salePrice = detail['sale_price'] ?? 0;
    final image = detail['images'];


    List<String> tags = [];
    List<String> images = url == '' ? [] : ['https://d1ireumi1ecmwq.cloudfront.net$url', 'https://d1ireumi1ecmwq.cloudfront.net/upload/images/4b36c19adc347e9feb41a3b7f44b7877.jpg'];
    DetailItemSku? skus;
    List<DetailItemStamp> stamps = [];

    if (sku != null) {
      skus = DetailItemSku.fromJson(sku[0], detail['box_num']);
    } else {
      skus = null;
    }

    if (json['stamps'] != null) {
      for (final s in json['stamps']) {
        stamps.add(DetailItemStamp.fromJson(s));
      }
    } 

    for (final tag in tagsData) {
      tags.add(tag ?? '');
    }

    for (final img in image) {
      try {
        final i = img as String;
        images.add('https://d1ireumi1ecmwq.cloudfront.net$i');
      } catch (e) {
        print(e);
      }
    }

    print(content);

    
    return DetailItem(
      name: detail['name'] ?? '', 
      brand: detail['brand'] ?? '', 
      imageUrl: images, 
      price: price, 
      salePrice: salePrice, 
      feature: detail['features'] ?? '', 
      tags: tags,
      sku: skus,
      stamp: stamps,
      content: content
    );
  }

}