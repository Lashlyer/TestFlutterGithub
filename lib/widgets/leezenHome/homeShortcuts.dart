import 'package:flutter/material.dart';
import 'package:shopping_list/models/home/leezenShortcuts.dart';
import 'package:shopping_list/widgets/leezenHome/hommShortcutsItem.dart';

class LeezenHomeShortuctsScreen extends StatelessWidget {
  const LeezenHomeShortuctsScreen({super.key, required this.data});

  final List<LeezenHomeShortucts> data;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 104,
      padding: const EdgeInsets.only(left: 13, top: 16, bottom: 16),
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return LeezenHomeShortuctsItem(shortuct: data[index]);
          },
          separatorBuilder: (context, index) {
              return const SizedBox(width: 18);
          },
          itemCount: data.length),
    );
  }
}
