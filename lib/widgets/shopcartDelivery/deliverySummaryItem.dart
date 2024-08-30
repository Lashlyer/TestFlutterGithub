

import 'package:flutter/material.dart';
import 'package:shopping_list/data/categories.dart';
import 'package:shopping_list/models/shopcartdelivery/shopcartdelivery.dart';

class DeliverySummaryItem extends StatefulWidget {

  final ShopcartDeliveryModel model;

  const DeliverySummaryItem({super.key, required this.model});

  @override
  State<DeliverySummaryItem> createState() => _DeliverySummaryItemState();
}

class _DeliverySummaryItemState extends State<DeliverySummaryItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Text(
              '運費總計',
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
              ),
            ),
            const SizedBox(width: 8,),
            Text(
              '(說明)',
              style: TextStyle(
                color: LeezenColor.greyTextBread.getTypeColor(),
                fontSize: 14,
                decoration: TextDecoration.underline,
                decorationColor: LeezenColor.primary001.getTypeColor()
              ),
            ),

            const Expanded(child: SizedBox()),

            Text(
              '\$${widget.model.getShipAmountTotal()}',
              style: const TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.bold
              ),
            )
          ],
        )
      ],
    );
  }
}