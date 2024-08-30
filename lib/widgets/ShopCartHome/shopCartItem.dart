

import 'package:flutter/material.dart';
import 'package:shopping_list/data/categories.dart';
import 'package:shopping_list/models/home/leezenShortcuts.dart';
import 'package:shopping_list/models/shopcart/shopCartHomeGroup.dart';

class ShopCartItem extends StatelessWidget {

  const ShopCartItem ({super.key, required this.group});

  final ShopCartHomeGroup group;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(
          color: LeezenColor.lightGreyGrenen.getTypeColor(),
          width: 1.5
        )
      ),

      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  group.name, 
                  style: TextStyle(
                    fontSize: 16, 
                    fontWeight: FontWeight.bold, 
                    color: LeezenColor.primary001.getTypeColor()
                  )
                ),

                const Expanded(child: SizedBox()),

                Text(
                  '共 ${group.count} 項',
                  style: TextStyle(
                    color: LeezenColor.primary002.getTypeColor(),
                    fontSize: 14,
                  ),
                )
                
              ],
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 64,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: group.items.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: 64,
                    margin: const EdgeInsets.only(right: 8),
                    child: Image.network(
                      group.items[index].image.withLeeznUrl(),
                      width: 64,
                      height: 64,
                      fit: BoxFit.cover,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}