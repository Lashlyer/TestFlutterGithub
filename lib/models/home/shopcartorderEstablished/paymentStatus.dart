

import 'package:flutter/material.dart';
import 'package:shopping_list/data/categories.dart';

enum PaymentStatus {
  paid,
  unpaid
}

extension PaymentStatusExtension on PaymentStatus {
  String typeName() {
    switch (this) {
      case PaymentStatus.paid:
       return '已付款';
      case PaymentStatus.unpaid:
       return '等待付款';
    }
  }

  Color typeColor() {
    switch (this) {
      case PaymentStatus.paid:
       return Colors.black;
      case PaymentStatus.unpaid:
       return LeezenColor.accent001.getTypeColor();
    }
  }
}