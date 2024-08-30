import 'package:flutter/material.dart';
import 'package:shopping_list/data/categories.dart';
import 'package:shopping_list/models/home/homeActivity.dart';
import 'package:shopping_list/models/home/leezenShortcuts.dart';

class HomeActivityItemScreen extends StatelessWidget {

  const HomeActivityItemScreen({super.key, required this.activity});

  final HomeActivity activity;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.only(top: 2, bottom: 2),
      child: Container(
        width: 260,
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
          children: [
            SizedBox(
              width: double.infinity,
              height: 176,
              child: Stack(
                children: [
                  
                  Positioned(
                    top: 0,
                    left: 0,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                      child: Image.network(
                        activity.image.withLeeznUrl(),
                        height: 173,
                        fit: BoxFit.cover),
                    ),
                  ),

                  if (activity.newest)
                  Positioned(
                    top: 0,
                    left: 0,
                    child: Image.asset(
                      'assets/tagNew.png',
                      width: 67,
                      height: 43,
                      fit: BoxFit.cover),
                  ),
                  
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(12),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  
                  children: [
                    Text(
                      activity.category,
                      style: TextStyle(
                        color: LeezenColor.primary001.getTypeColor(),
                        fontSize: 13, 
                        height: 0.0
                      ),
                    ),

                    const SizedBox(height: 8,),

                    Text(
                      maxLines: 2,
                      activity.name,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        height: 0.0
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
