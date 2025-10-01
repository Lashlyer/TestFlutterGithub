

import 'package:shopping_list/models/orderhistory/orderrecorddetail/orderrecorddetailitem.dart';
import 'package:shopping_list/models/orderhistory/orderrecorddetail/step.dart';

class Suborder {
    int id;
    String no;
    // dynamic uuid;
    int type;
    String name;
    int refundNum;
    int cancelStatus;
    String cancelStatusName;
    int orderStatus;
    String orderStatusName;
    int shippingMethod;
    String shippingMethodName;
    String receiverName;
    String receiverPhone;
    String receiverAddress;
    String receiverCity;
    String receiverArea;
    String receiverZipcode;
    String receiverMemo;
    String? storeNo;
    String storeName;
    String storeAddress;
    String storePhone;
    String pickupType;
    String? pickupTime;
    String? vendorName;
    List<dynamic> shippings;
    int shippingStatus;
    String? shippingCouponName;
    int shippingCouponAmount;
    int shippingDiscountAmount;
    int shippingAmount;
    int shippingFee;
    int codFee;
    int totalCount;
    int totalOrigin;
    int totalAmount;
    int totalFreight;
    List<Step> steps;
    bool cancelable;
    bool refundable;
    bool questionable;
    List<OrderRecordDetailItem> items;

    Suborder({
        required this.id,
        required this.no,
        // required this.uuid,
        required this.type,
        required this.name,
        required this.refundNum,
        required this.cancelStatus,
        required this.cancelStatusName,
        required this.orderStatus,
        required this.orderStatusName,
        required this.shippingMethod,
        required this.shippingMethodName,
        required this.receiverName,
        required this.receiverPhone,
        required this.receiverAddress,
        required this.receiverCity,
        required this.receiverArea,
        required this.receiverZipcode,
        required this.receiverMemo,
        required this.storeNo,
        required this.storeName,
        required this.storeAddress,
        required this.storePhone,
        required this.pickupType,
        required this.pickupTime,
        required this.vendorName,
        required this.shippings,
        required this.shippingStatus,
        required this.shippingCouponName,
        required this.shippingCouponAmount,
        required this.shippingDiscountAmount,
        required this.shippingAmount,
        required this.shippingFee,
        required this.codFee,
        required this.totalCount,
        required this.totalOrigin,
        required this.totalAmount,
        required this.totalFreight,
        required this.steps,
        required this.cancelable,
        required this.refundable,
        required this.questionable,
        required this.items
    });

    factory Suborder.fromJson(Map<String, dynamic> json, List<OrderRecordDetailItem> items)
         => Suborder(
        id: json["id"],
        no: json["no"],
        // uuid: json["uuid"],
        type: json["type"],
        name: json["name"],
        refundNum: json["refund_num"],
        cancelStatus: json["cancel_status"],
        cancelStatusName: json["cancel_status_name"],
        orderStatus: json["order_status"],
        orderStatusName: json["order_status_name"],
        shippingMethod: json["shipping_method"],
        shippingMethodName: json["shipping_method_name"],
        receiverName: json["receiver_name"],
        receiverPhone: json["receiver_phone"],
        receiverAddress: json["receiver_address"],
        receiverCity: json["receiver_city"],
        receiverArea: json["receiver_area"],
        receiverZipcode: json["receiver_zipcode"],
        receiverMemo: json["receiver_memo"],
        storeNo: json["store_no"] ?? '',
        storeName: json["store_name"],
        storeAddress: json["store_address"],
        storePhone: json["store_phone"],
        pickupType: json["pickup_type"],
        pickupTime: json["pickup_time"],
        vendorName: json["vendor_name"],
        shippings: List<dynamic>.from(json["shippings"].map((x) => x)),
        shippingStatus: json["shipping_status"],
        shippingCouponName: json["shipping_coupon_name"],
        shippingCouponAmount: json["shipping_coupon_amount"],
        shippingDiscountAmount: json["shipping_discount_amount"],
        shippingAmount: json["shipping_amount"],
        shippingFee: json["shipping_fee"],
        codFee: json["cod_fee"],
        totalCount: json["total_count"],
        totalOrigin: json["total_origin"],
        totalAmount: json["total_amount"],
        totalFreight: json["total_freight"],
        steps: List<Step>.from(json["steps"].map((x) => Step.fromJson(x))),
        cancelable: json["cancelable"],
        refundable: json["refundable"],
        questionable: json["questionable"],
        items: items
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "no": no,
        // "uuid": uuid,
        "type": type,
        "name": name,
        "refund_num": refundNum,
        "cancel_status": cancelStatus,
        "cancel_status_name": cancelStatusName,
        "order_status": orderStatus,
        "order_status_name": orderStatusName,
        "shipping_method": shippingMethod,
        "shipping_method_name": shippingMethodName,
        "receiver_name": receiverName,
        "receiver_phone": receiverPhone,
        "receiver_address": receiverAddress,
        "receiver_city": receiverCity,
        "receiver_area": receiverArea,
        "receiver_zipcode": receiverZipcode,
        "receiver_memo": receiverMemo,
        "store_no": storeNo,
        "store_name": storeName,
        "store_address": storeAddress,
        "store_phone": storePhone,
        "pickup_type": pickupType,
        "pickup_time": pickupTime,
        "vendor_name": vendorName,
        "shippings": List<dynamic>.from(shippings.map((x) => x)),
        "shipping_status": shippingStatus,
        "shipping_coupon_name": shippingCouponName,
        "shipping_coupon_amount": shippingCouponAmount,
        "shipping_discount_amount": shippingDiscountAmount,
        "shipping_amount": shippingAmount,
        "shipping_fee": shippingFee,
        "cod_fee": codFee,
        "total_count": totalCount,
        "total_origin": totalOrigin,
        "total_amount": totalAmount,
        "total_freight": totalFreight,
        "steps": List<dynamic>.from(steps.map((x) => x.toJson())),
        "cancelable": cancelable,
        "refundable": refundable,
        "questionable": questionable,
    };

    String suborderaddress() {
      return '$receiverZipcode$receiverCity$receiverArea$receiverAddress';
    }
}