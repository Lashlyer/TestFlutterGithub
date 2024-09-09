import 'package:flutter/cupertino.dart';
import 'package:shopping_list/models/home/shopcartorderEstablished/orderestablishedModel.dart';
import 'package:shopping_list/models/shopcart/order.dart';
import 'package:shopping_list/models/shopcart/ordershipmethod.dart';
import 'package:shopping_list/models/shopcartdelivery/buyer.dart';
import 'package:shopping_list/models/shopcartdelivery/shopcartdelivery.dart';
import 'package:shopping_list/widgets/purchaseform/purchaseformscreen.dart';
import 'package:shopping_list/widgets/shipmethodselectscreen/shipmethodscreen.dart';
import 'package:shopping_list/widgets/shopcartOrderEstablish/orderestablishScreen.dart';

class ShopcartDeliveryViewmodel with ChangeNotifier {
  ShopcartDeliveryModel model;

  ShopcartDeliveryViewmodel({required this.model});

  factory ShopcartDeliveryViewmodel.create(ShopcartDeliveryModel model) {
    return ShopcartDeliveryViewmodel(model: model);
  }

  void pressNext(BuildContext context) {
    print(model.shopcart.orders.map((e) => e.shipMethod!.toJson()));
    print(model.invoiceCheck.toString());
    print(model.paymentType.toString());
    Navigator.of(context).push(CupertinoPageRoute(
        builder: (ctx) =>
            OrderEstablishedScreen(model: ShopcartOrderEstablished.mockup())));


  }

  void selectShip(BuildContext context, Order order) async {
    final result = await Navigator.push(
      context, 
      CupertinoPageRoute(
        builder: (ctx) =>
            ShipMethodSelectScreen(shipMethods: [
              OrderShipMethod.mockup(''),
              OrderShipMethod.mockup('remark')],
              selectedOrder: order))
    );

    if (result != null && result is OrderShipMethod) {
      notifyListeners();
    }
  }

  void selectBuyer(BuildContext context, Buyer? buyer) async {
    final result = await Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (ctx) => 
          PurchaseFormPage()
        )
      );
    if (result != null && result is Buyer) {
      model.buyer = result;
      notifyListeners();
    }
  }
}
