import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping_list/data/categories.dart';
import 'package:shopping_list/models/shopcartdelivery/buyer.dart';

class BuyerItem extends StatefulWidget {
  final Buyer? buyer;

  const BuyerItem({super.key, this.buyer});

  @override
  State<BuyerItem> createState() => _BuyerItemState();
}

class _BuyerItemState extends State<BuyerItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
            color: LeezenColor.charcoal_15.getTypeColor(),
            blurRadius: 6,
            spreadRadius: 1,
            offset: const Offset(0, 2))
      ]),
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          Text(
            '訂購人資料',
            style: TextStyle(
                color: LeezenColor.primary001.getTypeColor(),
                fontSize: 16,
                fontWeight: FontWeight.bold),
          ),
          if (widget.buyer == null) const Expanded(child: SizedBox()),
          if (widget.buyer == null)
            Text(
              '填寫聯絡資訊',
              style: TextStyle(
                color: LeezenColor.greyplaceholder.getTypeColor(),
                fontSize: 14,
              ),
            ),
          const SizedBox(
            width: 14,
          ),
          Image.asset(
            'assets/icon-next-primay002.png',
            width: 24,
            height: 24,
            fit: BoxFit.cover,
          )
        ],
      ),
    );
  }
}
