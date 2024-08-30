import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping_list/data/categories.dart';
import 'package:shopping_list/models/shopcart/order.dart';

class OrderShipmethodItem extends StatefulWidget {
  final Order order;

  const OrderShipmethodItem({super.key, required this.order});

  @override
  State<OrderShipmethodItem> createState() => _OrderShipmethodItemState();
}

class _OrderShipmethodItemState extends State<OrderShipmethodItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 1.5,
          color: LeezenColor.primary001.getTypeColor(),
        ),
        Container(
          color: LeezenColor.bg004.getTypeColor(),
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              Text(
                widget.order.orderTypeName(),
                style: TextStyle(
                    color: LeezenColor.primary001.getTypeColor(),
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              const Expanded(child: SizedBox()),
              InkWell(
                onTap: () {},
                child: Text(
                  '商品明細(${widget.order.commodityTotoalCount()})',
                  style: TextStyle(
                      color: LeezenColor.primary001.getTypeColor(),
                      fontSize: 14,
                      decoration: TextDecoration.underline,
                      decorationColor: LeezenColor.primary001.getTypeColor()),
                ),
              )
            ],
          ),
        ),
        Container(
          width: double.infinity,
          color: Colors.white,
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              const Text(
                '運送方式',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
              const Expanded(child: SizedBox()),
              
               Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '選擇',
                      style: TextStyle(
                          color: LeezenColor.greyplaceholder.getTypeColor(),
                          fontSize: 14),
                    )
                  ],
                ),
              
              const SizedBox(
                width: 14,
              ),
              Image.asset(
                'assets/icon-next-primay002.png',
                fit: BoxFit.cover,
                width: 24,
                height: 24,
              ),
            ],
          ),
        ),
        Container(
          color: LeezenColor.grey003alpha50.getTypeColor(),
          width: double.infinity,
          height: 1,
        ),

        if (!widget.order.isFreeShip())
        Container(
          color: Colors.white,
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              const Text(
                '運費優惠券',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.bold
                ),
              ),
              const Expanded(child: SizedBox()),
              Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '選擇',
                      style: TextStyle(
                          color: LeezenColor.greyplaceholder.getTypeColor(),
                          fontSize: 14),
                    )
                  ],
                ),
              
              const SizedBox(
                width: 14,
              ),
              Image.asset(
                'assets/icon-couponGrey.png',
                fit: BoxFit.cover,
                width: 24,
                height: 24,
              )
            ],
          ),
        ),
        if (!widget.order.isFreeShip())
        Container(
          color: LeezenColor.grey003alpha50.getTypeColor(),
          width: double.infinity,
          height: 1,
        ),

        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: LeezenColor.charcoal_15.getTypeColor(),
                blurRadius: 5,
                spreadRadius: 1,
                offset: const Offset(0, 2)
              )
            ]
          ),
          padding: const EdgeInsets.all(12),
          child: RichText(
            textAlign: TextAlign.right,
            text: TextSpan(
              text: '商品小計 ' ,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.bold
              ),
              children: [
                TextSpan(
                  text: '\$${widget.order.priceTotal}',
                  style: TextStyle(
                    color: LeezenColor.accent001.getTypeColor(),
                    fontSize: 14,
                    fontWeight: FontWeight.bold
                  )
                ),
                const TextSpan(
                  text: ' ，運費 ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.bold
                  )
                ),
                TextSpan(
                  text: '\$${widget.order.set.shippingAmount}',
                  style: TextStyle(
                    color: LeezenColor.accent001.getTypeColor(),
                    fontSize: 14,
                    fontWeight: FontWeight.bold
                  )
                )
              ]
            ),
          )
        )
      ],
    );
  }
}
