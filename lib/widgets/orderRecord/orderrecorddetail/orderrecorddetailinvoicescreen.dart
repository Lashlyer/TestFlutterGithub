import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shopping_list/data/categories.dart';
import 'package:shopping_list/models/orderhistory/orderrecorddetail/invoiceitem.dart';
import 'package:shopping_list/models/orderhistory/orderrecorddetail/orderrecorddetail.dart';
import 'package:shopping_list/network/appUrls/app_urls.dart';

class OrderRecordDetailInvoiceScreen extends StatefulWidget {
  final OrderRecordDetail model;

  const OrderRecordDetailInvoiceScreen({super.key, required this.model});

  @override
  State<OrderRecordDetailInvoiceScreen> createState() =>
      _OrderRecordDetailInvoiceScreenState();
}

class _OrderRecordDetailInvoiceScreenState
    extends State<OrderRecordDetailInvoiceScreen> {

  int? _selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: Colors.white, boxShadow: [LeezenCustomUI.bottmShadow]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          invoiceItemBuild('發票狀態', widget.model.invoice.statusName, context),
          const SizedBox(
            height: 8,
          ),
          invoiceItemBuild(
              '開立方式',
              widget.model.invoice.getInvoiceMethod(),
              context),
          const SizedBox(
            height: 8,
          ),
          if (widget.model.invoice.items.isNotEmpty) ...[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '發票內容(${widget.model.invoice.items.length})',
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                  ),
                ),
                const SizedBox(
                  height: 11,
                ),
                for (var (index, item)
                    in widget.model.invoice.items.indexed) ...[
                  invoiceItemExpansionTilebuild(index, item)
                ],

                Container(color: LeezenColor.grey003alpha50.getTypeColor(), height: 1,)
              ],
            ),
          ]
        ],
      ),
    );
  }

  Widget invoiceItemBuild(String title, String value, BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 13,
            color: Colors.black,
          ),
        ),
        const Expanded(child: SizedBox()),
        SizedBox(
          width: LeezenCustomUI().deviceWidth(context) - 124,
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

  Widget invoiceItemExpansionTilebuild(int index, InvoiceItem item) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          color: LeezenColor.grey003alpha50.getTypeColor(),
          height: 1,
        ),
        Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${index + 1}.',
                  style: const TextStyle(color: Colors.black, fontSize: 13),
                ),
                const SizedBox(
                  width: 4,
                ),
                Text(item.no,
                    style: const TextStyle(color: Colors.black, fontSize: 13)),
                const Expanded(child: SizedBox()),
                Text('隨機碼${item.random}',
                    style: const TextStyle(color: Colors.black, fontSize: 13)),
                const SizedBox(width: 14,),

                if (_selectedIndex == null)
                InkWell(
                  onTap: () {
                    setState(() {
                      _selectedIndex = index;
                    });
                  },
                  child: const Icon(Icons.keyboard_arrow_down, size: 24, color: Colors.grey,)),

                if (_selectedIndex != null)
                InkWell(
                  onTap: () {
                    if (_selectedIndex == index) {
                      setState(() {
                        _selectedIndex = null;
                      });
                    } else {
                      setState(() {
                        _selectedIndex = index;
                      });
                    }
                  },
                  child: Icon(
                    _selectedIndex == index ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                    size: 24, 
                    color: Colors.grey,
                    )
                  ), 
              ],
            )
          ),

          if (_selectedIndex == index) 
          Container(
            width: double.infinity,
            color: LeezenColor.bg002.getTypeColor(),
            padding: const EdgeInsets.fromLTRB(28, 10, 28, 10),
            child: Text(
              '${item.orderName}(編號：${item.orderNo})\n品項：${item.summary}\n${item.extrals}',
              style: TextStyle(
                color: LeezenColor.greyTextSubTitle.getTypeColor(),
                fontSize: 11,
              ),
            ),
          )
      ],
    );
  }
}
