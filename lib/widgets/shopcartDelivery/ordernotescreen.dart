

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping_list/data/categories.dart';

class OrderNoteScreen extends StatefulWidget {


  @override
  State<OrderNoteScreen> createState() => _OrderNoteScreenState();
}

class _OrderNoteScreenState extends State<OrderNoteScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: LeezenColor.charcoal_15.getTypeColor(),
            blurRadius: 5,
            spreadRadius: 1,
            offset: const Offset(0, 2)
          )
        ],
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '訂單備註',
            style: TextStyle(
              color: LeezenColor.primary001.getTypeColor(),
              fontSize: 16,
              fontWeight: FontWeight.bold
            ),
          ),

          const SizedBox(height: 12),

          TextField(
            maxLines: 5,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8)
              ),
              contentPadding: const EdgeInsets.all(12)
            ),
          )
        ],
      ),

    );
  }
}