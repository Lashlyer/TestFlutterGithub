import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shopping_list/data/categories.dart';
import 'package:shopping_list/models/shopcartdelivery/shopcartdelivery.dart';

class InvoiceItem extends StatefulWidget {
  final ShopcartDeliveryModel model;

  const InvoiceItem({super.key, required this.model});
  @override
  State<InvoiceItem> createState() => _InvoiceItemState();
}

class _InvoiceItemState extends State<InvoiceItem> {

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
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '發票資訊',
                style: TextStyle(
                    color: LeezenColor.primary001.getTypeColor(),
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 12,
              ),
              const Text(
                '個人電子發票：里仁會員載具',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Container(
                width: double.infinity,
                // height: 86,
                color: LeezenColor.bg002.getTypeColor(),
                padding: const EdgeInsets.all(12),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      width: 24,
                      height: 24,
                      child: Checkbox(
                        value: widget.model.invoiceCheck, 
                        checkColor: Colors.white,
                        activeColor: LeezenColor.primary001.getTypeColor(),
                        onChanged:(value) {
                          setState(() {
                            widget.model.invoiceCheck = value!;
                          });
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    const Expanded(
                      child: Text(
                        '若本人後續辦理退貨作業，同意由里仁網購代為處理電子發票及銷貨退回證明單，以加速退貨退款作業。',
                        style: TextStyle(color: Colors.black, fontSize: 12),
                        softWrap: true,
                        overflow: TextOverflow.visible,
                        maxLines: 10,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          Positioned(
            top: 14,
            right: 0,
            child: Image.asset(
              'assets/icon-next-primay002.png',
              width: 24,
              height: 24,
            ),
          )
        ],
      ),
    );
  }
}
