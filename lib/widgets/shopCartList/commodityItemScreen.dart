import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:shopping_list/data/categories.dart';
import 'package:shopping_list/models/home/leezenShortcuts.dart';
import 'package:shopping_list/models/shopcart/cart.dart';
import 'package:shopping_list/widgets/shopCartList/counterWidget.dart';

class CommodityItemScreen extends StatefulWidget {
  final Cart cart;

  final void Function(int id, int quantity) changeQuantity;

  const CommodityItemScreen(
      {super.key, required this.cart, required this.changeQuantity});

  @override
  State<CommodityItemScreen> createState() => _CommodityItemScreenState();
}

class _CommodityItemScreenState extends State<CommodityItemScreen> {
  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: UniqueKey(),
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [

            SlidableAction(
              onPressed: (context) {},
              backgroundColor: LeezenColor.accent001alpha20.getTypeColor(),
              flex: 1,
              foregroundColor: LeezenColor.accent001.getTypeColor(),
              label: '刪除',
            ),
          
        ],
      ),
      child: Container(
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
                      widget.cart.image.withLeeznUrl(),
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
                            widget.cart.name,
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                          Text(
                            widget.cart.standard,
                            style: TextStyle(
                              color:
                                  LeezenColor.greyTextSubTitle.getTypeColor(),
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          Row(
                            children: [
                              Text(
                                '\$${widget.cart.price}',
                                style: const TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Text(
                                '\$${widget.cart.salePrice}',
                                style: TextStyle(
                                    fontSize: 15,
                                    color: LeezenColor.greyplaceholder
                                        .getTypeColor(),
                                    decoration: TextDecoration.lineThrough),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 9,
                          ),
                          CounterWidget(
                              cart: widget.cart,
                              changeQuantity: widget.changeQuantity),
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
                      '\$${widget.cart.subtotal}',
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
      ),
    );
  }
}
