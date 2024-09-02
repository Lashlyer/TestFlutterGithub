import 'package:flutter/material.dart';
import 'package:shopping_list/data/categories.dart';

class OrderEstablishedOperatorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12, right: 12),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 40,
            decoration: BoxDecoration(
                color: LeezenColor.primary001.getTypeColor(),
                borderRadius: BorderRadius.circular(30)),
            child: const Center(
              child: Text(
                '結下一筆訂單',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(height: 12),
          Container(
            width: double.infinity,
            height: 40,
            decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                  color: LeezenColor.primary001.getTypeColor(),
                  width: 1.5
                )),
            child: Center(
              child: Text(
                '查詢消費紀錄',
                style: TextStyle(
                    color: LeezenColor.primary001.getTypeColor(),
                    fontSize: 17,
                    fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
    );
  }
}
