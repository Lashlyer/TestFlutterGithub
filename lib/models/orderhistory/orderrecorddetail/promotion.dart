
class Promotion {
    int id;
    String name;
    bool? valid;
    int? schedule;

    Promotion({
        required this.id,
        required this.name,
        this.valid,
        this.schedule,
    });

    factory Promotion.fromJson(Map<String, dynamic> json) => Promotion(
        id: json["id"],
        name: json["name"],
        valid: json["valid"],
        schedule: json["schedule"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "valid": valid,
        "schedule": schedule,
    };
}
