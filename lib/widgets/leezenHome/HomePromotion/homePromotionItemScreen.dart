import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:shopping_list/data/categories.dart';
import 'package:shopping_list/models/home/homePromotion.dart';
import 'package:shopping_list/models/home/leezenShortcuts.dart';

class HomePromotionItemScreen extends StatelessWidget {
  const HomePromotionItemScreen({super.key, required this.item});

  final HomePromotion item;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.only(left: 2, top: 5, bottom: 5),
      child: Container(
        width: 260,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: const Color.fromARGB(1, 47, 51, 43).withOpacity(0.15),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: const Offset(0, 2))
            ]),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              child: Image.network(
                item.image.withLeeznUrl(),
                width: double.infinity,
                height: 108,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              width: double.infinity,
              height: 370,
              padding: const EdgeInsets.all(12),
              child: ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        Image.network(
                          item.items![index].image.withLeeznUrl(),
                          width: 105,
                          height: 105,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: SizedBox(
                            width: double.infinity,
                            height: 105,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  maxLines: 2,
                                  item.items![index].name,
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      height: 0.0),
                                ),
                                const Expanded(child: SizedBox()),
                                if (item.items![index].salePrice >
                                    item.items![index].price)
                                  Text('\$ ${item.items![index].salePrice}',
                                      style: TextStyle(
                                          color: LeezenColor.greyTextSubTitle
                                              .getTypeColor(),
                                          fontSize: 11,
                                          height: 0.0,
                                          decoration:
                                              TextDecoration.lineThrough,
                                          decorationColor: LeezenColor
                                              .greyTextSubTitle
                                              .getTypeColor())),
                                Text(
                                  '\$ ${item.items![index].price.toString()}',
                                  style: TextStyle(
                                      color:
                                          LeezenColor.accent001.getTypeColor(),
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      height: 0.0),
                                ),
                                if (item.items![index].promotion.isNotEmpty)
                                  Text(
                                    item.items![index].promotion,
                                    style: TextStyle(
                                        color: LeezenColor.accent001
                                            .getTypeColor(),
                                        fontSize: 13,
                                        fontWeight: FontWeight.normal,
                                        height: 0.0),
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                  separatorBuilder: (context, index) {
                    if (index != item.items!.length - 1) {
                      return const SizedBox(height: 12);
                    } else {
                      return const SizedBox(height: 0);
                    }
                  },
                  itemCount: item.items!.length),
            ),
            Container(
              padding: EdgeInsets.only(left: 12, right: 12),
              width: double.infinity,
              height: 40,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Expanded(child: SizedBox()),
                  SizedBox(
                    width: 106,
                    child: Column(
                      children: [
                        Center(
                            child: Text(
                          '去逛逛',
                          style: TextStyle(
                              color: LeezenColor.primary001.getTypeColor(),
                              fontSize: 12,
                              height: 0),
                        )),
                        Image.asset(
                            width: 106,
                            height: 16,
                            'assets/btn-misson-arrow.png')
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
