

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:shopping_list/data/categories.dart';

import '../../models/productHome/productHome.dart';

class ProductHomeTopicScreen extends StatelessWidget {

  final List<Topic> topics;

  final void Function(String id) presstopic;

  const ProductHomeTopicScreen({super.key, required this.topics, required this.presstopic});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '不藏私！水滴會員都在看',
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.bold
            ),
          ),

          const SizedBox(height: 12,),

          setTopic(topics),

          const SizedBox(height: 31,)
        ],
      ),
    );
  }

  Widget setTopic(List<Topic> topics) {
    return SizedBox(
      height: 80,
      child: MasonryGridView.count(
        scrollDirection: Axis.horizontal,
        crossAxisCount: 2, // 每行兩個按鈕
        mainAxisSpacing: 8, // 垂直間距
        crossAxisSpacing: 8, // 水平間距
        itemCount: topics.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              presstopic(topics[index].id.toString());
            },
            child: Container(
              decoration: BoxDecoration(
                color: LeezenColor.bg004.getTypeColor(),
                borderRadius: BorderRadius.circular(18), // 圓角
              ),
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Center(
                child: Text(
                  topics[index].name,
                  style: TextStyle(
                    fontSize: 14, 
                    color: LeezenColor.primary001.getTypeColor()),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}