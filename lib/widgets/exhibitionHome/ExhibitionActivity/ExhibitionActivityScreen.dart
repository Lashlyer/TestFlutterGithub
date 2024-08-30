import 'package:flutter/material.dart';
import 'package:shopping_list/data/categories.dart';
import 'package:shopping_list/models/exhibitionHome/activity.dart';
import 'package:shopping_list/models/home/leezenShortcuts.dart';

class ExhibitionActivityScreen extends StatelessWidget {
  final List<Activity> activities;
  final void Function(Activity activity) pressItem;

  const ExhibitionActivityScreen(
      {super.key, required this.activities, required this.pressItem});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      height: 240 * activities.length.toDouble(),
      padding: const EdgeInsets.only(left: 12, right: 12),
      child: ListView.separated(
          primary: false,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                pressItem(activities[index]);
              },
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      width: double.infinity,
                      height: 232,
                      activities[index].image.withLeeznUrl(),
                      fit: BoxFit.cover,
                    ),
                  ),
                  if (activities[index].newest)
                    Positioned(
                      width: 67,
                      height: 43,
                      top: 0,
                      left: 0,
                      child: Image.asset(
                        '- assets/tagNew.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Container(
                      color: LeezenColor.primary001.getTypeColor(),
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        activities[index].status,
                        style:
                            const TextStyle(fontSize: 12, color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(
              height: 12,
            );
          },
          itemCount: activities.length),
    );
  }
}
