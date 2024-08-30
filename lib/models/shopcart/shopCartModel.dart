

import 'package:shopping_list/models/shopcart/cart.dart';
import 'package:shopping_list/models/shopcart/order.dart';
import 'package:shopping_list/models/shopcart/shopCartPersent.dart';
import 'package:shopping_list/models/shopcart/shopCartSetting.dart';
import 'package:shopping_list/models/shopcart/summary.dart';

class ShopCartModel {
    bool valid;
    List<Present> presents;
    ShopCartSummary summary;
    List<Cart> carts;
    List<Order> orders;
    String hash;
    Map<String, String> orderTypes;
    ShopCartSetting setting;

    ShopCartModel({
        required this.valid,
        required this.presents,
        required this.summary,
        required this.carts,
        required this.orders,       
        required this.hash,
        required this.orderTypes,
        required this.setting

    });

    factory ShopCartModel.create(Map<String, dynamic> cartEntity, Map<String, dynamic> settingEntity) {
      final Map<int, List<Cart>> groupedMap = {};
      final List<Cart> c = List<Cart>.from(cartEntity["carts"].map((x) => Cart.fromJson(x)));
      final ShopCartSetting set = ShopCartSetting.fromJson(settingEntity);
      List<Order> orders = [];

      for (var cart in c) {
        groupedMap.putIfAbsent(cart.orderType, () => []).add(cart);
      }

      for (var carts in groupedMap.values.toList()) {
         orders.add(Order.create(set, carts));
      }
      
      orders.sort((a, b) => a.carts.first.orderType.compareTo(b.carts.first.orderType),);

      return ShopCartModel(
        valid: cartEntity["valid"], 
        presents: List<Present>.from(cartEntity["presents"].map((x) => Present.fromJson(x))), 
        summary: ShopCartSummary.fromJson(cartEntity["summary"]), 
        carts: List<Cart>.from(cartEntity["carts"].map((x) => Cart.fromJson(x))),
        orders: orders, 
        hash: cartEntity["hash"], 
        orderTypes: Map.from(cartEntity["order_types"]).map((k, v) => MapEntry<String, String>(k, v)), 
        setting: ShopCartSetting.fromJson(settingEntity)
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
        setting: ShopCartSetting.fromJson(settingEntity)
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