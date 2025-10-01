


class StoreDetail {
    int type;
    String name;
    String address;
    String telephone;
    String? telephone2;
    String businessHours;
    String businessItems;
    int parking;
    String payments;
    String lat;
    String lng;
    String? url;
    String services;
    String metaTitle;
    String metaDescription;
    String ogTitle;
    String ogDescription;
    String ogImage;

    double latvalue() {
      return double.parse(lat);
    }

    double lngvalue() {
      return double.parse(lng);
    }

    StoreDetail({
        required this.type,
        required this.name,
        required this.address,
        required this.telephone,
        required this.telephone2,
        required this.businessHours,
        required this.businessItems,
        required this.parking,
        required this.payments,
        required this.lat,
        required this.lng,
        required this.url,
        required this.services,
        required this.metaTitle,
        required this.metaDescription,
        required this.ogTitle,
        required this.ogDescription,
        required this.ogImage,
    });

    factory StoreDetail.fromJson(Map<String, dynamic> json) => StoreDetail(
        type: json["type"],
        name: json["name"],
        address: json["address"],
        telephone: json["telephone"],
        telephone2: json["telephone2"],
        businessHours: json["business_hours"],
        businessItems: json["business_items"],
        parking: json["parking"],
        payments: json["payments"],
        lat: json["lat"],
        lng: json["lng"],
        url: json["url"],
        services: json["services"],
        metaTitle: json["meta_title"],
        metaDescription: json["meta_description"],
        ogTitle: json["og_title"],
        ogDescription: json["og_description"],
        ogImage: json["og_image"],
    );

    Map<String, dynamic> toJson() => {
        "type": type,
        "name": name,
        "address": address,
        "telephone": telephone,
        "telephone2": telephone2,
        "business_hours": businessHours,
        "business_items": businessItems,
        "parking": parking,
        "payments": payments,
        "lat": lat,
        "lng": lng,
        "url": url,
        "services": services,
        "meta_title": metaTitle,
        "meta_description": metaDescription,
        "og_title": ogTitle,
        "og_description": ogDescription,
        "og_image": ogImage,
    };
}