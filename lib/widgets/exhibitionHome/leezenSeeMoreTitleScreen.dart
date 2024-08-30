import 'package:flutter/material.dart';
import 'package:shopping_list/data/categories.dart';

class LeezenSeeMoreTitleScreen extends StatelessWidget {

  const LeezenSeeMoreTitleScreen({super.key, required this.title, required this.seeMore});

  final String title;

  final void Function() seeMore;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      children: [
        Text(
          textAlign: TextAlign.left,
          title,
          style: const TextStyle(
              color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold),
        ),
        const Expanded(child: SizedBox()),
        InkWell(
          onTap: () {
            seeMore();
          },
          child: Text(
            textAlign: TextAlign.end,
            '看更多',
            style: TextStyle(
              color: LeezenColor.greyTextSubTitle.getTypeColor(),
              fontSize: 12,
            ),
          ),
        ),
      ],
    );
  }
}
