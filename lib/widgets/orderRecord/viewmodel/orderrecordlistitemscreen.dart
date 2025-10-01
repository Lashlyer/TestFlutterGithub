import 'package:flutter/material.dart';
import 'package:shopping_list/data/categories.dart';
import 'package:shopping_list/models/orderhistory/orderlistitem.dart';
import 'package:shopping_list/network/appUrls/app_urls.dart';

class OrderRecordListItemScreen extends StatefulWidget {
  final OrderListItem item;

  final void Function(int id) pressItem;

  const OrderRecordListItemScreen({super.key, required this.item, required this.pressItem});

  @override
  State<OrderRecordListItemScreen> createState() =>
      _OrderRecordListItemScreenState();
}

class _OrderRecordListItemScreenState extends State<OrderRecordListItemScreen> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.pressItem(widget.item.id);
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
            color: Colors.white, boxShadow: [LeezenCustomUI.bottmShadow]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (widget.item.tipType != 0) ...[
              tipBuild(widget.item),
              const SizedBox(height: 12)
            ],
            orderStatusBuild(widget.item),
            const SizedBox(
              height: 11,
            ),
            Container(
              height: 1,
              color: LeezenColor.grey003.getTypeColor(),
            ),
            const SizedBox(
              height: 11,
            ),
            Text(
              widget.item.summary,
              style: TextStyle(
                  color: LeezenColor.greyTextSubTitle.getTypeColor(),
                  fontSize: 14),
            ),
            const SizedBox(
              height: 2,
            ),
            Row(
              children: [
                Text(
                  widget.item.date,
                  style: TextStyle(
                      color: LeezenColor.greyTextSubTitle.getTypeColor(),
                      fontSize: 14),
                ),
                const Expanded(child: SizedBox()),
                Text(
                  '\$${widget.item.amount}',
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  width: 12,
                ),
                Image.asset(
                  'assets/icon-next-primay002.png',
                  width: 24,
                  height: 24,
                  fit: BoxFit.cover,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget tipBuild(OrderListItem item) {
    Color typeColor = item.tipType == 1
        ? LeezenColor.accent001alpha20.getTypeColor()
        : LeezenColor.bg003.getTypeColor();
    Color typeTextColor = item.tipType == 1
        ? LeezenColor.accent001.getTypeColor()
        : LeezenColor.primary001.getTypeColor();
    return Container(
      width: double.infinity,
      color: typeColor,
      padding: const EdgeInsets.all(8),
      child: Text(
        item.tip,
        style: TextStyle(color: typeTextColor, fontSize: 14),
      ),
    );
  }

  Widget orderStatusBuild(OrderListItem item) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (item.type.isEmpty) ...[
              const SizedBox(height: 12),
              Text(
                '訂單編號 ${item.no}',
                style: const TextStyle(color: Colors.black, fontSize: 14),
              ),
              const SizedBox(height: 12),
            ],
            if (item.type.isNotEmpty) ...[
              Container(
                width: 34,
                height: 21,
                decoration: BoxDecoration(
                    color: LeezenColor.primary002.getTypeColor(),
                    borderRadius: BorderRadius.circular(2)),
                child: Center(
                  child: Text(
                    item.type,
                    style: const TextStyle(color: Colors.white, fontSize: 11),
                  ),
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                '訂單編號 ${item.no}',
                style: const TextStyle(color: Colors.black, fontSize: 14),
              )
            ]
          ],
        ),
        const Expanded(child: SizedBox()),
        if (item.button == 0) ...[
          const SizedBox(
            height: 18,
          ),
          Text(
            item.orderStatusName,
            style: TextStyle(
                color: item.orderStatus == 5 || item.orderStatus == 9
                    ? LeezenColor.greyTextSubTitle.getTypeColor()
                    : LeezenColor.primary002.getTypeColor(),
                fontSize: 12),
          ),
          const SizedBox(
            height: 18,
          ),
        ]
      ],
    );
  }
}
