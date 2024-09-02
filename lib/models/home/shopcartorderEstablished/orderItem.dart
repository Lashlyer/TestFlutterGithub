
import 'package:shopping_list/models/home/shopcartorderEstablished/shiptype.dart';
import 'package:shopping_list/models/shopcart/ordertype.dart';

class OrderItem { 
  final int id;
        /// 溫層訂單名稱
  final String orderTitle;
        /// 商品數量
  final int quantity;
        /// 運送方式
  final OrderEstablishedShipType shipType;
        /// 總計
  final int total;
        /// 預計出貨日（預購訂單）
  final String? preDate;
        /// 取貨人（預購訂單）
  final String? pickupName;
        /// 取貨人電話（預購訂單）
  final String? phone;
        /// 取貨門市（預購訂單）
  final String? storeName;
        /// 門市取貨人，本人或親友
  final String? inStorePickupTypeName;

  final String? uuid;

  OrderItem({
    required this.id, 
    required this.orderTitle, 
    required this.quantity, 
    required this.shipType,
    required this.total, 
    required this.preDate, 
    required this.pickupName, 
    required this.phone, 
    required this.storeName, 
    required this.inStorePickupTypeName, 
    required this.uuid
  });

  factory OrderItem.mockup(OrderType ordertype, OrderEstablishedShipType shipType) {
    return OrderItem(
      id: 00, 
      orderTitle: ordertype.typeName(), 
      quantity: 10, 
      shipType: shipType, 
      total: 3135, 
      preDate: 'preDate', 
      pickupName: 'pickupName', 
      phone: 'phone', 
      storeName: 'storeName', 
      inStorePickupTypeName: 'inStorePickupTypeName', 
      uuid: 'uuid'
    );
  }
}