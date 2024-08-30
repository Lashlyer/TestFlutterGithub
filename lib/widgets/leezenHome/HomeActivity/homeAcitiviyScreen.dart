import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shopping_list/data/categories.dart';
import 'package:shopping_list/models/home/homeActivity.dart';
import 'package:shopping_list/widgets/leezenHome/HomeActivity/homeActivityItemScreen.dart';

class HomeActivityScreen extends StatelessWidget {
  const HomeActivityScreen({super.key, required this.activities});

  final List<HomeActivity> activities;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 24,
            padding: const EdgeInsets.only(left: 12, right: 12),
            child: Row(
              children: [
                const Text(
                  '找活動',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
                const Expanded(child: SizedBox()),
                Text(
                  '找更多',
                  style: TextStyle(
                      color: LeezenColor.greyTextSubTitle.getTypeColor(),
                      fontSize: 11,
                      fontWeight: FontWeight.normal),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Container(
            color: Colors.white,
            height: 290,
            padding: const EdgeInsets.only(top: 5, left: 12, bottom: 5),
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  if (index < activities.length) {
                    return HomeActivityItemScreen(activity: activities[index]);
                  } else {
                    return SizedBox(
                      width: 146,
                      height: double.infinity,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              '探索更多',
                              style: TextStyle(
                                color: LeezenColor.primary001.getTypeColor(),
                                fontSize: 13,
                              ),
                            ),
                      
                            const SizedBox(height: 4,),
                      
                            Image.asset(
                              width: 106,
                              height: 16,
                              'assets/btn-misson-arrow.png'
                            )
                          ],
                        ),
                      ),
                    );
                  }
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    width: 12,
                  );
                },
                itemCount: activities.length + 1),
          ),

          const SizedBox(height: 32,)
        ],
      ),
    );
  }
}
