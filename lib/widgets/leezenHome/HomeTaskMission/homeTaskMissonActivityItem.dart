

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shopping_list/data/categories.dart';
import 'package:shopping_list/models/home/homeTasksContent.dart';
import 'package:shopping_list/models/home/leezenShortcuts.dart';

class HomeTaskMissonActivityItem extends StatelessWidget {
  const HomeTaskMissonActivityItem(
      {super.key, required this.content});

  final TaskContent content;

  @override
  Widget build(BuildContext context) {
    
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
                mainAxisSize: MainAxisSize.max,
                children: [
                  Image.network(
                    content.items![index]!.image.withLeeznUrl(),
                    height: 154,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Container(
                    height: 47,  
                    padding: const EdgeInsets.only(left: 8, right: 8),
                    child: Text(
                      maxLines: 2,
                      content.items![index]!.name.toString(),
                      style: const TextStyle(
                        height: 0,
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold
                      ),
                    ),),
                    // const SizedBox(height: 2,),

                    Container(
                      height: 16,
                      padding: const EdgeInsets.only(left: 8, right: 8),
                      child: Text(
                        '截至 ${content.items![index]!.endTime.toString().substring(0, 10)}',
                        style: TextStyle(
                          color: LeezenColor.greyTextSubTitle.getTypeColor(),
                          fontSize: 12
                        ),
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
