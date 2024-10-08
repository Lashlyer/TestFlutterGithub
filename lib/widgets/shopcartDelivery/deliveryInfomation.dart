import 'package:flutter/material.dart';
import 'package:shopping_list/data/categories.dart';

class DeliveryInfomation extends StatelessWidget {

  const DeliveryInfomation({super.key});

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 12, 12, 27),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '重要提醒！',
            style: TextStyle(
                color: LeezenColor.primary001.getTypeColor(),
                fontSize: 14,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            '我們不會主動要求你更改任何付款方式或操作 ATM。\n天天里仁提醒你，接到「+」開頭顯示的電話號碼、且自稱為天天里仁客服者，無論其號碼顯示為何，都是詐騙電話，你可撥打 02-27132829 與我們查證，保障你的權益。',
            style: TextStyle(
              color: LeezenColor.greyTextSubTitle.getTypeColor(),
              fontSize: 12,
            ),
            softWrap: true,
            overflow: TextOverflow.visible,
            maxLines: 10,
          ),
        ],
      ),
    );
  }
}
