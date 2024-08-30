
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping_list/data/categories.dart';
import 'package:shopping_list/models/shopcart/cart.dart';

class CounterWidget extends StatefulWidget {

  final Cart cart;

  final void Function(int id, int quantity) changeQuantity;

  const CounterWidget({super.key, required this.cart, required this.changeQuantity});
  
  @override
  _CounterWidgetState createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int _counter = 3;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_counter > 0) {
        _counter--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 28,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        border: Border.all(color: LeezenColor.primary002.getTypeColor()),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              widget.changeQuantity(widget.cart.id, widget.cart.quantity - 1);
            },
            child: Image.asset(
              'assets/icon-minusgreen.png',
              width: 20,
              height: 20,
            ),
          ),

          const SizedBox(width: 4,),

          Container(
            color: LeezenColor.grey003alpha20.getTypeColor(),
            width: 1,
          ),

          const SizedBox(width: 18,),

          Text(
            '${widget.cart.quantity}',
            style: const TextStyle(
              fontSize: 16, 
              color: Colors.black,
              height: 0.0),
          ),

          const SizedBox(width: 18,),

          Container(
            color: LeezenColor.grey003alpha20.getTypeColor(),
            width: 1,
          ),

          const SizedBox(width: 4,),
          
          InkWell(
            onTap: () {
              widget.changeQuantity(widget.cart.id, widget.cart.quantity + 1);
            },
            child: Image.asset(
              'assets/icon-plusgreen.png',
              width: 20,
              height: 20,
            ),
          )
        ],
      ),
    );
  }
}
