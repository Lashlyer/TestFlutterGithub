

class Step {
    String name;
    String? time;
    bool active;

    Step({
        required this.name,
        required this.time,
        required this.active,
    });

    factory Step.fromJson(Map<String, dynamic> json) => Step(
        name: json["name"],
        time: json["time"],
        active: json["active"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "time": time,
        "active": active,
    };
}