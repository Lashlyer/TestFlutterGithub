import 'package:flutter/material.dart';
import 'package:shopping_list/data/categories.dart';

enum HomeTopRowItemType { point, coupon, order }

extension HomeTopRowItemTypeExtention on HomeTopRowItemType {
  String typeName() {
    switch (this) {
      case HomeTopRowItemType.point:
        return '永續點數';
      case HomeTopRowItemType.coupon:
        return '優惠券';
      case HomeTopRowItemType.order:
        return '待取貨訂單';
    }
  }

  String imgeName() {
    switch (this) {
      case HomeTopRowItemType.point:
        return 'assets/img-home-top-point.png';
      case HomeTopRowItemType.coupon:
        return 'assets/img-home-top-coupon.png';
      case HomeTopRowItemType.order:
        return 'assets/img-home-top-takeout.png';
    }
  }
}

class HomeTopPointRow extends StatelessWidget {
  const HomeTopPointRow({super.key, required this.type, required this.value});

  final HomeTopRowItemType type;
  final String value;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SizedBox(
      width: 67,
      height: 53,
      child: Stack(
        children: [
          Positioned(
              left: 0,
              top: 0,
              child: Image.asset(
                width: 28,
                height: 28,
                type.imgeName(),
                fit: BoxFit.cover,
              )),
          Positioned(
            top: 9,
            left: 5,
            right: 5,
            child: Text(
              textAlign: TextAlign.center,
              value,
              style: TextStyle(
                  height: 0.0,
                  color: LeezenColor.primary002.getTypeColor(),
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 2,
            child: Text(
              textAlign: TextAlign.center,
              type.typeName(),
              style: const TextStyle(
                  height: 0.0,
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
