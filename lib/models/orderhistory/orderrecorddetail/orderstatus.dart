
enum OrderStatus {
  pendingPayment,   // 0：待付款
  pendingConfirmation,  // 1：待確認
  processing,  // 2：處理中
  shipped,  // 3：已出貨
  pendingPickup,  // 4：待取貨
  completed,  // 5：已完成
  canceled,  // 9：已取消
}

// 定義方法來取得每個狀態的對應描述
extension OrderStatusExtension on OrderStatus {
  String get description {
    switch (this) {
      case OrderStatus.pendingPayment:
        return "待付款";
      case OrderStatus.pendingConfirmation:
        return "待確認";
      case OrderStatus.processing:
        return "處理中";
      case OrderStatus.shipped:
        return "已出貨";
      case OrderStatus.pendingPickup:
        return "待取貨";
      case OrderStatus.completed:
        return "已完成";
      case OrderStatus.canceled:
        return "已取消";
      default:
        return "";
    }
  }
  
  // 如果需要轉換數字對應的狀態
  static OrderStatus fromInt(int status) {
    switch (status) {
      case 0:
        return OrderStatus.pendingPayment;
      case 1:
        return OrderStatus.pendingConfirmation;
      case 2:
        return OrderStatus.processing;
      case 3:
        return OrderStatus.shipped;
      case 4:
        return OrderStatus.pendingPickup;
      case 5:
        return OrderStatus.completed;
      case 9:
        return OrderStatus.canceled;
      default:
        throw Exception("無效的狀態碼");
    }
  }
}
