import 'package:shopping_list/models/shopcart/cart.dart';
import 'package:shopping_list/models/shopcart/orderSetting.dart';
import 'package:shopping_list/models/shopcart/ordershipmethod.dart';
import 'package:shopping_list/models/shopcart/shopCartSetting.dart';

class Order {
  final int orderType;

  final List<Cart> carts;

  final int priceTotal;

  final OrderSetting set;

  OrderShipMethod? shipMethod;

  Order(
      {required this.carts,
      required this.priceTotal,
      required this.orderType,
      required this.set});

  factory Order.create(ShopCartSetting set, List<Cart> carts) {
    final total = carts.fold(
        0, (previousValue, cart) => previousValue + cart.subtotalOrigin);

    final OrderSetting orderset = OrderSetting(
      isShipOutSide: set.getOrderShippingOutSides()[carts.first.orderType - 1], 
      freeShippingThreshold: set.getOrderFreeShippingThresholds()[carts.first.orderType - 1], 
      shippingAmount: set.settings.shippingAmount);

    return Order(
        priceTotal: total,
        carts: carts,
        orderType: carts.first.orderType,
        set: orderset);
  }

  int commodityTotoalCount() {
    
    final count = carts.fold(0, (previousValue, cart) => previousValue + cart.count);

    return count;
  }

  bool isFreeShip() {
    return priceTotal > set.freeShippingThreshold;
  }

  String orderTypeName() {
    switch (orderType) {
      case 1:
        return '常溫訂單';
      case 2:
        return '冷藏訂單';
      case 3:
        return '冷凍訂單';
      case 4:
        return '廠商出貨訂單';
      default:
        return '';
    }
  }
}
