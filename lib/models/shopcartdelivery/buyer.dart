

class Buyer {
  final String name;
  final String phone;
  final String zipCode;
  final String city;
  final String area;
  final String address;

  Buyer({required this.name, required this.phone, required this.zipCode, required this.city, required this.area, required this.address});


  Buyer mockup() {
    return Buyer(
      name: '瀾宮讚欸', 
      phone: '0912123123', 
      zipCode: '123', 
      city: '伊拉克', 
      area: '戰區', 
      address: '賴皮聊賴皮寮賴皮聊賴皮寮賴皮聊賴皮寮');
  }
}