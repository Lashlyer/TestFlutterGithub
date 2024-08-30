
import 'package:flutter/material.dart';
import 'package:shopping_list/data/categories.dart';

class HeaderSection extends StatelessWidget {

  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      child: 
          Text(
            '請選擇要結帳的購物籃。',
            style: TextStyle(color: LeezenColor.greyTextBread.getTypeColor(), fontSize: 14),
          ),
    );
  }
}
