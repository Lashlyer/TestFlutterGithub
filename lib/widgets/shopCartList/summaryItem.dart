
import 'package:flutter/material.dart';
import 'package:shopping_list/models/shopcart/summary.dart';

class SummaryItem extends StatelessWidget {

  final ShopCartSummary summary;

  const SummaryItem({super.key, required this.summary});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Text(
              '商品數量',
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
              ),
            ),

            const Expanded(child: SizedBox()),

            RichText(
              text: TextSpan(
                text: '共 ',
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 14
                ),
                children: [
                  TextSpan(
                    text: '${summary.totalCount} ',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.bold
                    )
                  ),

                  const TextSpan(
                    text: '件',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14
                    )
                  )
                ]
              ),
            )
          ],
        ),
        const SizedBox(height: 8,),
        Row(
          children: [
            const Text(
              '總計',
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
              ),
            ),

            const Expanded(child: SizedBox()),

            Text(
              '\$${summary.totalOrigin}',
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