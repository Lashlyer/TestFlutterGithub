import 'package:shopping_list/models/orderhistory/orderlistitem.dart';

class OrderList {
  List<OrderListItem> items;
  int next;

  OrderList({required this.items, required this.next});

  factory OrderList.fromJson(Map<String, dynamic> json) => OrderList(
        items: List<OrderListItem>.from(json["rows"].map((x) => OrderListItem.fromJson(x))),
        next: json["next"],
      );

  Map<String, dynamic> toJson() => {
        "rows": List<dynamic>.from(items.map((x) => x.toJson())),
        "next": next,
      };
}
