

import 'package:flutter/material.dart';
import 'package:shopping_list/models/home/shopcartorderEstablished/orderestablishedModel.dart';

class OrderEstablishedDetailItem extends StatelessWidget {


  final String title;
  final String value;
  final Color valueColor;

  const OrderEstablishedDetailItem({super.key, required this.title, required this.value, required this.valueColor});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 16,
          ),
        ),
        const Expanded(child: SizedBox()),
        Text(
          value,
          style: TextStyle(
            color: valueColor,
            fontSize: 16,
            fontWeight: FontWeight.bold
          ),
        )
      ],
    );
  }
}