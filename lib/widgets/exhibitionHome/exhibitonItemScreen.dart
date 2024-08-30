import 'package:flutter/material.dart';
import 'package:shopping_list/models/exhibitionHome/exhibition.dart';
import 'package:shopping_list/models/home/leezenShortcuts.dart';

class ExhibitionItemScreen extends StatelessWidget {
  const ExhibitionItemScreen(
      {super.key, 
      required this.exhibition, 
      required this.pressItem,
      required this.height});

  final Exhibition exhibition;

  final void Function(Exhibition exhibition) pressItem;

  final double height;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: height,
        // margin: EdgeInsets.only(left: 12, right: 12),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(6)),
        child: InkWell(
            onTap: () {
              pressItem(exhibition);
            },
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: Image.network(
                    height: 180,
                    width: double.infinity,
                    exhibition.imageApp.withLeeznUrl(),
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 12,
                  left: 10,
                  right: 10,
                  child: Text(
                    exhibition.name,
                    style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            )),
    );
  }
}
