

import 'package:flutter/material.dart';
import 'package:shopping_list/models/home/leezenShortcuts.dart';

class LeezenHomeShortuctsItem extends StatelessWidget {

  const LeezenHomeShortuctsItem({super.key, required this.shortuct});

  final LeezenHomeShortucts shortuct;
  
  @override

  Widget build(BuildContext context) {

    return SizedBox(
      width: 50,
      height: double.infinity,
      child: Column(
        children: [
          Image.network(
            width: 48,
            height: 48,
            shortuct.image.withLeeznUrl(),
            fit: BoxFit.cover, 
          ),
      
          const Expanded(child: SizedBox()),
      
          Text(
            shortuct.name ?? '',
            style: const TextStyle(
              color: Colors.black,
              fontSize: 11,
              fontWeight: FontWeight.bold,
              height: 0
            ),
          )
        ],
      ),
    );
  }
}