import 'package:flutter/material.dart';
import 'package:shopping_list/models/orderhistory/orderrecorddetail/orderrecorddetail.dart';
import 'package:shopping_list/network/appUrls/app_urls.dart';

class OrderRecordDetailBuyerScreen extends StatelessWidget {
  final OrderRecordDetail model;

  const OrderRecordDetailBuyerScreen({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white, boxShadow: [LeezenCustomUI.bottmShadow]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buyerItemBuild('訂購人姓名', model.buyer.name, context),
          const SizedBox(
            height: 8,
          ),
          buyerItemBuild('訂購人手機', model.buyer.mobile, context),
          const SizedBox(
            height: 8,
          ),
          buyerItemBuild('訂購人地址',
              '${model.buyer.city}${model.buyer.address}${model.buyer.address}', context),

          if (model.comments.isNotEmpty) ... [
            const SizedBox(height: 8,),
            buyerItemBuild('訂購人備註', model.comments, context)
          ]
        ],
      ),
    );
  }

  Widget buyerItemBuild(String title, String value, BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(color: Colors.black, fontSize: 13),
        ),
        const Expanded(child: SizedBox()),
        SizedBox(
          width: LeezenCustomUI().deviceWidth(context) - 125,
          child: Text(
            textAlign: TextAlign.end,
            softWrap: true,
            maxLines: 10,
            value,
            style: const TextStyle(
                color: Colors.black, fontSize: 13, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
