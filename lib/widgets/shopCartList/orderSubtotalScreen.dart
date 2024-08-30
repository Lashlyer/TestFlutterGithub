
import 'package:flutter/material.dart';
import 'package:shopping_list/data/categories.dart';
import 'package:shopping_list/models/shopcart/order.dart';

class OrderSubtotalScreen extends StatelessWidget {

  final Order order;

  const OrderSubtotalScreen({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: LeezenColor.charcoal_15.getTypeColor(),
            blurRadius: 5,
            offset: const Offset(0, 2)
          )
        ]
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          Row(
            children: [
              const Text(
                '可運送方式：',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold
                ),
              ),

              const Expanded(child: SizedBox()),

              RichText(
                text: TextSpan(
                  text: '商品小計 ',
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight:FontWeight.bold
                  ),
                  children: [
                    TextSpan(
                      text: '\$${order.priceTotal}',
                      style: TextStyle(
                        color: LeezenColor.accent001.getTypeColor(),
                        fontSize: 16,
                        fontWeight: FontWeight.bold
                      )
                    )
                  ]
                )
              )
            ],
          ),

          Row(
            children: [
              Text(
                order.set.shipMethodName(),
                style: TextStyle(
                  color: LeezenColor.primary001.getTypeColor(),
                  fontSize: 16,
                  fontWeight: FontWeight.bold
                ),
              ),

              const Expanded(child: SizedBox()),

              RichText(
                text: TextSpan(
                  text: '運費 ',
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                  ),
                  children: [
                    TextSpan(
                      text: '\$${order.set.shippingAmount}',
                      style: TextStyle(
                        color: LeezenColor.accent001.getTypeColor(),
                        fontSize: 16,
                        fontWeight: FontWeight.bold
                      )
                    )
                  ]
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}