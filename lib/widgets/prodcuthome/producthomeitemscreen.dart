import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shopping_list/data/categories.dart';
import 'package:shopping_list/models/home/leezenShortcuts.dart';

import '../../models/productHome/productHome.dart';

class ProductHomeItemScreen extends StatelessWidget {
  final ProductItem product;

  const ProductHomeItemScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
                color: const Color.fromARGB(1, 47, 51, 43).withOpacity(0.15),
                spreadRadius: 1,
                blurRadius: 5,
                offset: const Offset(0, 2))
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Positioned(
                  child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    topRight: Radius.circular(10.0)),
                child: Image.network(
                  width: double.infinity,
                  height: 170,
                  product.image.withLeeznUrl(),
                  fit: BoxFit.cover,
                ),
              )),

              if (product.stamp != null)
              Positioned(
                right: 8,
                top: 8,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(
                    product.stamp!.withLeeznUrl(),
                    width: 32,
                    height: 32,
                    fit: BoxFit.cover,
                  ),
                )
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              children: [
                Positioned(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (product.tags.isEmpty)
                      const SizedBox(height: 24,),

                      Row(
                        children: [
                          for (var tag in product.tags) ...[
                            Container(
                              padding: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: LeezenColor.primary002.getTypeColor(),
                              ),
                              child: Text(
                                tag,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            const SizedBox(
                              width: 8,
                            )
                          ]
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        product.brand,
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        product.name,
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          Text(
                            '\$${product.salePrice}',
                            style: TextStyle(
                                color: LeezenColor.accent001.getTypeColor(),
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                          if (product.salePrice != product.price) ...[
                            const SizedBox(
                              width: 8,
                            ),
                            Text(
                              '\$${product.price}',
                              style: TextStyle(
                                  color: LeezenColor.greyTextSubTitle
                                      .getTypeColor(),
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.lineThrough,
                                  decorationColor: LeezenColor.greyTextSubTitle
                                      .getTypeColor(),
                                  decorationThickness: 1.0),
                            ),
                          ]
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      SizedBox(
                        height: 24,
                        child: Text(
                          product.promotion,
                          style: TextStyle(
                              color: LeezenColor.accent001.getTypeColor(),
                              fontSize: 13),
                        ),
                      )
                    ],
                  ),
                ),

                Positioned(
                  right: 0,
                  bottom: 0,
                  child: GestureDetector(
                    onTap: () {
                      
                    },
                    child: Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        color: LeezenColor.primary001.getTypeColor(),
                        borderRadius: BorderRadius.circular(16)
                      ),
                      child: Image.asset('assets/btnWish.png', width: 24, height: 24,), 
                    ),
                  )
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
