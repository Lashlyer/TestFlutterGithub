
class Exhibition {
    int id;
    String name;
    String imageWeb;
    String imageApp;
    String date;

    Exhibition({
        required this.id,
        required this.name,
        required this.imageWeb,
        required this.imageApp,
        required this.date,
    });

    factory Exhibition.fromJson(Map<String, dynamic> json) => Exhibition(
        id: json["id"],
        name: json["name"],
        imageWeb: json["image_web"],
        imageApp: json["image_app"],
        date: json["date"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image_web": imageWeb,
        "image_app": imageApp,
        "date": date,
    };
}