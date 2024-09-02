enum OrderType { normal, cold, frezzing, vendor }

extension OrderTypeExtentions on OrderType {
  String typeName() {
    switch (this) {
      case OrderType.normal:
        return '常溫訂單';
      case OrderType.cold:
        return '冷藏訂單';
      case OrderType.frezzing:
        return '冷凍訂單';
      case OrderType.vendor:
        return '廠商出貨訂單';
    }
  }
}
