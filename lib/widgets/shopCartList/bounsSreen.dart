import 'package:flutter/material.dart';
import 'package:shopping_list/data/categories.dart';
import 'package:shopping_list/models/shopcart/shopCartPersent.dart';

class BounsSreen extends StatelessWidget {
  final List<Present> presents;

  const BounsSreen({super.key, required this.presents});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: LeezenColor.charcoal_15.getTypeColor(),
            blurRadius: 5,
            offset: const Offset(0, 2)
          )
        ]
      ),
      child: Column(
        children: [
          Container(
            color: LeezenColor.primary001.getTypeColor(),
            height: 1.5,
            width: double.infinity,
          ),
          Container(
            color: LeezenColor.bg002.getTypeColor(),
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                const Text(
                  '全站滿額贈',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                const Expanded(child: SizedBox()),
                Image.asset(
                  'assets/icon-next-primay002.png',
                  width: 24,
                  height: 24,
                  fit: BoxFit.cover,
                )
              ],
            ),
          ),
          Container(
              color: Colors.white,
              height: ((46 * presents.length) - 12) + 28,
              padding:
                  const EdgeInsets.only(top: 12, left: 12, right: 12, bottom: 16),
              child: ListView.separated(
                separatorBuilder: (context, index) {
                  if (index < presents.length - 1) {
                    return const SizedBox(height: 12);
                  } else {
                    return const SizedBox(height: 0);
                  }
                },
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      Container(
                        height: 34,
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 1,
                                color: presents[index].valid
                                    ? LeezenColor.primary002.getTypeColor()
                                    : LeezenColor.greyplaceholder.getTypeColor()),
                            borderRadius: BorderRadius.circular(6)),
                        child: Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: presents[index].valid
                                      ? LeezenColor.primary002.getTypeColor()
                                      : LeezenColor.greyplaceholder
                                          .getTypeColor(),
                                  borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(6),
                                      bottomLeft: Radius.circular(6))),
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(8, 6, 6, 6),
                                child: Text(
                                  presents[index].valid ? '已符合' : '未符合',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(6, 6, 6, 8),
                              child: Text(
                                presents[index].name,
                                style: TextStyle(
                                    color: presents[index].valid
                                        ? LeezenColor.primary002.getTypeColor()
                                        : LeezenColor.greyplaceholder
                                            .getTypeColor(),
                                    fontSize: 14),
                              ),
                            )
                          ],
                        ),
                      ),
                      const Expanded(child: SizedBox())
                    ],
                  );
                },
                itemCount: presents.length,
              )),
        ],
      ),
    );
  }
}
