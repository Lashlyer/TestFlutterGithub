import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shopping_list/data/categories.dart';
import 'package:shopping_list/models/home/leezenShortcuts.dart';
import 'package:shopping_list/models/shopcart/cart.dart';
import 'package:shopping_list/widgets/shopCartList/counterWidget.dart';

class CommodityItemScreen extends StatelessWidget {
  final Cart cart;

  final void Function(int id, int quantity) changeQuantity;

  const CommodityItemScreen({super.key, required this.cart , required this.changeQuantity});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(left: 12, right: 12, top: 12),
      child: Column(
        children: [
          Stack(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(
                    cart.image.withLeeznUrl(),
                    fit: BoxFit.cover,
                    width: 80,
                    height: 80,
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  SizedBox(
                    width: 219,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          cart.name,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        Text(
                          cart.standard,
                          style: TextStyle(
                            color: LeezenColor.greyTextSubTitle.getTypeColor(),
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Row(
                          children: [
                            Text(
                              '\$${cart.price}',
                              style: const TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Text(
                              '\$${cart.salePrice}',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: LeezenColor.greyplaceholder
                                      .getTypeColor(),
                                  decoration: TextDecoration.lineThrough),
                            ),
                          ],
                        ),
                        const SizedBox(height: 9,),
                        CounterWidget(cart: cart, changeQuantity: changeQuantity),
                      ],
                    ),
                  ),

                  const Expanded(child: SizedBox()),
                ],
              ),
              Positioned(
                top: 0,
                right: 0,
                child: Image.asset(
                  'assets/icon-deletegrey.png',
                  width: 20,
                  height: 20,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                  right: 0,
                  bottom: 0,
                  child: Text(
                    '\$${cart.subtotal}',
                    style: TextStyle(
                        color: LeezenColor.accent001.getTypeColor(),
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ))
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          Container(
            height: 1,
            padding: const EdgeInsets.only(left: 12, right: 12),
            color: LeezenColor.grey003alpha20.getTypeColor(),
          )
        ],
      ),
    );
  }
}
