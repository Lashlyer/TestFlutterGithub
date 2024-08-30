import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shopping_list/data/categories.dart';
import 'package:shopping_list/models/home/homeTaskMeta.dart';
import 'package:shopping_list/models/home/homeTasks.dart';
import 'package:shopping_list/widgets/leezenHome/HomeTaskMission/homeTaskMetaTopScrenn.dart';
import 'package:shopping_list/widgets/leezenHome/HomeTaskMission/homeTaskMissonListScreen.dart';

class HomeTaskMetaScreen extends StatefulWidget {
  const HomeTaskMetaScreen({super.key, required this.tasks});

  final HomeTasks tasks;

  @override
  State<HomeTaskMetaScreen> createState() => _HomeTaskMetaScreenState();
}

class _HomeTaskMetaScreenState extends State<HomeTaskMetaScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int currentIndex = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController =
        TabController(length: widget.tasks.content!.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    print(widget.tasks!.content![0]!.type);

    return Container(
      color: Colors.white,
      padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
      child: Container(
        width: double.infinity,
        // height: 600,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: const Color.fromARGB(1, 47, 51, 43).withOpacity(0.15),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: const Offset(0, 2))
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // if (tasks.meta != null)
            HomeTaskMetaTopScreen(meta: Meta(15, 30)),

            const SizedBox(
              height: 14,
            ),

            Container(
              padding: const EdgeInsets.only(left: 12),
              width: 75.0 * widget.tasks.content!.length,
              height: 28.0,
              child: TabBar(
                onTap: (value) {
                  setState(() {
                    currentIndex = value;
                  });
                },
                dividerColor: Colors.transparent,
                indicatorSize: TabBarIndicatorSize.label,
                indicatorWeight: 1.0,
                labelColor: leezenColor[LeezenColor.primary001]!.color,
                indicatorColor: leezenColor[LeezenColor.primary001]!.color,
                labelPadding: const EdgeInsets.only(left: 0, right: 28),
                controller: _tabController,
                tabs: [
                  for (final content in widget.tasks.content!)
                    Tab(
                      text: content!.name,
                    ),
                ],
              ),
            ),

            const SizedBox(
              height: 16,
            ),

            Padding(
                padding: const EdgeInsets.only(left: 12, right: 12),
                child: HomeTaskMissonListScreen(
                    content: widget.tasks.content![currentIndex]!)),

            const SizedBox(
              height: 16,
            ),

            Container(
              padding: const EdgeInsets.only(left: 12, right: 12),
              width: double.infinity,
              height: 40,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Expanded(child: SizedBox()),
                  SizedBox(
                    width: 106,
                    child: Column(
                      children: [
                        Center(
                            child: Text(
                          '全部任務',
                          style: TextStyle(
                              color: LeezenColor.primary001.getTypeColor(),
                              fontSize: 12,
                              height: 0),
                        )),
                        Image.asset(
                            width: 106,
                            height: 16,
                            'assets/btn-misson-arrow.png')
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 14,)
          ],
        ),
      ),
    );
  }
}
