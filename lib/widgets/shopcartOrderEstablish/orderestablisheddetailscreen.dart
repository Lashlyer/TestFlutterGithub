import 'package:flutter/material.dart';
import 'package:shopping_list/data/categories.dart';
import 'package:shopping_list/models/home/shopcartorderEstablished/orderestablishedModel.dart';
import 'package:shopping_list/models/home/shopcartorderEstablished/paymentStatus.dart';
import 'package:shopping_list/widgets/shopcartDelivery/paymentmethodScreen.dart';
import 'package:shopping_list/widgets/shopcartOrderEstablish/orderestablishedbankscreen.dart';
import 'package:shopping_list/widgets/shopcartOrderEstablish/orderstablisheddetailItem.dart';

class OrderEstablishedDetailScreen extends StatelessWidget {
  final ShopcartOrderEstablished model;

  const OrderEstablishedDetailScreen({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
            color: LeezenColor.charcoal_15.getTypeColor(),
            blurRadius: 6,
            spreadRadius: 1,
            offset: const Offset(0, 2))
      ]),
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40),
                    border: Border.all(
                        color: LeezenColor.primary001.getTypeColor(),
                        width: 1.5)),
                child: Center(
                  child: Image.asset(
                    'assets/img-succes.png',
                    fit: BoxFit.cover,
                    width: 48,
                    height: 48,
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                '訂單已成立！',
                style: TextStyle(
                    color: LeezenColor.primary001.getTypeColor(),
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
          const SizedBox(
            height: 32,
          ),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '訂單編號',
                    style: TextStyle(
                      color: LeezenColor.primary001.getTypeColor(),
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'No.${model.detail.no}',
                    style: TextStyle(
                        color: LeezenColor.primary001.getTypeColor(),
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              const Expanded(child: SizedBox()),
              Container(
                decoration: BoxDecoration(
                  color: LeezenColor.bg004.getTypeColor(),
                  borderRadius: BorderRadius.circular(30),
                ),
                width: 124,
                height: 40,
                child: Center(
                    child: Text(
                  '查看訂單',
                  style: TextStyle(
                      color: LeezenColor.primary001.getTypeColor(),
                      fontSize: 17),
                )),
              )
            ],
          ),
          const SizedBox(
            height: 28,
          ),
          OrderEstablishedDetailItem(
              title: '總金額',
              value: '\$${model.detail.totalPrice}',
              valueColor: LeezenColor.accent001.getTypeColor()),
          const SizedBox(height: 12),
          OrderEstablishedDetailItem(
              title: '付款方式',
              value: model.detail.paymentType.typeName,
              valueColor: Colors.black),
          const SizedBox(height: 12),
          OrderEstablishedDetailItem(
              title: '付款狀態',
              value: model.detail.paymentStatus.typeName(),
              valueColor: Colors.red),
          const SizedBox(height: 12),

          OrderEstablishedBankScreen(model: model),

          const SizedBox(height: 16),

          Text(
            
            '※提醒你：請你在3天內完成轉帳，以免訂單自動失效。',
            style: TextStyle(
              color: LeezenColor.greyTextSubTitle.getTypeColor(),
              fontSize: 13,
            ),
            textAlign: TextAlign.left,
          )
        ],
      ),
    );
  }
}
