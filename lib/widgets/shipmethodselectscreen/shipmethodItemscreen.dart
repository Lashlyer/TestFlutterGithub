

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping_list/data/categories.dart';
import 'package:shopping_list/models/shopcart/ordershipmethod.dart';
import 'package:shopping_list/widgets/shopcartDelivery/ordershipmethoditem.dart';

class ShipMethodItemScreen extends StatelessWidget {

  final OrderShipMethod shipmethod;

  final int index;

  final ValueChanged<int> onSelect;

  final bool isSelected;

  const ShipMethodItemScreen({super.key, required this.shipmethod, required this.index, required this.onSelect, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: LeezenDecoration.normal.customDecoration(),
      padding: const EdgeInsets.all(12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: SizedBox(
              width: 24,
              height: 24,
              child: Radio<int>(
                value: index,
                groupValue: isSelected ? index : null,
                onChanged: (int? value) {
                  onSelect(index);
                },
                activeColor: LeezenColor.primary001.getTypeColor(),
              ),
            ),
          ),

          const SizedBox(width: 8,),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  shipmethod.name,
                  style: TextStyle(
                    color: LeezenColor.primary001.getTypeColor(),
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                  ),
                ),
                const SizedBox(height: 8,),

                Text(
                  shipmethod.phone,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black
                  ),
                ),
                const SizedBox(height: 4,),
                Text(
                  '${shipmethod.zipcode} ${shipmethod.address}',
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black
                  ),
                ),
                
                if (shipmethod.remark.isNotEmpty)
                const SizedBox(height: 4,),
                if (shipmethod.remark.isNotEmpty)
                Text(
                  shipmethod.remark,
                  style: TextStyle(
                    fontSize: 14,
                    color: LeezenColor.greyTextBread.getTypeColor(),
                  ),
                ),
              ],
            ),
          ),
          const Expanded(child: SizedBox()),

          Image.asset(
            'assets/icon-next-primay002.png',
            fit: BoxFit.cover,
            width: 24,
            height: 24,
          )
        ],
      ),
    );
  }
}