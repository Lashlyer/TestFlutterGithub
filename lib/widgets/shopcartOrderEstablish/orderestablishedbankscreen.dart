

import 'package:flutter/material.dart';
import 'package:shopping_list/data/categories.dart';
import 'package:shopping_list/models/home/shopcartorderEstablished/orderestablishedModel.dart';

class OrderEstablishedBankScreen extends StatelessWidget {

  final ShopcartOrderEstablished model;

  const OrderEstablishedBankScreen({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: LeezenColor.bg002.getTypeColor(),
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '銀行代碼：${model.detail.bankAccount.bankNo}',
            style: const TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.bold
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '轉帳帳號：${model.detail.bankAccount.accountNo}',
            style: const TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.bold
            ),
          ),
          const SizedBox(height: 8),
                    Text(
            '轉帳金額：\$${model.detail.bankAccount.price}',
            style: const TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.bold
            ),
          ),
          const SizedBox(height: 8),
                    Text(
            '付款期限：${model.detail.bankAccount.duteDate}',
            style: const TextStyle(
              color: Colors.red,
              fontSize: 14,
              fontWeight: FontWeight.bold
            ),
          ),
          const SizedBox(height: 8),

        ],
      ),

    );
  }
}