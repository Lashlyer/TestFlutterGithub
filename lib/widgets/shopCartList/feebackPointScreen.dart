

import 'package:flutter/material.dart';
import 'package:shopping_list/data/categories.dart';
import 'package:shopping_list/models/shopcart/shopCartModel.dart';

class FeebackPointScreen extends StatelessWidget {

  final ShopCartModel shopcart;

  const FeebackPointScreen({super.key, required this.shopcart});
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (shopcart.feebackPoint() != 0)
        Row(
          children: [
            Text(
              '訂單回饋點數',
              style: TextStyle(
                color: LeezenColor.primary001.getTypeColor(),
                fontSize: 14
              ),
            ),
            const Expanded(child: SizedBox()),
            Image.asset(
              'assets/icon-leaf.png',
              fit: BoxFit.cover,
              width: 13,
              height: 13,
            ),

            const SizedBox(width: 5,),

            RichText(
              text: TextSpan(
                text: '${shopcart.feebackPoint()} ',
                style: TextStyle(
                  color: LeezenColor.primary001.getTypeColor(),
                  fontSize: 13,
                  fontWeight: FontWeight.bold
                ),
                children: [
                  TextSpan(
                    text: '點',
                    style: TextStyle(
                      color: LeezenColor.primary001.getTypeColor(),
                      fontSize: 14,
                      fontWeight: FontWeight.bold
                    )
                  )
                ]
              ),            
            )
          ],
        ),
        if (shopcart.feebackPoint() != 0 && shopcart.summary.totalAdditionPoints != 0)
        const SizedBox(height: 8,),

        if (shopcart.summary.totalAdditionPoints != 0) 
        Row(
          children: [
            Text(
              '商品加贈點數',
              style: TextStyle(
                color: LeezenColor.primary001.getTypeColor(),
                fontSize: 14
              ),
            ),
            const Expanded(child: SizedBox()),
            Image.asset(
              'assets/icon-leaf.png',
              fit: BoxFit.cover,
              width: 13,
              height: 13,
            ),

            const SizedBox(width: 5,),

            RichText(
              text: TextSpan(
                text: '${shopcart.summary.totalAdditionPoints} ',
                style: TextStyle(
                  color: LeezenColor.primary001.getTypeColor(),
                  fontSize: 13,
                  fontWeight: FontWeight.bold
                ),
                children: [
                  TextSpan(
                    text: '點',
                    style: TextStyle(
                      color: LeezenColor.primary001.getTypeColor(),
                      fontSize: 14,
                      fontWeight: FontWeight.bold
                    )
                  )
                ]
              ),            
            )
          ],
        )
      ],
    );
  }
}