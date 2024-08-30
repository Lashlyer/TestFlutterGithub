import 'package:flutter/material.dart';
import 'package:shopping_list/data/categories.dart';
import 'package:shopping_list/models/shopcart/order.dart';

class OrderTitleSection extends StatelessWidget {
  final Order order;

  const OrderTitleSection({super.key, required this.order});

  Widget freeShipInfo() {
    if (order.priceTotal < order.set.freeShippingThreshold) {
      return RichText(
        text: TextSpan(
            text: '滿 ',
            style: TextStyle(
                color: LeezenColor.greyTextSubTitle.getTypeColor(),
                fontSize: 13),
            children: [
              TextSpan(
                  text: '\$${order.set.freeShippingThreshold} 台灣本島免運費！還差 ',
                  style: TextStyle(
                      color: LeezenColor.greyTextSubTitle.getTypeColor(),
                      fontSize: 13)),
              TextSpan(
                  text: '\$${order.set.freeShippingThreshold - order.priceTotal} ',
                  style: TextStyle(
                      color: LeezenColor.primary001.getTypeColor(),
                      fontSize: 13)),
              TextSpan(
                text: '再去採買',
                style: TextStyle(
                    color: LeezenColor.greyTextSubTitle.getTypeColor(),
                    fontSize: 13.0,
                    decoration: TextDecoration.underline),
              ),
            ]),
      );
    } else {
      return Text('已達免運門檻！',
          style: TextStyle(
              color: LeezenColor.greyTextSubTitle.getTypeColor(),
              fontSize: 13));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: LeezenColor.bg004.getTypeColor(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: LeezenColor.primary001.getTypeColor(),
            width: double.infinity,
            height: 1.5,
          ),
          const SizedBox(
            height: 12,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12, right: 12),
            child: Row(
              children: [
                Text(
                  order.orderTypeName(),
                  style: TextStyle(
                      color: LeezenColor.primary001.getTypeColor(), fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const Expanded(child: SizedBox()),
                InkWell(
                  onTap: () {},
                  child: Image.asset(
                    'assets/icon-deletegreen.png',
                    width: 24,
                    height: 24,
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 12, right: 12),
            child: freeShipInfo(),
          ),
          const SizedBox(
            height: 12,
          )
        ],
      ),
    );
  }
}
