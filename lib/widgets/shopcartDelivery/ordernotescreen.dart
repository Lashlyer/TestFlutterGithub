

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping_list/data/categories.dart';
import 'package:shopping_list/models/shopcartdelivery/shopcartdelivery.dart';

class OrderNoteScreen extends StatefulWidget {

  final ShopcartDeliveryModel model;

  const OrderNoteScreen({super.key, required this.model});

  @override
  State<OrderNoteScreen> createState() => _OrderNoteScreenState();
}

class _OrderNoteScreenState extends State<OrderNoteScreen> {
  late TextEditingController _controller; 
  @override
  void initState() {
    _controller = TextEditingController(text: widget.model.orderRemark);
    super.initState();
  }

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
            style: const TextStyle(color: Colors.black, fontSize: 14),
            controller: _controller,
            maxLines: 5,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8)
              ),
              contentPadding: const EdgeInsets.all(12)
            ),
            onChanged: (value) {
              widget.model.orderRemark = value;
            },
          )
        ],
      ),

    );
  }
}