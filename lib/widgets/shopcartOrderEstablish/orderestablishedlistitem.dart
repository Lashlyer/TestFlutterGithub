

import 'package:flutter/material.dart';
import 'package:shopping_list/data/categories.dart';
import 'package:shopping_list/models/home/shopcartorderEstablished/orderItem.dart';
import 'package:shopping_list/models/home/shopcartorderEstablished/shiptype.dart';

class OrderEstablishedListItem extends StatelessWidget {

  final OrderItem item;

  final bool isUnderlineHidden;

  const OrderEstablishedListItem({super.key, required this.item, required this.isUnderlineHidden});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 12),

          Row(
            children: [
              const SizedBox(width: 12),

              Text(
                item.orderTitle,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.bold
                ),
              ),
              const SizedBox(width: 20),
          
              Text(
                '${item.shipType.typeName()}\n商品數量${item.quantity}，總計 \$${item.total}',
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 14
                ),
              )
            ],
          ),
          const SizedBox(height: 11),

          if (isUnderlineHidden)
          Container(
            color: LeezenColor.grey003alpha50.getTypeColor(),
            width: double.infinity,
            height: 1,
          )
        ],
      ),
    );
  }
}