
import 'package:shopping_list/models/orderhistory/orderrecorddetail/buyer.dart';
import 'package:shopping_list/models/orderhistory/orderrecorddetail/detail.dart';
import 'package:shopping_list/models/orderhistory/orderrecorddetail/invoice.dart';
import 'package:shopping_list/models/orderhistory/orderrecorddetail/orderrecorddetailitem.dart';
import 'package:shopping_list/models/orderhistory/orderrecorddetail/payment.dart';
import 'package:shopping_list/models/orderhistory/orderrecorddetail/suborder.dart';

class OrderRecordDetail {
    Detail detail;
    Payment payment;
    Invoice invoice;
    List<Suborder> suborders;
    List<OrderRecordDetailItem> items;
    Buyer buyer;
    // dynamic donate;
    // dynamic soldout;
    // dynamic preorder;
    String comments;

    OrderRecordDetail({
        required this.detail,
        required this.payment,
        required this.invoice,
        required this.suborders,
        required this.items,
        required this.buyer,
        // required this.donate,
        // required this.soldout,
        // required this.preorder,
        required this.comments,
    });

    factory OrderRecordDetail.fromJson(Map<String, dynamic> json) {
      final itemlist = List<OrderRecordDetailItem>.from(json['items'].map((x) => OrderRecordDetailItem.fromJson(x)));


      return OrderRecordDetail(
        detail: Detail.fromJson(json["detail"]),
        payment: Payment.fromJson(json["payment"]),
        invoice: Invoice.fromJson(json["invoice"]),
        suborders: List<Suborder>.from(json["suborders"].map((x) => Suborder.fromJson(
          x, itemlist.where((item) => item.suborderId == x['id']).toList())) ),
        items: itemlist,
        buyer: Buyer.fromJson(json["buyer"]),
        // donate: json["donate"],
        // soldout: json["soldout"],
        // preorder: json["preorder"],
        comments: json["comments"] ?? '',
    );
    }

    Map<String, dynamic> toJson() => {
        "detail": detail.toJson(),
        "payment": payment.toJson(),
        "invoice": invoice.toJson(),
        "suborders": List<dynamic>.from(suborders.map((x) => x.toJson())),
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
        "buyer": buyer,
        // "donate": donate,
        // "soldout": soldout,
        // "preorder": preorder,
        "comments": comments,
    };
}