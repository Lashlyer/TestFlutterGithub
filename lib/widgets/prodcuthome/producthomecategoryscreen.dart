import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:shopping_list/data/categories.dart';
import 'package:shopping_list/models/home/leezenShortcuts.dart';
import 'package:shopping_list/models/productHome/productHome.dart';

class ProductHomeCategoryScreen extends StatelessWidget {
  final List<Category> categories;

  final void Function() pressSeemore;

  const ProductHomeCategoryScreen({super.key, required this.categories, required this.pressSeemore});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: pressSeemore,
            child: SizedBox(
              height: 24,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    '找好物',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        height: 0),
                  ),
                  const Expanded(child: SizedBox()),
                  Text(
                    '看更多',
                    style: TextStyle(
                      color: LeezenColor.greyTextSubTitle.getTypeColor(),
                      fontSize: 13,
                    ),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          setCategorys(categories),
          const SizedBox(
            height: 31,
          ),
        ],
      ),
    );
  }

  Widget setCategorys(List<Category> categories) {
    return SizedBox(
      width: double.infinity,
      child: MasonryGridView.count(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        crossAxisCount: 2, // 每行兩個按鈕
        mainAxisSpacing: 8, // 垂直間距
        crossAxisSpacing: 8, // 水平間距
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Container(
              height: 66,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8), // 圓角
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  width: double.infinity,
                  height: double.infinity,
                  categories[index].image.withLeeznUrl(),
                  fit: BoxFit.cover,
                ),
              ));
        },
      ),
    );
  }
}
