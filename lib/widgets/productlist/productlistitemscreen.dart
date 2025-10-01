import 'package:flutter/material.dart';
import 'package:shopping_list/data/categories.dart';
import 'package:shopping_list/models/home/leezenShortcuts.dart';
import 'package:shopping_list/models/productHome/productHome.dart';

class ProductListItemScreen extends StatelessWidget {
  final ProductItem item;

  const ProductListItemScreen({super.key, required this.item});

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
      child: Stack(
        children: [
          Positioned(
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      bottomLeft: Radius.circular(10.0)),
                  child: Image.network(
                    item.image.withLeeznUrl(),
                    width: 143,
                    height: 143,
                    fit: BoxFit.cover,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            for (var tag in item.tags) ...[
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
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            if (item.type != null) ...[
                              Container(
                                padding: const EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                    color: LeezenColor.accent001.getTypeColor(),
                                    borderRadius: BorderRadius.circular(4)),
                                child: Text(
                                  item.type!,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              const SizedBox(
                                width: 8,
                              )
                            ],
                            Text(
                              item.brand,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        const SizedBox(height: 1.5),
                        Text(
                          item.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Row(
                          children: [
                            Text(
                              '\$${item.salePrice}',
                              style: TextStyle(
                                  color: LeezenColor.accent001.getTypeColor(),
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                            if (item.salePrice != item.price) ...[
                              const SizedBox(
                                width: 8,
                              ),
                              Text(
                                '\$${item.price}',
                                style: TextStyle(
                                    color: LeezenColor.greyTextSubTitle
                                        .getTypeColor(),
                                    fontSize: 11,
                                    decoration: TextDecoration.lineThrough,
                                    decorationColor: LeezenColor
                                        .greyTextSubTitle
                                        .getTypeColor(),
                                    decorationThickness: 1.0),
                              )
                            ]
                          ],
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          item.promotion,
                          style: TextStyle(
                              color: LeezenColor.accent001.getTypeColor(),
                              fontSize: 12,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Positioned(
              right: 10,
              bottom: 10,
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                      color: LeezenColor.primary001.getTypeColor(),
                      borderRadius: BorderRadius.circular(16)),
                  child: Image.asset(
                    'assets/btnWish.png',
                    width: 24,
                    height: 24,
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
