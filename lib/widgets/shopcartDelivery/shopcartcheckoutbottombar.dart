import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping_list/data/categories.dart';
import 'package:shopping_list/models/shopcartdelivery/shopcartdelivery.dart';

class ShopCartCheckOutBottomBarScreen extends StatefulWidget {
  final ShopcartDeliveryModel model;

  final void Function() pressChekOut;

  const ShopCartCheckOutBottomBarScreen({super.key, required this.model, required this.pressChekOut});

  @override
  State<ShopCartCheckOutBottomBarScreen> createState() =>
      _ShopCartCheckOutBottomBarScreenState();
}

class _ShopCartCheckOutBottomBarScreenState
    extends State<ShopCartCheckOutBottomBarScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: LeezenColor.charcoal_15.getTypeColor(),
            blurRadius: 6,
            spreadRadius: 1,
            offset: const Offset(0 , -2)
          )
        ]
      ),
      padding: const EdgeInsets.all(12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Text(
                '訂單總計',
                style: TextStyle(
                  color: LeezenColor.greyTextSubTitle.getTypeColor(),
                  fontSize: 12,
                ),
              ),
              const SizedBox(
                height: 6,
              ),
              Text(
                '\$${widget.model.getTotal()}',
                style: TextStyle(
                    color: LeezenColor.accent001.getTypeColor(),
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),

          const Expanded(child: SizedBox()),

          Center(
            child: InkWell(
              onTap: widget.model.isCheckOutValid() ? widget.pressChekOut : () {},
              child: Container(
                width: 245,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: widget.model.isCheckOutValid() ? LeezenColor.primary001.getTypeColor() : LeezenColor.greyTextBread.getTypeColor(),
                ),
                child: const Center(
                  child: Text(
                    '結帳',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
