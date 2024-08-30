import 'package:flutter/material.dart';
import 'package:shopping_list/data/categories.dart';
import 'package:shopping_list/models/home/homeTaskMeta.dart';
import 'package:shopping_list/widgets/leezenHome/progressScreen.dart';

class HomeTaskMetaTopScreen extends StatelessWidget {
  const HomeTaskMetaTopScreen({super.key, required this.meta});

  final Meta meta;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: LeezenColor.paleGrey.getTypeColor(),
          border: Border.all(
              color: LeezenColor.lightSkyBlue.getTypeColor(), width: 1.5),
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10))),
      child: Stack(children: [
        Positioned(
          top: 0,
          right: 0,
          child: Image.asset(
            'assets/img-home-top-leaf.png',
            width: 82,
            height: 82,
            fit: BoxFit.cover,
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(12, 16, 12, 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.asset(
                    width: 20,
                    height: 20,
                    'assets/icon-leaf.png',
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  const Text(
                    '水滴任務',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              Text.rich(TextSpan(
                  text: '倒數3天！本週已獲得 ',
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                  children: [
                    TextSpan(
                        text: '${meta.progress}',
                        style: TextStyle(
                            color: LeezenColor.accent001.getTypeColor(),
                            fontSize: 14,
                            fontWeight: FontWeight.bold)),
                    TextSpan(
                      text: '/${meta.max} 點',
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    )
                  ])),
                  
              const SizedBox(
                height: 12,
              ),
              const ProgressScreen(progress: 0.5),
            ],
          ),
        ),
      ]),
    );
  }
}
