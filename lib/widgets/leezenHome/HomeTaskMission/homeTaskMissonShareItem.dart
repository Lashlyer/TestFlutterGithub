


import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shopping_list/data/categories.dart';
import 'package:shopping_list/models/home/homeTasksContent.dart';
import 'package:shopping_list/models/home/leezenShortcuts.dart';


class HomeTaskMissonShareItem extends StatelessWidget {
  const HomeTaskMissonShareItem(
      {super.key, required this.content});

  final TaskContent content;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SizedBox(
      height: 253,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.only(bottom: 5),
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                    color:
                        const Color.fromARGB(1, 47, 51, 43).withOpacity(0.15),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: const Offset(0, 2))
              ]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(
                    content.items![index]!.image.withLeeznUrl(),
                    height: 154,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Container(
                    color: Colors.transparent,
                    width: 216,
                    margin: const EdgeInsets.only(left: 8, right: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 20,
                              child: Text(
                                '文章分類',
                                style: TextStyle(
                                  color: LeezenColor.primary001.getTypeColor(),
                                  fontSize: 13,
                                ),
                              ),
                            ),
                            const Expanded(child: SizedBox()),
                            
                          ],
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        Text(
                          maxLines: 2,
                          content.items![index]!.title.toString(),
                          style: const TextStyle(
                              color: Colors.black,
                              height: 0.0,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 12,
                        )
                      ],
                    ),
                  )
                ],
              ),
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(
              width: 12,
            );
          },
          itemCount: min(content.items!.length, 3)),
    );
  }
}
