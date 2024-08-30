import 'package:flutter/material.dart';
import 'package:shopping_list/models/shopcart/order.dart';
import 'package:shopping_list/widgets/shopCartList/commodityItemScreen.dart';
import 'package:shopping_list/widgets/shopCartList/orderSubtotalScreen.dart';
import 'package:shopping_list/widgets/shopCartList/orderTitleSection.dart';

class CommodityScreen extends StatefulWidget {

  final Order order;

  final void Function(int id, int quantity) changeQuantity;

  const CommodityScreen({super.key, required this.order, required this.changeQuantity});

  @override
  State<CommodityScreen> createState() => _CommodityScreenState();
}

class _CommodityScreenState extends State<CommodityScreen> {
  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        OrderTitleSection(order: widget.order),

        for (var cart in widget.order.carts)
        CommodityItemScreen(cart: cart, changeQuantity: widget.changeQuantity),

        OrderSubtotalScreen(order: widget.order),
        
        const SizedBox(height: 12,)
      ],
    );
  }
}
