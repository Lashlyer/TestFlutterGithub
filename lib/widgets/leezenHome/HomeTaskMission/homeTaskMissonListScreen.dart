import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shopping_list/data/categories.dart';
import 'package:shopping_list/models/home/homeTasksContent.dart';
import 'package:shopping_list/models/home/leezenShortcuts.dart';
import 'package:shopping_list/widgets/leezenHome/HomeTaskMission/homeTaskMissonActicleItem.dart';
import 'package:shopping_list/widgets/leezenHome/HomeTaskMission/homeTaskMissonActivityItem.dart';
import 'package:shopping_list/widgets/leezenHome/HomeTaskMission/homeTaskMissonShareItem.dart';
import 'package:shopping_list/widgets/leezenHome/HomeTaskMission/homeTaskMissonVideoItem.dart';

class HomeTaskMissonListScreen extends StatefulWidget {
  const HomeTaskMissonListScreen({super.key, required this.content});

  final TaskContent content;

  @override
  State<HomeTaskMissonListScreen> createState() =>
      _HomeTaskMissonListScreenState();
}

class _HomeTaskMissonListScreenState extends State<HomeTaskMissonListScreen> {
  @override
  Widget build(BuildContext context) {
    print(widget.content.type);
    switch (widget.content.getContentType()) {
      case TaskContentType.notice:
        return ListView.separated(
            itemBuilder: (context, index) {
              return SizedBox(
                height: 72,
                child: Row(
                  children: [
                    Image.network(
                      widget.content.items![index]!.image.withLeeznUrl(),
                      width: 72,
                      height: 72,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Column(
                      children: [
                        Text(
                          maxLines: 1,
                          widget.content.items![index]!.name.toString(),
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              height: 0.0),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Row(
                          children: [
                            Text(
                              maxLines: 2,
                              widget.content.items![index]!.title.toString(),
                              style: TextStyle(
                                  color: LeezenColor.greyTextSubTitle
                                      .getTypeColor(),
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                  height: 0.0),
                            ),
                            const Expanded(child: SizedBox()),
                            Column(
                              children: [
                                const Expanded(child: SizedBox()),
                                Row(
                                  children: [
                                    Image.asset(
                                      width: 13,
                                      height: 13,
                                      'assets/icon-leaf.png',
                                      fit: BoxFit.cover,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      '${widget.content.items![index]!.point.toString()}點',
                                      style: TextStyle(
                                        color: LeezenColor.primary001
                                            .getTypeColor(),
                                        fontSize: 13,
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(
                height: 20,
              );
            },
            itemCount: min(widget.content.items!.length, 3));

      case TaskContentType.video:
        return HomeTaskMissonVideoItem(content: widget.content);
      case TaskContentType.article:
        return HomeTaskMissonActicleItem(content: widget.content);
      case TaskContentType.activity:
        return HomeTaskMissonActivityItem(content: widget.content);
      case TaskContentType.share:
        return HomeTaskMissonShareItem(content: widget.content);
    }
  }
}
