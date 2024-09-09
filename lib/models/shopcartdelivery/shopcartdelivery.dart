

import 'package:shopping_list/models/shopcart/shopCartModel.dart';
import 'package:shopping_list/models/shopcartdelivery/buyer.dart';
import 'package:shopping_list/widgets/shopcartDelivery/paymentmethodScreen.dart';

class ShopcartDeliveryModel {

  ShopCartModel shopcart;

  Buyer? buyer;

  PaymentType paymentType;

  String? orderRemark;

  bool invoiceCheck;

  ShopcartDeliveryModel({required this.shopcart, required this.paymentType, required this.invoiceCheck, this.orderRemark});

  factory ShopcartDeliveryModel.create(ShopCartModel shopcart) {
    return ShopcartDeliveryModel(
      shopcart: shopcart, 
      paymentType: PaymentType.credicard,
      invoiceCheck: false,
      orderRemark: 'ddadaddkadpakd'
    );
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

  void printAll() {
    
    
  }
}