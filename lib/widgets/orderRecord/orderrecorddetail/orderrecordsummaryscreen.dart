import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping_list/data/categories.dart';
import 'package:shopping_list/models/orderhistory/orderrecorddetail/orderrecorddetail.dart';
import 'package:shopping_list/models/orderhistory/orderrecorddetail/orderstatus.dart';
import 'package:shopping_list/network/appUrls/app_urls.dart';

class OrderRecordSummaryScreen extends StatelessWidget {
  final OrderRecordDetail model;

  const OrderRecordSummaryScreen({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [LeezenCustomUI.bottmShadow],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            color: Colors.white,
            padding: const EdgeInsets.all(12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '訂單金額',
                  style: TextStyle(color: Colors.black, fontSize: 14),
                ),
                const Expanded(child: SizedBox()),
                Text(
                  '\$${model.detail.paidAmount}',
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          if (model.detail.orderPoints != 0 || model.detail.productPoints != 0)
            orderPointBuild(
                model.detail.orderPoints, model.detail.productPoints),
          orderSummaryBuild(model),
          Padding(
            padding: const EdgeInsets.only(left: 12, right: 12),
            child: Container(
              color: LeezenColor.grey003alpha50.getTypeColor(),
              height: 1,
            ),
          ),

          derliverySummaryBuild(model),

          if (model.detail.getOrderStatus() != OrderStatus.canceled)
          summaryOperationBulid(model, context)

        ],
      ),
    );
  }

  Widget orderPointBuild(int orderpoint, int productpoint) {
    return Container(
      width: double.infinity,
      color: LeezenColor.bg002.getTypeColor(),
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (orderpoint != 0) ...[
            Row(
              children: [
                Text(
                  '訂單回饋點數',
                  style: TextStyle(
                      color: LeezenColor.primary001.getTypeColor(),
                      fontSize: 14),
                ),
                const Expanded(child: SizedBox()),
                Image.asset(
                    width: 13,
                    height: 13,
                    fit: BoxFit.cover,
                    'assets/icon-leaf.png'),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  '$orderpoint 點',
                  style: TextStyle(
                      color: LeezenColor.primary001.getTypeColor(),
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
            if (orderpoint != 0 && productpoint != 0) const SizedBox(height: 8)
          ],
          if (productpoint != 0)
            Row(
              children: [
                Text(
                  '訂單回饋點數',
                  style: TextStyle(
                      color: LeezenColor.primary001.getTypeColor(),
                      fontSize: 14),
                ),
                const Expanded(child: SizedBox()),
                Image.asset(
                    width: 13,
                    height: 13,
                    fit: BoxFit.cover,
                    'assets/icon-leaf.png'),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  '$productpoint',
                  style: TextStyle(
                      color: LeezenColor.primary001.getTypeColor(),
                      fontSize: 14),
                )
              ],
            )
        ],
      ),
    );
  }

  Widget orderSummaryBuild(OrderRecordDetail model) {
    return Container(
      padding: const EdgeInsets.all(12),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text(
                '商品數量',
                style: TextStyle(color: Colors.black, fontSize: 14),
              ),
              const Expanded(child: SizedBox()),
              Text(
                '共 ${model.detail.totalCount} 件',
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            children: [
              const Text(
                '總計',
                style: TextStyle(color: Colors.black, fontSize: 14),
              ),
              const Expanded(child: SizedBox()),
              Text(
                '\$${model.detail.totalAmount}',
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
          if (model.detail.totalCouponAmount != 0 ||
              model.detail.totalPromotionAmount != 0)
            const SizedBox(
              height: 8,
            ),
          if (model.detail.totalPromotionAmount != 0) ...[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '活動折扣',
                  style: TextStyle(color: Colors.black, fontSize: 14),
                ),
                const SizedBox(
                  width: 8,
                ),
                InkWell(
                  onTap: () {},
                  child: Text(
                    '(明細)',
                    style: TextStyle(
                        color: LeezenColor.greyTextBread.getTypeColor(),
                        fontSize: 14,
                        decoration: TextDecoration.underline,
                        decorationColor:
                            LeezenColor.greyTextBread.getTypeColor()),
                  ),
                ),
                const Expanded(child: SizedBox()),
                Text(
                  '- \$${model.detail.totalPromotionAmount}',
                  style: TextStyle(
                      color: LeezenColor.accent001.getTypeColor(),
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
            if (model.detail.totalCouponAmount != 0)
              const SizedBox(
                height: 8,
              )
          ],
          if (model.detail.totalCouponAmount != 0) ...[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '優惠券折扣',
                  style: TextStyle(color: Colors.black, fontSize: 14),
                ),
                const SizedBox(
                  width: 8,
                ),
                InkWell(
                  onTap: () {},
                  child: Text(
                    '(明細)',
                    style: TextStyle(
                        color: LeezenColor.greyTextBread.getTypeColor(),
                        fontSize: 14,
                        decoration: TextDecoration.underline,
                        decorationColor:
                            LeezenColor.greyTextBread.getTypeColor()),
                  ),
                ),
                const Expanded(child: SizedBox()),
                Text(
                  '- \$${model.detail.totalCouponAmount}',
                  style: TextStyle(
                      color: LeezenColor.accent001.getTypeColor(),
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                )
              ],
            )
          ],
        ],
      ),
    );
  }

  Widget derliverySummaryBuild(OrderRecordDetail model) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text(
                '運費總計',
                style: TextStyle(color: Colors.black, fontSize: 14),
              ),
              const Expanded(child: SizedBox()),
              Text(
                '\$${model.detail.shippingAmount}',
                style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
          if (model.detail.shippingDiscountAmount != 0) ...[
            const SizedBox(
              height: 8,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '免運折扣',
                  style: TextStyle(color: Colors.black, fontSize: 14),
                ),
                const SizedBox(
                  width: 8,
                ),
                InkWell(
                  onTap: () {},
                  child: Text(
                    '(明細)',
                    style: TextStyle(
                        color: LeezenColor.greyTextBread.getTypeColor(),
                        fontSize: 14,
                        decoration: TextDecoration.underline,
                        decorationColor:
                            LeezenColor.greyTextBread.getTypeColor()),
                  ),
                ),
                const Expanded(child: SizedBox()),
                Text(
                  '- \$${model.detail.shippingDiscountAmount}',
                  style: TextStyle(
                      color: LeezenColor.accent001.getTypeColor(),
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                )
              ],
            )
          ],
          if (model.detail.shippingCouponAmount != 0) ...[
            const SizedBox(
              height: 8,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '運費優惠券',
                  style: TextStyle(color: Colors.black, fontSize: 14),
                ),
                const SizedBox(
                  width: 8,
                ),
                InkWell(
                  onTap: () {},
                  child: Text(
                    '(明細)',
                    style: TextStyle(
                        color: LeezenColor.greyTextBread.getTypeColor(),
                        fontSize: 14,
                        decoration: TextDecoration.underline,
                        decorationColor:
                            LeezenColor.greyTextBread.getTypeColor()),
                  ),
                ),
                const Expanded(child: SizedBox()),
                Text(
                  '- \$${model.detail.shippingCouponAmount}',
                  style: TextStyle(
                      color: LeezenColor.accent001.getTypeColor(),
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                )
              ],
            )
          ],
          if (model.detail.codFee != 0) ...[
            const SizedBox(
              height: 8,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '超商物流手續費',
                  style: TextStyle(color: Colors.black, fontSize: 14),
                ),
                const Expanded(child: SizedBox()),
                Text(
                  '\$${model.detail.codFee}',
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                )
              ],
            )
          ]
        ],
      ),
    );
  }

  Widget summaryOperationBulid(OrderRecordDetail model, BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            color: LeezenColor.grey003alpha50.getTypeColor(),
            height: 1,
          ),
          const SizedBox(
            height: 12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (model.detail.getOrderStatus() ==
                  OrderStatus.pendingPayment) ...[
                Container(
                  width: (LeezenCustomUI().deviceWidth(context) - 36) / 2,
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(
                          color: LeezenColor.primary001.getTypeColor(),
                          width: 1)),
                  child: Center(
                    child: Text(
                      '取消所有訂單',
                      style: TextStyle(
                          color: LeezenColor.primary001.getTypeColor(),
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const Expanded(child: SizedBox()),
                Container(
                  width: (LeezenCustomUI().deviceWidth(context) - 36) / 2,
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(
                          color: LeezenColor.primary001.getTypeColor(),
                          width: 1)),
                  child: Center(
                    child: Text(
                      '訂單提問',
                      style: TextStyle(
                          color: LeezenColor.primary001.getTypeColor(),
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              ],

              if (model.detail.getOrderStatus() != OrderStatus.pendingPayment)
                Container(
                  width: (LeezenCustomUI().deviceWidth(context) - 36) / 2,
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(
                          color: LeezenColor.primary001.getTypeColor(),
                          width: 1)),
                  child: Center(
                    child: Text(
                      '訂單提問',
                      style: TextStyle(
                          color: LeezenColor.primary001.getTypeColor(),
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                )
            ],
          )
        ],
      ),
    );
  }
}
