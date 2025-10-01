

class ProductCategory {
  List<Filter> filters;
  List<ParnetCategory> categories;

  ProductCategory({
    required this.filters,
    required this.categories,
  });

  factory ProductCategory.fromJson(Map<String, dynamic> json) {

    final categories = 
        List<SubCategory>.from(json["categories"].map((x) => SubCategory.fromJson(x)));

    List<SubCategory> ps =
        categories.where((element) => element.parent == 0).toList();

    List<ParnetCategory> parents = [];

    for (var p in ps) {
      List<SubCategory> subcategory =
          categories.where((element) => element.parent == p.id).toList();
      int totalcount = subcategory.fold(0, (previousValue, element) => previousValue + element.count);

      subcategory.insert(0, SubCategory(id: p.id, name: '全部', image: '', parent: 0, count: totalcount));

      parents.add(ParnetCategory(
          id: p.id,
          name: p.name,
          count: p.count,
          image: p.image,
          subcategory: subcategory));
    }

    return ProductCategory(
        filters:
            List<Filter>.from(json["filters"].map((x) => Filter.fromJson(x))),
        categories: parents);
  }
}

class ParnetCategory {
  int id;
  String name;
  String image;
  int count;
  List<SubCategory> subcategory;

  ParnetCategory(
      {required this.id,
      required this.name,
      required this.count,
      required this.image,
      required this.subcategory});
}

class SubCategory {
  int id;
  String name;
  String image;
  int parent;
  int count;

  SubCategory({
    required this.id,
    required this.name,
    required this.image,
    required this.parent,
    required this.count,
  });

  factory SubCategory.fromJson(Map<String, dynamic> json) => SubCategory(
      id: json["id"],
      name: json["name"],
      image: json["image"],
      parent: json["parent"],
      count: json["count"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "parent": parent,
        "count": count,
      };
}

class Filter {
  String name;
  String field;
  List<Item> items;

  Filter({
    required this.name,
    required this.field,
    required this.items,
  });

  factory Filter.fromJson(Map<String, dynamic> json) => Filter(
        name: json["name"],
        field: json["field"],
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "field": field,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
      };
}

class Item {
  int id;
  String name;

  Item({
    required this.id,
    required this.name,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
