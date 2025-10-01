import 'package:flutter/material.dart';
import 'package:shopping_list/data/categories.dart';
import 'package:shopping_list/models/orderhistory/orderrecorddetail/orderrecorddetail.dart';
import 'package:shopping_list/models/orderhistory/orderrecorddetail/suborder.dart';
import 'package:shopping_list/network/appUrls/app_urls.dart';

class OrderRecordDetailListScreen extends StatelessWidget {
  final OrderRecordDetail model;

  final void Function(Suborder suborder) pressItem;

  const OrderRecordDetailListScreen({super.key, required this.model, required this.pressItem});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white, boxShadow: [LeezenCustomUI.bottmShadow]),
        child: Column(
          children: [
            for (var (index, suborder)  in model.suborders.indexed) ... [
              InkWell(
                onTap:() {
                  pressItem(suborder);
                },
                
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    children: [
                      Text(
                        '${suborder.name} (${suborder.totalCount})',
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 13,
                            fontWeight: FontWeight.bold),
                      ),
                      const Expanded(child: SizedBox()),
                      Text(
                        suborder.shippingMethodName,
                        style: const TextStyle(color: Colors.black, fontSize: 13),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                        suborder.orderStatusName,
                        style: TextStyle(
                            color: LeezenColor.primary002.getTypeColor(),
                            fontSize: 13),
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
                ),
              ),
              if (index < model.suborders.length - 1) 
              Container(color: LeezenColor.grey003alpha50.getTypeColor(), height: 1)
            ]
          ],
        )
      
    );
  }
}
