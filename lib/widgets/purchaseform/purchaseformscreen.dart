import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping_list/data/categories.dart';
import 'package:shopping_list/models/shopcartdelivery/buyer.dart';

class PurchaseFormPage extends StatefulWidget {
  @override
  _PurchaseFormPageState createState() => _PurchaseFormPageState();
}

class _PurchaseFormPageState extends State<PurchaseFormPage> {
  // 模擬表單資料
  String? selectedCity;
  String? selectedDistrict;
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final addressController = TextEditingController();
  final zipCodeContorller = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    addressController.dispose();
    zipCodeContorller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('訂購人資料'),
          backgroundColor: LeezenColor.primary001.getTypeColor(), // 類似綠色的背景
        ),
        body: Stack(
          children: [
            Positioned.fill(
                child: Image.asset(
              'assets/splash_bg.png',
              fit: BoxFit.cover,
            )),
            Positioned(
              left: 0,
              right: 0,
              top: 0,
              bottom: 60,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 姓名輸入
                    _buildLabel('姓名'),
                    _buildTextField(nameController, '貝小果'),
                    const SizedBox(height: 16),

                    // 手機號碼輸入
                    _buildLabel('手機號碼'),
                    _buildTextField(phoneController, '0911777777'),
                    const SizedBox(height: 16),

                    // 地址
                    _buildLabel('地址'),
                    Row(
                      children: [
                        // 城市選擇
                        Expanded(
                          child: _buildDropdownButton(
                            value: selectedCity,
                            hint: '台北市',
                            items: ['台北市', '新北市', '高雄市'],
                            onChanged: (value) {
                              setState(() {
                                selectedCity = value;
                              });
                            },
                          ),
                        ),
                        const SizedBox(width: 8),
                        // 區域選擇
                        Expanded(
                          child: _buildDropdownButton(
                            value: selectedDistrict,
                            hint: '中山區',
                            items: ['中山區', '信義區', '士林區'],
                            onChanged: (value) {
                              setState(() {
                                selectedDistrict = value;
                              });
                            },
                          ),
                        ),
                        const SizedBox(width: 8),
                        // 郵遞區號
                        Container(
                          width: 60,
                          child: _buildTextField(zipCodeContorller, '104'),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    // 詳細地址
                    _buildTextField(addressController, '林森北路149-1號'),

                    // 確認按鈕
                  ],
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              height: 60,
              child: InkWell(
                onTap: () {
                  Navigator.pop(context, setButer());
                },
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: LeezenDecoration.normal.topShadowDecoration(),
                  child: Container(
                    width: double.infinity,
                    height: 40,
                    decoration: BoxDecoration(
                        color: LeezenColor.primary001.getTypeColor(),
                        borderRadius: BorderRadius.circular(30)),
                    child: const Center(
                        child: Text(
                      '確認',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                    )),
                  ),
                ),
              ),
            ),
          ],
        ));
  }

  // 建立 TextField
  Widget _buildTextField(TextEditingController? controller, String hint) {
    return TextField(
      controller: controller,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 14,
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        border: InputBorder.none,
        contentPadding: const EdgeInsets.fromLTRB(20, 14, 20, 14),
        hintText: hint,
        helperStyle: const TextStyle(
          color: Colors.black,
          fontSize: 14
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: Colors.black,
            width: 1
          )
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: Colors.black,
            width: 1
          )
        )
      ),
    );
  }

  // 建立標籤
  Widget _buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: RichText(
        text: TextSpan(
          text: text,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 14
          ),

          children: [
            TextSpan(
              text: ' *',
              style: TextStyle(
                color: LeezenColor.accent001.getTypeColor(),
                fontSize: 10
              )
            )
          ]
        )),
    );
  }

  // 建立 DropdownButton
  Widget _buildDropdownButton({
    required String? value,
    required String hint,
    required List<String> items,
    required Function(String?) onChanged,
  }) {
    return DropdownButtonFormField<String>(
      icon: const Icon(Icons.keyboard_arrow_down ,size: 24, color: Colors.black,),
      value: value,
      hint: Text(hint),
      
      items: items.map((String item) {
        return DropdownMenuItem<String>(
          value: item,
          child: Text(item, style: const TextStyle(color: Colors.black, fontSize: 14),),
        );
      }).toList(),
      onChanged: onChanged,
      dropdownColor: Colors.white,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        border: InputBorder.none,
        contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: Colors.black,
            width: 1
          )
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: Colors.black,
            width: 1
          )
        )
      ),
    );
  }


  Buyer setButer() {
    return Buyer(
      name: nameController.text, 
      phone: phoneController.text, 
      zipCode: zipCodeContorller.text, 
      city: selectedCity!, 
      area: selectedDistrict!, 
      address: addressController.text);
  }
}
