

import 'package:shopping_list/models/shopcart/cart.dart';
import 'package:shopping_list/models/shopcart/order.dart';
import 'package:shopping_list/models/shopcart/shopCartPersent.dart';
import 'package:shopping_list/models/shopcart/shopCartSetting.dart';
import 'package:shopping_list/models/shopcart/summary.dart';

class FullSiteCoupon {
  List<CouponElement> valids;
  List<CouponElement> unValids;
  List<CouponElement> selects;

  FullSiteCoupon({required this.valids, required this.unValids, required this.selects});

  factory FullSiteCoupon.create(List<CouponElement> coupons, int total) {
    List<CouponElement> valid = []; 
    List<CouponElement> unValids = [];

    for (var coupon in coupons) {
      switch (coupon.type) {
        case 6:
          unValids.add(coupon);
        case 7:
          unValids.add(coupon);
        case 8:
          valid.add(coupon);
        case 9:
          if (total > coupon.discountNum) {
            valid.add(coupon);
          }
        default:
          continue;
      }
    }

    return FullSiteCoupon(valids: valid, unValids: unValids, selects: []);
  }
}

class ShopCartModel {
    bool valid;
    List<Present> presents;
    ShopCartSummary summary;
    List<Cart> carts;
    List<Order> orders;
    String hash;
    Map<String, String> orderTypes;
    ShopCartSetting setting;
    FullSiteCoupon fullSiteCoupon;

    ShopCartModel({
        required this.valid,
        required this.presents,
        required this.summary,
        required this.carts,
        required this.orders,       
        required this.hash,
        required this.orderTypes,
        required this.setting,
        required this.fullSiteCoupon

    });

    factory ShopCartModel.create(Map<String, dynamic> cartEntity, Map<String, dynamic> settingEntity) {
      final Map<int, List<Cart>> groupedMap = {};
      final List<Cart> c = List<Cart>.from(cartEntity["carts"].map((x) => Cart.fromJson(x)));
      final ShopCartSetting set = ShopCartSetting.fromJson(settingEntity);
      final ShopCartSummary summary = ShopCartSummary.fromJson(cartEntity["summary"]);
      List<Order> orders = [];

      for (var cart in c) {
        groupedMap.putIfAbsent(cart.orderType, () => []).add(cart);
      }

      for (var carts in groupedMap.values.toList()) {
         orders.add(Order.create(set, carts));
      }
      
      orders.sort((a, b) => a.carts.first.orderType.compareTo(b.carts.first.orderType),);

      List<int> validCouponsType = [6, 7, 8, 9];
      List<CouponElement> fullsiteCoupons = set.coupon.coupons.where((coupon) => 
      validCouponsType.contains(coupon.type)).toList();


      return ShopCartModel(
        valid: cartEntity["valid"], 
        presents: List<Present>.from(cartEntity["presents"].map((x) => Present.fromJson(x))), 
        summary: summary, 
        carts: List<Cart>.from(cartEntity["carts"].map((x) => Cart.fromJson(x))),
        orders: orders, 
        hash: cartEntity["hash"], 
        orderTypes: Map.from(cartEntity["order_types"]).map((k, v) => MapEntry<String, String>(k, v)), 
        setting: ShopCartSetting.fromJson(settingEntity),
        fullSiteCoupon: FullSiteCoupon.create(fullsiteCoupons, summary.totalAmount)
      );
    }

    factory ShopCartModel.fromJson(Map<String, dynamic> cartEntity, Map<String,dynamic> settingEntity) => ShopCartModel(
        valid: cartEntity["valid"],
        presents: List<Present>.from(cartEntity["presents"].map((x) => Present.fromJson(x))),
        summary: ShopCartSummary.fromJson(cartEntity["summary"]),
        carts: List<Cart>.from(cartEntity["carts"].map((x) => Cart.fromJson(x))),
        orders: [],
        hash: cartEntity["hash"],
        orderTypes: Map.from(cartEntity["order_types"]).map((k, v) => MapEntry<String, String>(k, v)),
        setting: ShopCartSetting.fromJson(settingEntity),
        fullSiteCoupon: FullSiteCoupon(valids: [], unValids: [], selects: [])
    );

    Map<String, dynamic> toJson() => {
        "valid": valid,
        "presents": List<dynamic>.from(presents.map((x) => x.toJson())),
        "summary": summary.toJson(),
        "carts": List<dynamic>.from(carts.map((x) => x.toJson())),
        "hash": hash,
        "order_types": Map.from(orderTypes).map((k, v) => MapEntry<String, dynamic>(k, v)),
    };

    int feebackPoint() {
      return summary.totalAmount ~/ setting.settings.pointAmount * setting.settings.pointNum;
    }
}