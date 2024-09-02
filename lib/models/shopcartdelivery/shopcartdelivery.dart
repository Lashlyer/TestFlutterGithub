

import 'package:shopping_list/models/shopcart/shopCartModel.dart';
import 'package:shopping_list/models/shopcartdelivery/buyer.dart';

class ShopcartDeliveryModel {

  ShopCartModel shopcart;

  Buyer? buyer;

  ShopcartDeliveryModel({required this.shopcart});

  factory ShopcartDeliveryModel.create(ShopCartModel shopcart) {
    return ShopcartDeliveryModel(shopcart: shopcart);
  }

  bool isCheckOutValid() {
    return true;
  }

  int getTotal() {
    final shipAmountTotal = shopcart.orders.fold(0, (previousValue, element) => previousValue + element.set.shippingAmount);

    return shopcart.summary.totalAmount + shipAmountTotal;
  }

  int getShipAmountTotal() {
    return shopcart.orders.fold(0, (previousValue, element) => previousValue + element.set.shippingAmount);
  }
}