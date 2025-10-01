import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping_list/data/categories.dart';
import 'package:shopping_list/models/orderhistory/orderrecorddetail/orderrecorddetail.dart';
import 'package:shopping_list/network/appUrls/app_urls.dart';

class OrderRecordDetailinfoScreen extends StatelessWidget {
  final OrderRecordDetail model;

  const OrderRecordDetailinfoScreen({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: Colors.white, boxShadow: [LeezenCustomUI.bottmShadow]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '訂單編號 ${model.detail.no}',
            style: TextStyle(
                color: LeezenColor.primary001.getTypeColor(),
                fontSize: 15,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 11),
          Container(
            height: 1,
            color: LeezenColor.grey003alpha50.getTypeColor(),
          ),
          const SizedBox(height: 11),
          Text(
            '成立日期：${model.detail.date}',
            style: const TextStyle(
              color: Colors.black,
              fontSize: 13,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            '總金額：\$${model.detail.paidAmount}',
            style: const TextStyle(
              color: Colors.black,
              fontSize: 13,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            '付款方式：${model.payment.methodName}',
            style: const TextStyle(
              color: Colors.black,
              fontSize: 13,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
        ],
      ),
    );
  }
}
