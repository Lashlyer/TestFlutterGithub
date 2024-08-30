class ShopCartSetting {
  // List<Payment> payments;
  // List<Shipment> shipments;
  // DataCoupon coupon;
  // List<dynamic> additions;
  Settings settings;

  ShopCartSetting({
    // required this.payments,
    // required this.shipments,
    // required this.coupon,
    // required this.additions,
    required this.settings,
  });

  factory ShopCartSetting.fromJson(Map<String, dynamic> json) =>
      ShopCartSetting(
        // payments: List<Payment>.from(json["payments"].map((x) => Payment.fromJson(x))),
        // shipments: List<Shipment>.from(json["shipments"].map((x) => Shipment.fromJson(x))),
        // coupon: DataCoupon.fromJson(json["coupon"]),
        // additions: List<dynamic>.from(json["additions"].map((x) => x)),
        settings: Settings.fromJson(json["settings"]),
      );

  Map<String, dynamic> toJson() => {
        // "payments": List<dynamic>.from(payments.map((x) => x.toJson())),
        // "shipments": List<dynamic>.from(shipments.map((x) => x.toJson())),
        // "coupon": coupon.toJson(),
        // "additions": List<dynamic>.from(additions.map((x) => x)),
        "settings": settings.toJson(),
      };

  List<int> getOrderFreeShippingThresholds() {
    return [
      settings.freeShippingThreshold1,
      settings.freeShippingThreshold2,
      settings.freeShippingThreshold3,
      settings.freeShippingThreshold4
    ];
  }

  List<bool> getOrderShippingOutSides() {
    return [
      settings.shippingOutside1,
      settings.shippingOutside2,
      settings.shippingOutside3,
      settings.shippingOutside4
    ];
  }
}

class DataCoupon {
  List<CouponElement> coupons;
  Map<String, List<int>>? products;
  Map<String, List<int>> orders;

  DataCoupon({
    required this.coupons,
    required this.products,
    required this.orders,
  });

  factory DataCoupon.fromJson(Map<String, dynamic> json) => DataCoupon(
        coupons: List<CouponElement>.from(
            json["coupons"].map((x) => CouponElement.fromJson(x))),
        products: json["products"],
        orders: Map.from(json["orders"]).map((k, v) =>
            MapEntry<String, List<int>>(k, List<int>.from(v.map((x) => x)))),
      );

  Map<String, dynamic> toJson() => {
        "coupons": List<dynamic>.from(coupons.map((x) => x.toJson())),
        "products": products,
        "orders": Map.from(orders).map((k, v) =>
            MapEntry<String, dynamic>(k, List<dynamic>.from(v.map((x) => x)))),
      };
}

class CouponElement {
  int id;
  int type;
  String name;
  String image;
  String summary;
  int discountNum;
  int discountAmount;
  String orderType;
  String couponId;
  String startTime;
  String endTime;

  CouponElement({
    required this.id,
    required this.type,
    required this.name,
    required this.image,
    required this.summary,
    required this.discountNum,
    required this.discountAmount,
    required this.orderType,
    required this.couponId,
    required this.startTime,
    required this.endTime,
  });

  factory CouponElement.fromJson(Map<String, dynamic> json) => CouponElement(
        id: json["id"],
        type: json["type"],
        name: json["name"],
        image: json["image"],
        summary: json["summary"],
        discountNum: json["discount_num"],
        discountAmount: json["discount_amount"],
        orderType: json["order_type"],
        couponId: json["coupon_id"],
        startTime: json["start_time"],
        endTime: json["end_time"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "name": name,
        "image": image,
        "summary": summary,
        "discount_num": discountNum,
        "discount_amount": discountAmount,
        "order_type": orderType,
        "coupon_id": couponId,
        "start_time": startTime,
        "end_time": endTime,
      };
}

class Payment {
  int id;
  String name;
  int cart;
  int shipment;
  int fee;
  int limit;
  String enable;
  String disable;
  String? tip;

