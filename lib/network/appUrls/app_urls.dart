import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping_list/data/categories.dart';

class AppUrls {
  static const header = {
    'Content-Type': 'application/json',
    'Authorization':
        'Bearer 10145|mjsCpKYPYAHMyj6TEMHJyizQzVrB3mExJqBa2ljL6d0c3df1'
  };
  static const baseUrl = 'https://leezen.app.13930.com/';
  static const uatUrl = 'https://uat-test-app.leezen.com.tw';
  static const shopCartHomelistUrl = '${uatUrl}/api/v1/member/cart';
  static const normalShopCartlistUrl = '${baseUrl}api/v1/member/cart/normal/0';
  static const shopcartprojectUrl = 'https://uat-test-app.leezen.com.tw/api/v1/member/cart/preorder/activities';
  static const shopCartSetUrl =
      '${baseUrl}api/v1/member/cart/normal/settings/0';
  static const shopCartChangeQuantityUrl =
      '${baseUrl}api/v1/member/cart/quantity';
  static const orderRecordListUrl = '${baseUrl}api/v1/member/productorder/list';
  static const orderRecordDetailUrl = '${baseUrl}api/v1/member/productorder/detail/';
  static const salePromoPreiodUrl = '${baseUrl}api/v1/promotion/detail/';
  static const saleTopicUrl = '${baseUrl}api/v1/topic/detail/';
  static const storelistUrl = '${baseUrl}api/v1/store/list';
  static const storeRegionUrl = '${baseUrl}api/v1/store';
  static const storeDetailUrl = '${baseUrl}api/v1/store/detail/';
  static const prodcutHomeUrl = '${baseUrl}api/v1/product/ios';
  static const productCategoryUrl = '${baseUrl}api/v1/product';
  static const productListUrl = '${baseUrl}api/v1/product/list';
  // static const productHomePromotion = 'https://ec-app.leezen.com.tw/api/v1/promotion/detail';
}

class LeezenCustomUI {
  static Widget backgroundImage = Image.asset(
    'assets/splash_bg.png',
    fit: BoxFit.cover,
  );

  static BoxShadow bottmShadow = BoxShadow(
      color: LeezenColor.charcoal_15.getTypeColor(),
      blurRadius: 6,
      spreadRadius: 1,
      offset: const Offset(0, 2));
  static BoxShadow topShadow = BoxShadow(
      color: LeezenColor.charcoal_15.getTypeColor(),
      blurRadius: 6,
      spreadRadius: 1,
      offset: const Offset(0, -2));

  double deviceWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }
  
  Widget buildDropdownButton({
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
}
