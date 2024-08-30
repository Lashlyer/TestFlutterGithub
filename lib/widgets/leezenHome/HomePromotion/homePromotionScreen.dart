import 'package:flutter/material.dart';
import 'package:shopping_list/data/categories.dart';
import 'package:shopping_list/models/home/homePromotion.dart';
import 'package:shopping_list/widgets/leezenHome/HomePromotion/homePromotionItemScreen.dart';

class HomePromotionScreen extends StatelessWidget {
  const HomePromotionScreen({super.key, required this.promtoions});

  final List<HomePromotion> promtoions;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 12),
      width: double.infinity,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          const SizedBox(
            height: 32,
          ),
          Row(
            children: [
              const Text(
                textAlign: TextAlign.left,
                '好康推薦',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
              const Expanded(child: SizedBox()),
              Text(
                textAlign: TextAlign.end,
                '看更多',
                style: TextStyle(
                  color: LeezenColor.greyTextSubTitle.getTypeColor(),
                  fontSize: 12,
                ),
              ),
              const SizedBox(
                width: 12,
              )
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          SizedBox(
            height: 530,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return HomePromotionItemScreen(item: promtoions[index]);
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    width: 12,
                  );
                },
                itemCount: promtoions.length),
          ),
           const SizedBox(height: 32,)
        ],
      ),
    );
  }
}