  Payment({
    required this.id,
    required this.name,
    required this.cart,
    required this.shipment,
    required this.fee,
    required this.limit,
    required this.enable,
    required this.disable,
    this.tip,
  });

  factory Payment.fromJson(Map<String, dynamic> json) => Payment(
        id: json["id"],
        name: json["name"],
        cart: json["cart"],
        shipment: json["shipment"],
        fee: json["fee"],
        limit: json["limit"],
        enable: json["enable"],
        disable: json["disable"],
        tip: json["tip"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "cart": cart,
        "shipment": shipment,
        "fee": fee,
        "limit": limit,
        "enable": enable,
        "disable": disable,
        "tip": tip,
      };
}

class Settings {
  int pointAmount;
  int pointNum;
  int freeShippingThreshold1;
  int freeShippingThreshold2;
  int freeShippingThreshold3;
  int freeShippingThreshold4;
  bool shippingOutside1;
  bool shippingOutside2;
  bool shippingOutside3;
  bool shippingOutside4;
  bool shippingOutside711;
  bool shippingOutsideFamily;
  int shippingAmount;
  int shippingOutsideAmount;
  int supermarketkFee;
  int codFee;

  Settings({
    required this.pointAmount,
    required this.pointNum,
    required this.freeShippingThreshold1,
    required this.freeShippingThreshold2,
    required this.freeShippingThreshold3,
    required this.freeShippingThreshold4,
    required this.shippingOutside1,
    required this.shippingOutside2,
    required this.shippingOutside3,
    required this.shippingOutside4,
    required this.shippingOutside711,
    required this.shippingOutsideFamily,
    required this.shippingAmount,
    required this.shippingOutsideAmount,
    required this.supermarketkFee,
    required this.codFee,
  });

  factory Settings.fromJson(Map<String, dynamic> json) => Settings(
        pointAmount: json["point_amount"],
        pointNum: json["point_num"],
        freeShippingThreshold1: json["free_shipping_threshold_1"],
        freeShippingThreshold2: json["free_shipping_threshold_2"],
        freeShippingThreshold3: json["free_shipping_threshold_3"],
        freeShippingThreshold4: json["free_shipping_threshold_4"],
        shippingOutside1: json["shipping_outside_1"],
        shippingOutside2: json["shipping_outside_2"],
        shippingOutside3: json["shipping_outside_3"],
        shippingOutside4: json["shipping_outside_4"],
        shippingOutside711: json["shipping_outside_711"],
        shippingOutsideFamily: json["shipping_outside_family"],
        shippingAmount: json["shipping_amount"],
        shippingOutsideAmount: json["shipping_outside_amount"],
        supermarketkFee: json["supermarketk_fee"],
        codFee: json["cod_fee"],
      );

  Map<String, dynamic> toJson() => {
        "point_amount": pointAmount,
        "point_num": pointNum,
        "free_shipping_threshold_1": freeShippingThreshold1,
        "free_shipping_threshold_2": freeShippingThreshold2,
        "free_shipping_threshold_3": freeShippingThreshold3,
        "free_shipping_threshold_4": freeShippingThreshold4,
        "shipping_outside_1": shippingOutside1,
        "shipping_outside_2": shippingOutside2,
        "shipping_outside_3": shippingOutside3,
        "shipping_outside_4": shippingOutside4,
        "shipping_outside_711": shippingOutside711,
        "shipping_outside_family": shippingOutsideFamily,
        "shipping_amount": shippingAmount,
        "shipping_outside_amount": shippingOutsideAmount,
        "supermarketk_fee": supermarketkFee,
        "cod_fee": codFee,
      };
}

class Shipment {
  int id;
  String name;
  int cart;

  Shipment({
    required this.id,
    required this.name,
    required this.cart,
  });

  factory Shipment.fromJson(Map<String, dynamic> json) => Shipment(
        id: json["id"],
        name: json["name"],
        cart: json["cart"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "cart": cart,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
