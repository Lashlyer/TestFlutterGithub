
class Recipe {
    int id;
    String type;
    String title;
    String image;
    String vege;
    String category;
    bool newest;
    int collected;
    int point;

    Recipe({
        required this.id,
        required this.type,
        required this.title,
        required this.image,
        required this.vege,
        required this.category,
        required this.newest,
        required this.collected,
        required this.point,
    });

    factory Recipe.fromJson(Map<String, dynamic> json) => Recipe(
        id: json["id"],
        type: json["type"],
        title: json["title"],
        image: json["image"],
        vege: json["vege"],
        category: json["category"],
        newest: json["newest"],
        collected: json["collected"],
        point: json["point"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "title": title,
        "image": image,
        "vege": vege,
        "category": category,
        "newest": newest,
        "collected": collected,
        "point": point,
    };
}