import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shopping_list/data/categories.dart';
import 'package:shopping_list/models/shopcart/shopCartModel.dart';
import 'package:shopping_list/widgets/shopCartList/feebackPointScreen.dart';
import 'package:shopping_list/widgets/shopCartList/summaryItem.dart';

class OrderSummaryScreen extends StatelessWidget {
  final ShopCartModel shopcart;

  const OrderSummaryScreen({super.key, required this.shopcart});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: LeezenColor.charcoal_15.getTypeColor(),
            blurRadius: 5,
            spreadRadius: 1,
            offset: const Offset(0, 2)
          )
        ]
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: LeezenColor.primary001.getTypeColor(),
            height: 1.5,
          ),
          Container(
            width: double.infinity,
            height: 48,
            color: LeezenColor.bg004.getTypeColor(),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Text(
                '訂單摘要',
                style: TextStyle(
                    color: LeezenColor.primary001.getTypeColor(),
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Container(
            color: Colors.white,
            padding: const EdgeInsets.all(12.0),
            child: SummaryItem(summary: shopcart.summary),
          ),
          if (shopcart.summary.totalAdditionPoints != 0 ||
              shopcart.feebackPoint() != 0)
            Container(
      
              decoration: BoxDecoration(
                color: LeezenColor.bg002.getTypeColor(),
                ),
              padding: const EdgeInsets.all(12),
              child: FeebackPointScreen(shopcart: shopcart),
            )
        ],
      ),
    );
  }
}
