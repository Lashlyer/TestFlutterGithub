import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shopping_list/data/categories.dart';
import 'package:shopping_list/models/deatilNutrition/detailNurtritions.dart';
import 'package:shopping_list/models/deatilNutrition/nutrition.dart';

class DetailNutrtionItem extends StatelessWidget {
  const DetailNutrtionItem(
      {super.key, required this.nutrition, required this.total});

  final DetailNutrtion nutrition;
  final int total;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                '營養標示',
                style: TextStyle(
                    color: LeezenColor.primary002.getTypeColor(),
                    fontSize: 14,
                    fontWeight: FontWeight.normal),
              ),
              const Expanded(child: SizedBox()),
              Text('看全部($total)',
                  style: TextStyle(
                      color: LeezenColor.grey003.getTypeColor(),
                      fontSize: 13,
                      fontWeight: FontWeight.normal))
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            nutrition.productTitle,
            style: const TextStyle(
                color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 7.4,
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: LeezenColor.bg003.getTypeColor(),
                width: 1,
              ),
            ),
            child: Column(
              children: [
                Container(
                  height: 36,
                  alignment: Alignment.center,
                  color: LeezenColor.bg002.getTypeColor(),
                  child: const Text(
                    '營養標示',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
                  child: Text(
                    nutrition.nutrition,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.normal),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(12, 8, 15, 8),
                  color: LeezenColor.bg002.getTypeColor(),
                  child: const Row(
                    children: [
                      Expanded(child: SizedBox()),
                      Text(
                        textAlign: TextAlign.right,
                        '每份',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 28,
                      ),
                      Text(
                        textAlign: TextAlign.right,
                        '每100毫升',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(14, 8, 14, 8),
                  child: Row(
                    children: [
                      Text(
                        nutrition.info,
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.normal),
                      ),
                      const Expanded(child: SizedBox()),
                      Text(
                        textAlign: TextAlign.right,
                        nutrition.perservingDescription,
                        style: const TextStyle(                         
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.normal),
                      ),
                      const SizedBox(
                        width: 28,
                      ),
                      SizedBox(
                        width: 66,
                        child: Text(
                          textAlign: TextAlign.right,
                          nutrition.per100mlDescription,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.normal),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 1,
            color: LeezenColor.grey003alpha20.getTypeColor(),
          ),
        ],
      ),
    );
  }
}
