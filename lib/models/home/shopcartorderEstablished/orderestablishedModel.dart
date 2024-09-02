import 'package:shopping_list/models/home/shopcartorderEstablished/orderItem.dart';
import 'package:shopping_list/models/home/shopcartorderEstablished/orderestablishedDetail.dart';
import 'package:shopping_list/models/home/shopcartorderEstablished/shiptype.dart';
import 'package:shopping_list/models/shopcart/ordertype.dart';

class ShopcartOrderEstablished {
  /// 當前購物車數量
  final int cartCount;

  final OrderEstablishedDetail detail;

  /// 訂單是否建立成功
  final bool isSucces;

  /// 訂單列表
  final List<OrderItem> orderitmes;

  /// 申請收據期限
  final String? applyDeadline;

  /// 捐贈單位
  // let sponserUnit: SponcerUnit?
  /// 專案名稱
  final String? projectTitle;

  ShopcartOrderEstablished( 
      {required this.cartCount,
      required this.detail,
      required this.isSucces,
      required this.orderitmes,
      required this.applyDeadline,
      required this.projectTitle});


  factory ShopcartOrderEstablished.mockup() {
    return ShopcartOrderEstablished(
      cartCount: 10, 
      detail: OrderEstablishedDetail.mockup(), 
      isSucces: true, 
      orderitmes: [
        OrderItem.mockup(OrderType.normal, OrderEstablishedShipType.homedelivery),
        OrderItem.mockup(OrderType.frezzing, OrderEstablishedShipType.homedelivery),
        OrderItem.mockup(OrderType.cold, OrderEstablishedShipType.homedelivery)
        ], 
      applyDeadline: 'asfpafjpafjp', 
      projectTitle: ''
    );
  }
}
