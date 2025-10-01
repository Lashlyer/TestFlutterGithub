

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shopping_list/data/categories.dart';
import 'package:shopping_list/models/shopcart/shopcartprojects.dart';
import 'package:shopping_list/network/appUrls/app_urls.dart';

class ShopcartProjectItem extends StatelessWidget {

  final ShopcartProject project;

  final bool isSelected;

  final void Function(ShopcartProject project) pressItem;

  const ShopcartProjectItem({super.key, required this.project, required this.isSelected, required this.pressItem});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          LeezenCustomUI.bottmShadow
        ]
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Divider(
            height: 1.5,
            color: LeezenColor.primary001.getTypeColor(),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                if (!isSelected) {
                  print('press');
                  pressItem(project);
                }
              },
              child: Container(
                color: LeezenColor.bg004.getTypeColor(),
                padding: const EdgeInsets.all(12),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      width: 24,
                      height: 24,
                      'assets/img-discountunselected.png',
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(width: 8,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          project.name,
                          style: TextStyle(
                            color: LeezenColor.primary001.getTypeColor(),
                            fontSize: 15,
                            fontWeight: FontWeight.bold
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}