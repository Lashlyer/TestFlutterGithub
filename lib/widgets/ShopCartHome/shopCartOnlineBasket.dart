import 'package:flutter/material.dart';
import 'package:shopping_list/models/shopcart/shopCartHomeGroup.dart';
import 'package:shopping_list/models/shopcart/shopCartHomeList.dart';
import 'package:shopping_list/widgets/ShopCartHome/shopCartItem.dart';

class ShopCartOnlineBasket extends StatefulWidget {
  const ShopCartOnlineBasket({super.key, required this.datas, required this.pressItem});

  final ShopCartHomeList datas;

  final void Function(ShopCartHomeGroup exhibition) pressItem;


  @override
  State<ShopCartOnlineBasket> createState() => _ShopCartOnlineBasketState();
}

class _ShopCartOnlineBasketState extends State<ShopCartOnlineBasket> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.fromLTRB(12, 0, 12, 0),
          child: Text(
            '網購購物籃',
            style: TextStyle(
                color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),

        const SizedBox(height: 12,),

        for (final group in widget.datas.groups)
        InkWell(
          onTap: () {
            widget.pressItem(group);
          },
          child: ShopCartItem(group: group)
        ),
        // ListView.separated(
        //   scrollDirection: Axis.vertical,
        //   itemBuilder:(context, index) {
        //     return ShopCartItem(group: widget.datas.groups[index]);
        //   }, 

        //   separatorBuilder: (context, index) {
        //     return const SizedBox(height: 8,);
        //   },
          
        //   itemCount: widget.datas.groups.length
        // )
      ],
    );
  }
}
