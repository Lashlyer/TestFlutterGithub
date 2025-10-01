import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shopping_list/data/categories.dart';
import 'package:shopping_list/models/orderhistory/orderrecorddetail/suborder.dart';
import 'package:shopping_list/network/appUrls/app_urls.dart';
import 'package:shopping_list/widgets/orderRecord/orderrecordsuborderdetail/orderrecordsuborderprogress.dart';

class OrderRecordSuborderDetailinfoScreen extends StatelessWidget {
  final Suborder suborder;

  const OrderRecordSuborderDetailinfoScreen(
      {super.key, required this.suborder});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '單號: ${suborder.no}',
            style: TextStyle(
                color: LeezenColor.primary001.getTypeColor(),
                fontSize: 16,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 24,
          ),
          OrderRecordSuborderProgress(suborder: suborder),
          const SizedBox(
            height: 24,
          ),
          Divider(
            height: 1,
            color: LeezenColor.grey003alpha50.getTypeColor(),
          ),
          const SizedBox(
            height: 12,
          ),
          buyerItemBuild('收件人姓名', suborder.receiverName),
          const SizedBox(
            height: 12,
          ),
          buyerItemBuild('收件人手機', suborder.receiverPhone),
          const SizedBox(
            height: 12,
          ),
          Divider(
            height: 1,
            color: LeezenColor.grey003alpha50.getTypeColor(),
          ),
          const SizedBox(
            height: 12,
          ),
          buyerItemBuild('取貨方式', suborder.shippingMethodName),
          const SizedBox(
            height: 12,
          ),
          buyerItemBuild('收件地址', suborder.suborderaddress()),
          const SizedBox(
            height: 12,
          ),
          Divider(
            height: 1,
            color: LeezenColor.grey003alpha50.getTypeColor(),
          ),
          if (suborder.refundable || suborder.cancelable)
          twoOperationBuild(
              (LeezenCustomUI().deviceWidth(context) - 36) / 2, suborder),

          if (!suborder.cancelable && !suborder.cancelable)
          oneOperationBuild((LeezenCustomUI().deviceWidth(context) - 36) / 2, suborder)
        ],
      ),
    );
  }

  Widget buyerItemBuild(String title, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 13,
          ),
        ),
        const SizedBox(
          width: 46,
        ),
        Expanded(
          child: Text(
              textAlign: TextAlign.end,
              value,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 13,
                  fontWeight: FontWeight.bold)),
        ),
      ],
    );
  }

  Widget twoOperationBuild(double width, Suborder suborder) {
    return Column(
      children: [
        const SizedBox(
          height: 12,
        ),
        Row(
          children: [
            Container(
              width: width,
              height: 40,
              decoration: BoxDecoration(
                  color: suborder.shippingMethod != 4
                      ? Colors.white
                      : LeezenColor.primary001.getTypeColor(),
                  border: Border.all(
                    color: LeezenColor.primary001.getTypeColor(),
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(30)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.qr_code,
                    size: 24,
                    color: suborder.shippingMethod != 4
                        ? LeezenColor.primary001.getTypeColor()
                        : Colors.white,
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(
                    suborder.shippingMethod != 4 ? '交易條碼' : '取貨憑證',
                    style: TextStyle(
                        color: suborder.shippingMethod != 4
                            ? LeezenColor.primary001.getTypeColor()
                            : Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            const SizedBox(
              width: 11,
            ),
            Container(
              width: width,
              height: 40,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: LeezenColor.primary001.getTypeColor(),
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(30)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (suborder.refundable)
                    Text(
                      '退貨申請',
                      style: TextStyle(
                          color: LeezenColor.primary001.getTypeColor(),
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  if (suborder.cancelable)
                    Text(
                      '取消訂單',
                      style: TextStyle(
                          color: LeezenColor.primary001.getTypeColor(),
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    )
                ],
              ),
            )
          ],
        )
      ],
    );
  }

  Widget oneOperationBuild(double width, Suborder suborder) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          height: 12,
        ),
        Center(
          child: Container(
            width: width,
            height: 40,
            decoration: BoxDecoration(
                color: suborder.shippingMethod != 4
                    ? Colors.white
                    : LeezenColor.primary001.getTypeColor(),
                border: Border.all(
                  color: LeezenColor.primary001.getTypeColor(),
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(30)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.qr_code,
                  size: 24,
                  color: suborder.shippingMethod != 4
                      ? LeezenColor.primary001.getTypeColor()
                      : Colors.white,
                ),
                const SizedBox(
                  width: 4,
                ),
                Text(
                  suborder.shippingMethod != 4 ? '交易條碼' : '取貨憑證',
                  style: TextStyle(
                      color: suborder.shippingMethod != 4
                          ? LeezenColor.primary001.getTypeColor()
                          : Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
