
import 'package:flutter/material.dart';
import 'package:shopping_list/data/categories.dart';
import 'package:shopping_list/models/shopcart/shopCartModel.dart';

class ShopCartBottomBarScreen extends StatelessWidget {

  final ShopCartModel shopCart;

  final void Function() pressNext;

  const ShopCartBottomBarScreen({super.key, required this.shopCart, required this.pressNext});

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
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(12),
            child: InkWell(
              onTap: () {
                
              },
              child: Row(
                children: [
                  const Text(
                    '使用者優惠券/碼',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  const Expanded(child: SizedBox()),
                  Text(
                    '選擇',
                    style: TextStyle(
                      color: LeezenColor.greyplaceholder.getTypeColor(),
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(width: 14,),
                  Image.asset(
                    'assets/icon-couponGrey.png',
                    width: 24,
                    height: 24,
                    fit: BoxFit.cover,
                  )
                ],
              ),
            ),
          ),
          Container(
            color: LeezenColor.grey003.getTypeColor(),
            width: double.infinity,
            height: 1,
          ),
          Padding(
            padding: EdgeInsets.all(12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Text(
                      '訂單總計',
                      style: TextStyle(
                        color: LeezenColor.grey003.getTypeColor(),
                        fontSize: 12
                      ),
                    ),
                    const SizedBox(height: 6,),
                    Text(
                      '\$${shopCart.summary.totalAmount}',
                      style: TextStyle(
                        color: shopCart.valid ? LeezenColor.accent001.getTypeColor() : LeezenColor.greyplaceholder.getTypeColor(),
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                      ),
                    )
                  ],
                ),

                const Expanded(child: SizedBox()),

                Center(
                    child: InkWell(
                      onTap: pressNext,
                      child: Container(
                        width: 245,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: LeezenColor.primary001.getTypeColor(),
                        ),
                        child: const Center(
                          child: Text(
                            '下一步',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ),
                    ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}