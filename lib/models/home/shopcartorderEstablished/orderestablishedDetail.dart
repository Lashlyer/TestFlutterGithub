import 'package:shopping_list/models/home/shopcartorderEstablished/bankAccount.dart';
import 'package:shopping_list/models/home/shopcartorderEstablished/paymentStatus.dart';
import 'package:shopping_list/widgets/shopcartDelivery/paymentmethodScreen.dart';

class OrderEstablishedDetail {
  /// 訂單ＩＤ
  int id;
  /// 訂單類型
  int type;
  /// 訂單類型名稱
  String orderTitle;
  /// 訂單編號
  String no;
  /// 訂單總價格
  int totalPrice;
  /// 訂單付款方式
  PaymentType paymentType;
  /// 訂單付款狀態
  PaymentStatus paymentStatus;
  /// 銀行資訊
  BankAccount bankAccount;
  /// 取貨條碼
  // let barcode: StorePaymentBarcodeEntity?
  /// 付款期限 會在初始化時候判斷是不是atm還是超商還是信用卡
  String expiredAt;


  OrderEstablishedDetail({
    required this.id,
    required this.type,
    required this.orderTitle,
    required this.no,
    required this.totalPrice,
    required this.paymentType,
    required this.paymentStatus,
    required this.bankAccount,
    required this.expiredAt
  });


  factory OrderEstablishedDetail.mockup() {
    return OrderEstablishedDetail(
      id: 123, 
      type: 1, 
      orderTitle: '一般訂單', 
      no: '23123213131', 
      totalPrice: 3151, 
      paymentType: PaymentType.atm, 
      paymentStatus: PaymentStatus.unpaid, 
      bankAccount: BankAccount.mockup(), 
      expiredAt: 'expiredAt');
  }
}
