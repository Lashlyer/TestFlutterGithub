
class OrderShipMethod {
  final String name;
  final String phone;
  final String zipcode;
  final String address;
  final String remark;

  OrderShipMethod({required this.name, required this.phone, required this.zipcode, required this.address, required this.remark});

  factory OrderShipMethod.mockup(String remark) {
    return OrderShipMethod(
      name: '貝果', 
      phone: '0912123123', 
      zipcode: '104', 
      address: '台北市中山區南京東路一段96號9樓', 
      remark: remark
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'phone': phone,
      'zipcode': zipcode,
      'address': address,
      'remark': remark
    };
  }
}