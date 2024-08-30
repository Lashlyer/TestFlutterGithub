

class OrderSetting {
  
  final bool isShipOutSide;
  final int freeShippingThreshold;
  final int shippingAmount;

  OrderSetting({required this.isShipOutSide, required this.freeShippingThreshold, required this.shippingAmount});

  String shipMethodName() {
    return isShipOutSide ? '宅配' : '宅配（限本島）';
  }

}