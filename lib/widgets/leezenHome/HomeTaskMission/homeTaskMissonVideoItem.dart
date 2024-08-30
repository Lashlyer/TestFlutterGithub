

import 'package:flutter/material.dart';
import 'package:shopping_list/data/categories.dart';
import 'package:shopping_list/models/home/homeTasksContent.dart';
import 'package:shopping_list/models/home/leezenShortcuts.dart';

class HomeTaskMissonVideoItem extends StatelessWidget {

    const HomeTaskMissonVideoItem(
      {super.key, required this.content});

  final TaskContent content;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
          children: [
            Image.network(
              content.items![0]!.image.withLeeznUrl(),
              width: double.infinity,
              height: 216,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                SizedBox(
                  width: 100,
                  child: Text(
                    maxLines: 1,
                    content.items![0]!.name.toString(),
                    style: TextStyle(
                        color: LeezenColor.primary001.getTypeColor(),
                        fontSize: 13,
                        fontWeight: FontWeight.normal),
                  ),
                ),
                const Expanded(child: SizedBox()),
                Image.asset(
                  'assets/icon-leaf.png',
                  width: 13,
                  height: 13,
                  fit: BoxFit.cover,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  '${content.items![0]!.point.toString()}點',
                  style: TextStyle(
                      color: LeezenColor.primary001.getTypeColor(),
                      fontSize: 13,
                      fontWeight: FontWeight.normal),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              maxLines: 1,
              content.items![0]!.summary.toString(),
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
          ],
        );
  }
}