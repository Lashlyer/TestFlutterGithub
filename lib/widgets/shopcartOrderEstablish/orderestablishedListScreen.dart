


import 'package:flutter/material.dart';
import 'package:shopping_list/data/categories.dart';
import 'package:shopping_list/models/home/shopcartorderEstablished/orderestablishedModel.dart';
import 'package:shopping_list/widgets/shopcartOrderEstablish/orderestablishedlistitem.dart';

class OrderEstablishedDetailListScreen extends StatelessWidget {

  final ShopcartOrderEstablished model;



  const OrderEstablishedDetailListScreen({super.key, required this.model,});


  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white, 
        boxShadow: [
        BoxShadow(
            color: LeezenColor.charcoal_15.getTypeColor(),
            blurRadius: 6,
            spreadRadius: 1,
            offset: const Offset(0, 2))
      ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: LeezenColor.primary001.getTypeColor(),
            width: double.infinity,
            height: 1.5,
          ),
          Container(
            width: double.infinity,
            color: LeezenColor.bg004.getTypeColor(),
            padding: const EdgeInsets.all(12),
            child: Text(
              '一般訂單',
              style: TextStyle(
                color: LeezenColor.primary001.getTypeColor(),
                fontSize: 16,
                fontWeight: FontWeight.bold
              ),
            ), 
          ),

          for (var (index, item) in model.orderitmes.indexed)
          OrderEstablishedListItem(item: item, isUnderlineHidden: index < model.orderitmes.length -1)

        ],
      ),
    );
  }
}