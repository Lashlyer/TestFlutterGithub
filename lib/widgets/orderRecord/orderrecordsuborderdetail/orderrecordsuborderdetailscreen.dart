
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping_list/models/orderhistory/orderrecorddetail/suborder.dart';
import 'package:shopping_list/network/appUrls/app_urls.dart';
import 'package:shopping_list/widgets/orderRecord/orderrecordsuborderdetail/orderrecordsuborderdetailinfoscreen.dart';
import 'package:shopping_list/widgets/orderRecord/orderrecordsuborderdetail/orderrecordsuborderproductdetailscreen.dart';
import 'package:shopping_list/widgets/orderRecord/orderrecordsuborderdetail/orderrecordsuborderprogress.dart';

class OrderRecordSuborderDetailScreen extends StatelessWidget {

  final Suborder suborder;

  const OrderRecordSuborderDetailScreen({super.key, required this.suborder});

  @override
  Widget build(BuildContext context) {
    // print(suborder.items.map((it) => it.items.length).toList());
    return Scaffold(
      appBar: AppBar(
        title: Text(
            suborder.name,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 13,
              fontWeight: FontWeight.bold
            ),
          ),
      ),
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                OrderRecordSuborderDetailinfoScreen(suborder: suborder),
                OrderRecordSuborderProductDetailScreen(suborder: suborder)
              ],
            ),
          ),
        ),
      ),
      
    );
  }
}