import 'package:flutter/material.dart';
import 'package:shopping_list/data/categories.dart';

enum PaymentType { credicard, atm, storePayment, taiwanPay }

extension PaymentTypeExtension on PaymentType {
  String get typeName {
    switch (this) {
      case PaymentType.credicard:
        return '信用卡';
      case PaymentType.atm:
        return 'ATM轉帳';
      case PaymentType.storePayment:
        return '超商付款';
      case PaymentType.taiwanPay:
        return 'TaiwanPay';
    }
  }

  String get description {
    switch (this) {
      case PaymentType.credicard:
        return '訂單送出後，將轉第三方付款頁面，進行信用卡資訊填寫。';
      case PaymentType.atm:
        return '請你在3天內完成轉帳，以免訂單自動失效。';
      case PaymentType.storePayment:
        return '請在3天內持付款條碼於7-11、全家、萊爾富及OK超商進行付款。\n請留意：超商代收並非即時入帳。於完成付款4天後，待里仁收到超商付款完成通知，便盡速為你出貨。';
      case PaymentType.taiwanPay:
        return '將使用 Taiwan Pay 進行付款。';
    }
  }
}

class PaymentMethodScreen extends StatefulWidget {
  @override
  _PaymentMethodScreenState createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  PaymentType? _selectedMethod = PaymentType.credicard; // 选中的支付方式

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
            color: LeezenColor.charcoal_15.getTypeColor(),
            blurRadius: 6,
            spreadRadius: 1,
            offset: const Offset(0, 2))
      ]),
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '付款方式',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: LeezenColor.primary001.getTypeColor(),
            ),
          ),
          const SizedBox(height: 12),
          _buildRadioOption(
            value: PaymentType.credicard,
            groupValue: _selectedMethod,
          ),
          const SizedBox(
            height: 16,
          ),
          _buildRadioOption(
            value: PaymentType.atm,
            groupValue: _selectedMethod,
          ),
          const SizedBox(
            height: 16,
          ),
          _buildRadioOption(
            value: PaymentType.storePayment,
            groupValue: _selectedMethod,
          ),
          const SizedBox(
            height: 16,
          ),
          _buildRadioOption(
            value: PaymentType.taiwanPay,
            groupValue: _selectedMethod,
          ),
        ],
      ),
    );
  }

  Widget _buildRadioOption(
      {required PaymentType value, required PaymentType? groupValue}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start, // 控制垂直对齐方式
      children: [
        SizedBox(
          width: 24,
          height: 24,
          child: Radio<PaymentType>(
            value: value,
            groupValue: groupValue,
            activeColor: LeezenColor.primary001.getTypeColor(),
            onChanged: (PaymentType? newValue) {
              setState(() {
                _selectedMethod = newValue;
              });
            },
          ),
        ),
        const SizedBox(width: 12.0),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                value.typeName,
                style: const TextStyle(
                    fontSize: 14.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              if (value == groupValue) const SizedBox(height: 8),
              if (value == groupValue)
                Text(
                  value.description,
                  style: TextStyle(
                    fontSize: 12.0,
                    color: LeezenColor.greyplaceholder.getTypeColor(),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
