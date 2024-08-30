
class Activity {
    int id;
    String name;
    String image;
    String summary;
    String category;
    bool newest;
    String status;
    String startTime;
    String endTime;
    int point;

    Activity({
        required this.id,
        required this.name,
        required this.image,
        required this.summary,
        required this.category,
        required this.newest,
        required this.status,
        required this.startTime,
        required this.endTime,
        required this.point,
    });

    factory Activity.fromJson(Map<String, dynamic> json) => Activity(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        summary: json["summary"],
        category: json["category"],
        newest: json["newest"],
        status: json["status"],
        startTime: json["start_time"],
        endTime: json["end_time"],
        point: json["point"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "summary": summary,
        "category": category,
        "newest": newest,
        "status": status,
        "start_time": startTime,
        "end_time": endTime,
        "point": point,
    };
}