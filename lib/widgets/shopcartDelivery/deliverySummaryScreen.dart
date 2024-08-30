
import 'package:flutter/material.dart';
import 'package:shopping_list/data/categories.dart';
import 'package:shopping_list/models/shopcartdelivery/shopcartdelivery.dart';
import 'package:shopping_list/widgets/shopCartList/feebackPointScreen.dart';
import 'package:shopping_list/widgets/shopCartList/summaryItem.dart';
import 'package:shopping_list/widgets/shopcartDelivery/deliverySummaryItem.dart';

class DeliverySummaryScreen extends StatefulWidget {

  final ShopcartDeliveryModel model;

  const DeliverySummaryScreen({super.key, required this.model});

  @override
  State<DeliverySummaryScreen> createState() => _DeliverySummaryScreenState();
}

class _DeliverySummaryScreenState extends State<DeliverySummaryScreen> {
  @override
  Widget build(BuildContext context) {

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
            child: SummaryItem(summary: widget.model.shopcart.summary),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 12, right: 12),
            child: Container(
              color: LeezenColor.grey003alpha50.getTypeColor(),
              height: 1,
            ),
          ),

          Container(
            color: Colors.white,
            padding: const EdgeInsets.all(12),
            child: DeliverySummaryItem(model: widget.model),
          ),

          if (widget.model.shopcart.summary.totalAdditionPoints != 0 ||
              widget.model.shopcart.feebackPoint() != 0)
            Container(
      
              decoration: BoxDecoration(
                color: LeezenColor.bg002.getTypeColor(),
                ),
              padding: const EdgeInsets.all(12),
              child: FeebackPointScreen(shopcart: widget.model.shopcart),
            )
        ],
      ),
    );
  }
}