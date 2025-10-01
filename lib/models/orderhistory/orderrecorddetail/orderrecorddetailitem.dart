import 'package:shopping_list/models/orderhistory/orderrecorddetail/offer.dart';
import 'package:shopping_list/models/orderhistory/orderrecorddetail/orderrecorddetailItemsitem.dart';

enum OrderRecordDetailItemType { normal, multy, addon }

class OrderRecordDetailItem {
  int id;
  int type;
  int suborderId;
  int parentId;
  int productId;
  String productNo;
  String name;
  String image;
  String standard;
  int price;
  int salePrice;
  int quantity;
  Offer? offer;
  int points;
  int subtotalOrigin;
  int subtotal;
  int couponDiscount;
  int promotionDiscount;
  int promotionId;
  String? promotionName;
  List<OrderRecordDetailItemsItem> items;

  OrderRecordDetailItem(
      {required this.id,
      required this.type,
      required this.suborderId,
      required this.parentId,
      required this.productId,
      required this.productNo,
      required this.name,
      required this.image,
      required this.standard,
      required this.price,
      required this.salePrice,
      required this.quantity,
      required this.offer,
      required this.points,
      required this.subtotalOrigin,
      required this.subtotal,
      required this.couponDiscount,
      required this.promotionDiscount,
      required this.promotionId,
      required this.promotionName,
      required this.items});

  OrderRecordDetailItemType itemType() {
    switch (type) {
      case 0:
        return OrderRecordDetailItemType.normal;
      case 1:
        return OrderRecordDetailItemType.multy;
      case 2:
        return OrderRecordDetailItemType.addon;
      default:
        return OrderRecordDetailItemType.normal;
    }
  }

  factory OrderRecordDetailItem.fromJson(Map<String, dynamic> json) {

    return OrderRecordDetailItem(
        id: json["id"],
        type: json["type"],
        suborderId: json["suborder_id"],
        parentId: json["parent_id"],
        productId: json["product_id"],
        productNo: json["product_no"],
        name: json["name"],
        image: json["image"],
        standard: json["standard"],
        price: json["price"],
        salePrice: json["sale_price"],
        quantity: json["quantity"],
        offer: json['offer'] == null ? null : Offer.fromJson(json['offer']),
        points: json["points"],
        subtotalOrigin: json["subtotal_origin"],
        subtotal: json["subtotal"],
        couponDiscount: json["coupon_discount"],
        promotionDiscount: json["promotion_discount"],
        promotionId: json["promotion_id"],
        promotionName: json["promotion_name"] ?? '',
        items: json['items'] == null ? [] : List<OrderRecordDetailItemsItem>.from(json['items'].map((x) => OrderRecordDetailItemsItem.fromJson(x))
        ));
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "suborder_id": suborderId,
        "parent_id": parentId,
        "product_id": productId,
        "product_no": productNo,
        "name": name,
        "image": image,
        "standard": standard,
        "price": price,
        "sale_price": salePrice,
        "quantity": quantity,
        "offer": offer?.toJson(),
        "points": points,
        "subtotal_origin": subtotalOrigin,
        "subtotal": subtotal,
        "coupon_discount": couponDiscount,
        "promotion_discount": promotionDiscount,
        "promotion_id": promotionId,
        "promotion_name": promotionName,
      };
}
