import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping_list/data/categories.dart';
import 'package:shopping_list/models/home/leezenShortcuts.dart';
import 'package:shopping_list/models/orderhistory/orderrecorddetail/orderrecorddetailItemsitem.dart';
import 'package:shopping_list/models/orderhistory/orderrecorddetail/orderrecorddetailitem.dart';

class OrderrecordSuborderDetailMultiItem extends StatelessWidget {
  final OrderRecordDetailItem item;

  const OrderrecordSuborderDetailMultiItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (var item in item.items) 
        itemBuild(item),

        Container(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
          color: LeezenColor.bg002.getTypeColor(),
          child: Row(
            children: [
              Text(
                item.promotionName!,
                style: const TextStyle(
                    color: Colors.black,
                    decoration: TextDecoration.underline,
                    fontSize: 13),
              ),
              const SizedBox(
                width: 12,
              ),
              Text(
                'x${item.quantity}組',
                style: TextStyle(
                    color: LeezenColor.greyTextSubTitle.getTypeColor(),
                    fontWeight: FontWeight.bold,
                    fontSize: 13),
              ),
              const Expanded(child: SizedBox()),
              if (item.subtotalOrigin != item.subtotal) ...[
                Text(
                  '\$${item.subtotalOrigin}',
                  style: TextStyle(
                      color: LeezenColor.greyTextSubTitle.getTypeColor(),
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.lineThrough,
                      decorationColor:
                          LeezenColor.greyTextSubTitle.getTypeColor()),
                ),
                const SizedBox(
                  width: 8,
                )
              ],
              Text(
                '\$${item.subtotal}',
                style: TextStyle(
                    color: LeezenColor.accent001.getTypeColor(),
                    fontSize: 13,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),

        Divider(
          color: LeezenColor.grey003alpha50.getTypeColor(),
          height: 1,
        )
      ],
    );
  }

  Widget itemBuild(OrderRecordDetailItemsItem item) {
    return Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Image.network(
              item.image.withLeeznUrl(),
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.name,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    item.standard,
                    style: TextStyle(
                        color: LeezenColor.greyTextSubTitle.getTypeColor(),
                        fontSize: 14),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Row(
                    children: [
                      Text(
                        '\$${item.salePrice}',
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Text(
                        'x${item.quantity}',
                        style: TextStyle(
                            color: LeezenColor.greyTextSubTitle.getTypeColor(),
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                      const Expanded(child: SizedBox()),
                      if (item.subtotalOrigin != item.subtotal) ...[
                        Text(
                          '\$${item.subtotalOrigin}',
                          style: TextStyle(
                              color:
                                  LeezenColor.greyTextSubTitle.getTypeColor(),
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.lineThrough,
                              decorationColor:
                                  LeezenColor.greyTextSubTitle.getTypeColor()),
                        ),
                        const SizedBox(width: 8)
                      ],
                      Text(
                        '\$${item.subtotal}',
                        style: TextStyle(
                            color: LeezenColor.accent001.getTypeColor(),
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
