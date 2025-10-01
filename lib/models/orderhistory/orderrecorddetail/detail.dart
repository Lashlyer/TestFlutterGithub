
import 'package:shopping_list/models/orderhistory/orderrecorddetail/orderstatus.dart';

class Detail {
    int id;
    String no;
    String uuid;
    String date;
    int type;
    String typeName;
    int category;
    String categoryName;
    int? cancelStatus;
    String cancelStatusName;
    int orderStatus;
    String orderStatusName;
    String shippingMethods;
    List<dynamic> coupons;
    int orderPoints;
    int productPoints;
    int totalCouponAmount;
    int totalPromotionAmount;
    int shippingCouponAmount;
    int shippingDiscountAmount;
    int shippingAmount;
    int shippingFee;
    int codFee;
    int totalAmount;
    int totalOrigin;
    int totalCount;
    int paidAmount;
    bool closeable;
    int questionable;

    Detail({
        required this.id,
        required this.no,
        required this.uuid,
        required this.date,
        required this.type,
        required this.typeName,
        required this.category,
        required this.categoryName,
        required this.cancelStatus,
        required this.cancelStatusName,
        required this.orderStatus,
        required this.orderStatusName,
        required this.shippingMethods,
        required this.coupons,
        required this.orderPoints,
        required this.productPoints,
        required this.totalCouponAmount,
        required this.totalPromotionAmount,
        required this.shippingCouponAmount,
        required this.shippingDiscountAmount,
        required this.shippingAmount,
        required this.shippingFee,
        required this.codFee,
        required this.totalAmount,
        required this.totalOrigin,
        required this.totalCount,
        required this.paidAmount,
        required this.closeable,
        required this.questionable,
    });

    OrderStatus getOrderStatus() {
      return OrderStatusExtension.fromInt(orderStatus);
    }

    factory Detail.fromJson(Map<String, dynamic> json) => Detail(
        id: json["id"],
        no: json["no"],
        uuid: json["uuid"],
        date: json["date"],
        type: json["type"],
        typeName: json["type_name"],
        category: json["category"],
        categoryName: json["category_name"],
        cancelStatus: json["cancel_status"],
        cancelStatusName: json["cancel_status_name"],
        orderStatus: json["order_status"],
        orderStatusName: json["order_status_name"],
        shippingMethods: json["shipping_methods"],
        coupons: List<dynamic>.from(json["coupons"].map((x) => x)),
        orderPoints: json["order_points"],
        productPoints: json["product_points"],
        totalCouponAmount: json["total_coupon_amount"],
        totalPromotionAmount: json["total_promotion_amount"],
        shippingCouponAmount: json["shipping_coupon_amount"],
        shippingDiscountAmount: json["shipping_discount_amount"],
        shippingAmount: json["shipping_amount"],
        shippingFee: json["shipping_fee"],
        codFee: json["cod_fee"],
        totalAmount: json["total_amount"],
        totalOrigin: json["total_origin"],
        totalCount: json["total_count"],
        paidAmount: json["paid_amount"],
        closeable: json["closeable"],
        questionable: json["questionable"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "no": no,
        "uuid": uuid,
        "date": date,
        "type": type,
        "type_name": typeName,
        "category": category,
        "category_name": categoryName,
        "cancel_status": cancelStatus,
        "cancel_status_name": cancelStatusName,
        "order_status": orderStatus,
        "order_status_name": orderStatusName,
        "shipping_methods": shippingMethods,
        "coupons": List<dynamic>.from(coupons.map((x) => x)),
        "order_points": orderPoints,
        "product_points": productPoints,
        "total_coupon_amount": totalCouponAmount,
        "total_promotion_amount": totalPromotionAmount,
        "shipping_coupon_amount": shippingCouponAmount,
        "shipping_discount_amount": shippingDiscountAmount,
        "shipping_amount": shippingAmount,
        "shipping_fee": shippingFee,
        "cod_fee": codFee,
        "total_amount": totalAmount,
        "total_origin": totalOrigin,
        "total_count": totalCount,
        "paid_amount": paidAmount,
        "closeable": closeable,
        "questionable": questionable,
    };
}