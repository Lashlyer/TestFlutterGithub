
import 'package:shopping_list/models/orderhistory/orderrecorddetail/note.dart';
import 'package:shopping_list/models/orderhistory/orderrecorddetail/promotion.dart';

class Offer {
    int type;
    List<Note> notes;
    Promotion? promotion;

    Offer({
        required this.type,
        required this.notes,
        required this.promotion,
    });

    factory Offer.fromJson(Map<String, dynamic> json) => Offer(
        type: json["type"],
        notes: json['notes'] == null ? [] : List<Note>.from(json["notes"].map((x) => Note.fromJson(x))),
        promotion: json["promotion"] == null ? null : Promotion.fromJson(json['promotion']),
    );

    Map<String, dynamic> toJson() => {
        "type": type,
        "notes": List<dynamic>.from(notes.map((x) => x.toJson())),
        "promotion": promotion?.toJson(),
    };
}