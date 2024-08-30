import 'package:flutter/material.dart';

class TagScreen extends StatelessWidget {
  const TagScreen(
      {super.key,
      required this.backGroundColor,
      required this.borderRadius,
      required this.text});

  final Color backGroundColor;
  final double borderRadius;
  final String text;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      decoration: BoxDecoration(
        color: backGroundColor,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(4, 1, 4, 1),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 13,
          ),
        ),
      ),
    );
  }
}
