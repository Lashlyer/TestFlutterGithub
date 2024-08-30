class Topic {
    int id;
    String name;
    String image;

    Topic({
        required this.id,
        required this.name,
        required this.image,
    });

    factory Topic.fromJson(Map<String, dynamic> json) => Topic(
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