

import 'package:flutter/cupertino.dart';
import 'package:shopping_list/data/categories.dart';

class LeezenPriceWidget extends StatelessWidget {
  
  const LeezenPriceWidget({super.key, required this.price, required this.fontSize, required this.isNeedStrightLine});

  final int price;
  final double fontSize;
  final bool isNeedStrightLine;

  @override
  Widget build(BuildContext context) {

    return Text(
      '\$$price',
      style: TextStyle(
        decoration: isNeedStrightLine ? TextDecoration.lineThrough : null,
        decorationColor: isNeedStrightLine ? leezenColor[LeezenColor.greyplaceholder]!.color : null,
        color: isNeedStrightLine ? leezenColor[LeezenColor.greyplaceholder]!.color : leezenColor[LeezenColor.accent001]!.color,
        fontSize: fontSize,
        fontWeight: FontWeight.bold
      ),
    );
  }
}