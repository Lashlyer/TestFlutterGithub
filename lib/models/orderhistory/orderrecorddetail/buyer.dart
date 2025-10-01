
class Buyer {
    String name;
    String mobile;
    String city;
    String area;
    String zipcode;
    String address;

    Buyer({
        required this.name,
        required this.mobile,
        required this.city,
        required this.area,
        required this.zipcode,
        required this.address,
    });

    factory Buyer.fromJson(Map<String, dynamic> json) => Buyer(
        name: json["name"],
        mobile: json["mobile"],
        city: json["city"],
        area: json["area"],
        zipcode: json["zipcode"],
        address: json["address"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "mobile": mobile,
        "city": city,
        "area": area,
        "zipcode": zipcode,
        "address": address,
    };
}