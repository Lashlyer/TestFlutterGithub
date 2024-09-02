
enum OrderEstablishedShipType {
  homedelivery,
  sevenEleven,
  familymart,
  storepickup
}

extension OrderEstablishedShipTypeExtention on OrderEstablishedShipType {
  String typeName() {

    switch (this) {
      
      case OrderEstablishedShipType.homedelivery:
        return '宅配';
      case OrderEstablishedShipType.sevenEleven:
        return '7-11 取貨';
      case OrderEstablishedShipType.familymart:
        return '全家 取貨';
      case OrderEstablishedShipType.storepickup:
        return '門市 自取';
    }
  }
}