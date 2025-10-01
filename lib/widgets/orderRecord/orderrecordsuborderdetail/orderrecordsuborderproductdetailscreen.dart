import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shopping_list/data/categories.dart';
import 'package:shopping_list/models/home/leezenShortcuts.dart';
import 'package:shopping_list/models/orderhistory/orderrecorddetail/orderrecorddetail.dart';
import 'package:shopping_list/models/orderhistory/orderrecorddetail/orderrecorddetailitem.dart';
import 'package:shopping_list/models/orderhistory/orderrecorddetail/suborder.dart';
import 'package:shopping_list/widgets/orderRecord/orderrecordsuborderdetail/orderrecordsuborderdetailItem.dart';
import 'package:shopping_list/widgets/orderRecord/orderrecordsuborderdetail/orderrecordsuborderdetailmultiItem.dart';

class OrderRecordSuborderProductDetailScreen extends StatelessWidget {
  final Suborder suborder;

  const OrderRecordSuborderProductDetailScreen(
      {super.key, required this.suborder});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(
          height: 1.5,
          color: LeezenColor.primary001.getTypeColor(),
        ),
        Container(
          padding: const EdgeInsets.all(12),
          color: LeezenColor.bg004.getTypeColor(),
          child: Row(
            children: [
              Text(
                '商品明細',
                style: TextStyle(
                    color: LeezenColor.primary001.getTypeColor(),
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              const Expanded(child: SizedBox()),
              Text(
                '共 ${suborder.totalCount} 件',
                style: TextStyle(
                    color: LeezenColor.primary002.getTypeColor(), fontSize: 14),
              )
            ],
          ),
        ),
        for (var item in suborder.items) ...[
          if (item.itemType() == OrderRecordDetailItemType.normal)
            OrderrecordSuborderDetailItem(item: item),
          if (item.itemType() == OrderRecordDetailItemType.multy)
            OrderrecordSuborderDetailMultiItem(item: item)
        ],
        summaryBuild(suborder)
      ],
    );
  }

  Widget summaryBuild(Suborder suborder) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 8,
        ),
        summaryItemBuild(
            '商品小計',
            '\$${suborder.totalAmount}',
            TextStyle(
                color: LeezenColor.accent001.getTypeColor(),
                fontSize: 16,
                fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        summaryItemBuild(
            '運費',
            '\$${suborder.totalFreight}',
            const TextStyle(
              color: Colors.black,
              fontSize: 14,
            )),
        const SizedBox(
          height: 8,
        ),
        if (suborder.codFee != 0)
          summaryItemBuild(
              '物流手續費',
              '\$${suborder.codFee}',
              const TextStyle(
                color: Colors.black,
                fontSize: 14,
              ))
      ],
    );
  }

  Widget summaryItemBuild(String title, String value, TextStyle valueStyle) {
    return Padding(
      padding: const EdgeInsets.only(left: 12, right: 12),
      child: Row(
        children: [
          Text(
            title,
            style: const TextStyle(color: Colors.black, fontSize: 14),
          ),
          const Expanded(child: SizedBox()),
          Text(value, style: valueStyle),
        ],
      ),
    );
  }
}
