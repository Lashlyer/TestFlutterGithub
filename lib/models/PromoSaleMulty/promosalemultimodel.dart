class PromoSaleMultiModel {
  Detail detail;
  List<Promotion> promotions;
  Map<String, List<Product>> products;
  List<Relation> relations;

  PromoSaleMultiModel({
    required this.detail,
    required this.promotions,
    required this.products,
    required this.relations,
  });

  factory PromoSaleMultiModel.fromJson(Map<String, dynamic> json) {
    
    final Map<String, List<Product>> products = Map.from(json["products"]).map((k, v) =>
          MapEntry<String, List<Product>>(
              k, List<Product>.from(v.map((x) => Product.fromJson(x)))));


    return PromoSaleMultiModel(
      detail: Detail.fromJson(json["detail"]),
      promotions: List<Promotion>.from(
          json["promotions"].map((x) => Promotion.fromJson(x, products))),
      products: products,
      relations: List<Relation>.from(
          json["relations"].map((x) => Relation.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "detail": detail.toJson(),
        "promotions": List<dynamic>.from(promotions.map((x) => x.toJson())),
        "products": Map.from(products).map((k, v) => MapEntry<String, dynamic>(
            k, List<dynamic>.from(v.map((x) => x.toJson())))),
        "relations": List<dynamic>.from(relations.map((x) => x.toJson())),
      };
}

class Detail {
  int id;
  String name;
  String image;
  String imageWeb;
  String startTime;
  String endTime;
  String metaTitle;
  String metaDescription;
  String ogTitle;
  String ogDescription;

  Detail({
    required this.id,
    required this.name,
    required this.image,
    required this.imageWeb,
    required this.startTime,
    required this.endTime,
    required this.metaTitle,
    required this.metaDescription,
    required this.ogTitle,
    required this.ogDescription,
  });

  factory Detail.fromJson(Map<String, dynamic> json) => Detail(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        imageWeb: json["image_web"],
        startTime: json["start_time"],
        endTime: json["end_time"],
        metaTitle: json["meta_title"],
        metaDescription: json["meta_description"],
        ogTitle: json["og_title"],
        ogDescription: json["og_description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "image_web": imageWeb,
        "start_time": startTime,
        "end_time": endTime,
        "meta_title": metaTitle,
        "meta_description": metaDescription,
        "og_title": ogTitle,
        "og_description": ogDescription,
      };
}

class Product {
  int id;
  String name;
  String brand;
  String category;
  String? type;
  String image;
  String? stamp;
  List<String> tags;
  String promotion;
  bool newest;
  int collected;
  int status;
  int price;
  int salePrice;

  Product({
    required this.id,
    required this.name,
    required this.brand,
    required this.category,
    required this.type,
    required this.image,
    required this.stamp,
    required this.tags,
    required this.promotion,
    required this.newest,
    required this.collected,
    required this.status,
    required this.price,
    required this.salePrice,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        brand: json["brand"],
        category: json["category"],
        type: json["type"],
        image: json["image"],
        stamp: json["stamp"],
        tags: List<String>.from(json['tags'].map((x) => x ?? '')),
        promotion: json["promotion"],
        newest: json["newest"],
        collected: json["collected"],
        status: json["status"],
        price: json["price"],
        salePrice: json["sale_price"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "brand": brand,
        "category": category,
        "type": type,
        "image": image,
        "stamp": stamp,
        "tags": tags,
        "promotion": promotion,
        "newest": newest,
        "collected": collected,
        "status": status,
        "price": price,
        "sale_price": salePrice,
      };
}

class Promotion {
  int id;
  String name;
  List<Item> items;

  Promotion({
    required this.id,
    required this.name,
    required this.items,
  });

  factory Promotion.fromJson(Map<String, dynamic> json, Map<String, List<Product>> products) {

    return Promotion(
      id: json["id"],
      name: json["name"],
      items:
          List<Item>.from(json["items"].map((item) => Item.fromJson(item, products[item['id'].toString()] ?? []))),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
      };
}

class Item {
  int id;
  int type;
  String name;
  int num;
  int? amount;
  List<Product> products;

  Item(
      {required this.id,
      required this.type,
      required this.name,
      required this.num,
      required this.amount,
      required this.products});

  factory Item.fromJson(Map<String, dynamic> json, List<Product> products) {

    return Item(
          id: json["id"],
          type: json["type"],
          name: json["name"],
          num: json["num"],
          amount: json["amount"],
          products: products);
  } 
      

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "name": name,
        "num": num,
        "amount": amount,
      };
}

class Relation {
  int id;
  String name;
  String image;
  String imageWeb;

  Relation({
    required this.id,
    required this.name,
    required this.image,
    required this.imageWeb,
  });

  factory Relation.fromJson(Map<String, dynamic> json) => Relation(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        imageWeb: json["image_web"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "image_web": imageWeb,
      };
}
