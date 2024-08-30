import 'package:shopping_list/models/home/shopcartorderEstablished/orderItem.dart';
import 'package:shopping_list/models/home/shopcartorderEstablished/orderestablishedDetail.dart';

class ShopcartOrderEstablished {
  /// 當前購物車數量
  final int cartCount;

  final OrderEstablishedDetail detail;

  /// 訂單是否建立成功
  final bool isSucces;

  /// 訂單列表
  final List<OrderItem> orderitmes;

  /// testgit
  final int aa;

  /// 申請收據期限
  final String? applyDeadline;

  /// 捐贈單位
  // let sponserUnit: SponcerUnit?
  /// 專案名稱
  final String? projectTitle;

  ShopcartOrderEstablished(this.aa, 
      {required this.cartCount,
      required this.detail,
      required this.isSucces,
      required this.orderitmes,
      required this.applyDeadline,
      required this.projectTitle});
}
