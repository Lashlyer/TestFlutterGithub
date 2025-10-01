
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shopping_list/data/categories.dart';
import 'package:shopping_list/models/orderhistory/orderrecorddetail/suborder.dart';

class OrderRecordSuborderProgress extends StatelessWidget {

  final Suborder suborder;

  const OrderRecordSuborderProgress({
    super.key,
    required this.suborder
  });

  Color getLeftColor(int current, int index) {
    if (index == 0) {
      return Colors.transparent;
    } 

    if (current > index ) {
      return LeezenColor.primary002.getTypeColor();
    }

    return LeezenColor.grey003.getTypeColor();
  }

  Color getRightColor(int current, int index) {
    if (index == suborder.steps.length - 1) {
      return Colors.transparent;
    }

    if (current > index + 1) {
      return LeezenColor.primary002.getTypeColor();
    }

    return LeezenColor.grey003.getTypeColor();
  }

  String formatDateTime(String dateTimeString) {
    // 解析日期字串為 DateTime
    DateTime parsedDate = DateTime.parse(dateTimeString);
    
    // 使用 DateFormat 格式化日期
    DateFormat formatter = DateFormat('MM/dd HH:mm');
    return formatter.format(parsedDate.toLocal()); // 將時間轉換為本地時間並格式化
  }


  @override
  Widget build(BuildContext context) {
    int currentstep = suborder.steps.lastIndexWhere((step) => step.active) + 1;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(suborder.steps.length, (index) {
        return Expanded(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Divider(
                      color: getLeftColor(currentstep, index),
                      thickness: 2,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 12,
                        backgroundColor:
                            index < currentstep ? LeezenColor.primary002.getTypeColor(): LeezenColor.grey003alpha50.getTypeColor(),
                        child: Text(
                          '${index + 1}',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Divider(
                      color: getRightColor(currentstep, index),
                      thickness: 2,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Text(
                suborder.steps[index].name,
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  color: index < currentstep
                      ? LeezenColor.primary002.getTypeColor()
                      : LeezenColor.grey003.getTypeColor(),
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                index < currentstep ? formatDateTime(suborder.steps[index].time!) : '',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  color: index < currentstep
                      ? LeezenColor.primary002.getTypeColor()
                      : LeezenColor.grey003.getTypeColor(),
                ),
                textAlign: TextAlign.center,
              )
            ],
          ),
        );
      }),
    );
  }
}