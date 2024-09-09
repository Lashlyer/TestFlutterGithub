import 'package:flutter/material.dart';
import 'package:shopping_list/data/categories.dart';
import 'package:shopping_list/models/shopcart/order.dart';
import 'package:shopping_list/models/shopcart/ordershipmethod.dart';
import 'package:shopping_list/widgets/shipmethodselectscreen/shipmethodItemscreen.dart';

class ShipMethodSelectScreen extends StatefulWidget {
  final List<OrderShipMethod> shipMethods;

  final Order selectedOrder;

  const ShipMethodSelectScreen({super.key, required this.shipMethods, required this.selectedOrder});

  @override
  State<ShipMethodSelectScreen> createState() => _ShipMethodSelectScreenState();
}

class _ShipMethodSelectScreenState extends State<ShipMethodSelectScreen> {
  int? _selectedMethodindex;
  String? _selectedMethodValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          Positioned.fill(
              child: Image.asset(
            'assets/splash_bg.png',
            fit: BoxFit.cover,
          )),
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: LeezenDecoration.normal.customDecoration(),
                  width: double.infinity,
                  height: 72,
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: LeezenColor.grey003alpha50.getTypeColor(),
                            width: 1),
                        borderRadius: BorderRadius.circular(8)),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: _selectedMethodValue,
                        icon: const Icon(
                          Icons.keyboard_arrow_down,
                          color: Colors.black,
                        ),
                        isExpanded: true,
                        onChanged: (value) {
                          setState(() {
                            _selectedMethodValue = value;
                          });
                        },
                        items: ['宅配', '自取'].map((value) {
                          return DropdownMenuItem(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 24)
              ],
            ),
          ),
          Positioned(
            top: 96,
            left: 0,
            right: 0,
            child: Column(
              children: [
                for (var (index, ship) in widget.shipMethods.indexed) ...[
                  ShipMethodItemScreen(
                      shipmethod: ship,
                      index: index,
                      onSelect: (value) {
                        setState(() {
                          _selectedMethodindex = value;
                        });
                      },
                      isSelected: _selectedMethodindex == index),
                  if (index < widget.shipMethods.length - 1)
                    const SizedBox(
                      height: 12,
                    )
                ],
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            height: 60,
            child: InkWell(
              onTap: () {
                if (_selectedMethodindex != null) {
                  widget.selectedOrder.shipMethod = widget.shipMethods[_selectedMethodindex!];
                  Navigator.pop(context, widget.shipMethods[_selectedMethodindex!]);
                }
              },
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: LeezenDecoration.normal.topShadowDecoration(),
                child: Container(
                  width: double.infinity,
                  height: 40,
                  decoration: BoxDecoration(
                      color: LeezenColor.primary001.getTypeColor(),
                      borderRadius: BorderRadius.circular(30)),
                  child: const Center(
                      child: Text(
                    '確認',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.bold),
                  )),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
