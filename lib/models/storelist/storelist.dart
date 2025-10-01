


import 'package:shopping_list/models/storelist/storeRegion.dart';

class StoreList {
    List<StoreItem> rows;
    int next;

    StoreList({
        required this.rows,
        required this.next,
    });

    factory StoreList.fromJson(Map<String, dynamic> json) => StoreList(
        rows: List<StoreItem>.from(json["rows"].map((x) => StoreItem.fromJson(x))),
        next: json["next"],
    );

    Map<String, dynamic> toJson() => {
        "rows": List<dynamic>.from(rows.map((x) => x.toJson())),
        "next": next,
    };
}


class StoreItem {
    int id;
    String no;
    String name;
    String address;
    String telephone;
    String? telephone2;
    String dist;
    bool? nearest;

    StoreItem({
        required this.id,
        required this.no,
        required this.name,
        required this.address,
        required this.telephone,
        required this.telephone2,
        required this.dist,
        this.nearest,
    });

    factory StoreItem.fromJson(Map<String, dynamic> json) => StoreItem(
        id: json["id"],
        no: json["no"],
        name: json["name"],
        address: json["address"],
        telephone: json["telephone"],
        telephone2: json["telephone2"],
        dist: json["dist"],
        nearest: json["nearest"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "no": no,
        "name": name,
        "address": address,
        "telephone": telephone,
        "telephone2": telephone2,
        "dist": dist,
        "nearest": nearest,
    };
}