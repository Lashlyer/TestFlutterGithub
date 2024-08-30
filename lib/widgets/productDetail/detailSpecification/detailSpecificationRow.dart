

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shopping_list/models/detailContent.dart';

class DetailSpecificationRow extends StatelessWidget {

  const DetailSpecificationRow({super.key, required this.data, required this.color});

  final Specification data;
  final Color color;

  @override
  Widget build(BuildContext context) {

    return Container(
      color: color,
      padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
      child: Row(
        children: [
          SizedBox(
            width: 100,
            child: Text(
              data.title,
              textAlign: TextAlign.left,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.bold
              ),
            ),
          ),

          const SizedBox(width: 12,),

          Text(
            data.value,
            textAlign: TextAlign.left,
            style: const TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.normal
              ),
          )
        ],
      ),
    );
  }
}