

class ProdcutHome {
    List<Promotion> promotions;
    List<Category> categories;
    List<Topic> topics;
    List<Product> products;

    ProdcutHome({
        required this.promotions,
        required this.categories,
        required this.topics,
        required this.products,
    });

    factory ProdcutHome.fromJson(Map<String, dynamic> json) {
        return ProdcutHome(
            promotions: (json['promotions'] as List<dynamic>? ?? [])
                    .map((x) => Promotion.fromJson(x as Map<String, dynamic>))
                    .toList(),
            categories: (json['categories'] as List<dynamic>? ?? [])
                    .map((x) => Category.fromJson(x as Map<String, dynamic>))
                    .toList(),
            topics: (json['topics'] as List<dynamic>? ?? [])
                    .map((x) => Topic.fromJson(x as Map<String, dynamic>))
                    .toList(),
            products: (json['products'] as List<dynamic>? ?? [])
                    .map((x) => Product.fromJson(x as Map<String, dynamic>))
                    .toList(),
        );
    }

    Map<String, dynamic> toJson() => {
        "promotions": List<dynamic>.from(promotions.map((x) => x.toJson())),
        "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
        "topics": List<dynamic>.from(topics.map((x) => x.toJson())),
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
    };
}

class Topic {
    int id;
    String name;

    Topic({
        required this.id,
        required this.name,
    });

    factory Topic.fromJson(Map<String, dynamic> json) => Topic(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}

class Promotion {
    int id;
    String name;
    String image;

    Promotion({
        required this.id,
        required this.name,
        required this.image,
    });

    factory Promotion.fromJson(Map<String, dynamic> json) => Promotion(
                id: json['id'] as int,
                name: json['name'] as String,
                image: json['image'] as String,
            );

    Map<String, dynamic> toJson() => {
                'id': id,
                'name': name,
                'image': image,
            };
}

class Category {
    int id;
    String name;
    String image;

    Category({
        required this.id,
        required this.name,
        required this.image,
    });

    factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
    };
}


class Product {
    int id;
    String name;
    List<ProductItem> items;

    Product({
        required this.id,
        required this.name,
        required this.items,
    });

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        items: List<ProductItem>.from(json["items"].map((x) => ProductItem.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
    };
}


class ProductItem {
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

    ProductItem({
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

    factory ProductItem.fromJson(Map<String, dynamic> json) => ProductItem(
        id: json["id"],
        name: json["name"],
        brand: json["brand"],
        category: json["category"],
        type: json["type"],
        image: json["image"],
        stamp: json["stamp"],
        tags: List<String>.from(json["tags"].map((x) => x ?? '')),
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