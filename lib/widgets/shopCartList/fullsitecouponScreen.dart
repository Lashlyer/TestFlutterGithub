import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shopping_list/data/categories.dart';
import 'package:shopping_list/models/home/leezenShortcuts.dart';
import 'package:shopping_list/models/shopcart/shopCartModel.dart';
import 'package:shopping_list/models/shopcart/shopCartSetting.dart';
import 'package:shopping_list/network/appUrls/app_urls.dart';

class FullSiteCouponScreen extends StatefulWidget {
  final FullSiteCoupon fullsitecoupons;

  const FullSiteCouponScreen({super.key, required this.fullsitecoupons});

  @override
  State<FullSiteCouponScreen> createState() => _FullSiteCouponScreenState();
}

class _FullSiteCouponScreenState extends State<FullSiteCouponScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
          child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 53,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                      padding: const EdgeInsets.all(12),
                      child: Text(
                        '請選擇優惠券：',
                        style: TextStyle(
                            color: LeezenColor.greyTextSubTitle.getTypeColor(),
                            fontSize: 14),
                      )),
                  for (var valid in widget.fullsitecoupons.valids) ...[
                    setCouponItem(valid, true),
                    const SizedBox(
                      height: 12,
                    )
                  ],
                  if (widget.fullsitecoupons.unValids.isNotEmpty) ...[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(12, 8, 12, 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 1,
                            width: 89,
                            color: LeezenColor.grey003alpha50.getTypeColor(),
                          ),
                          const Expanded(child: SizedBox()),
                          Text(
                            '以下優惠券不符使用條件',
                            style: TextStyle(
                                color: LeezenColor.greyTextBread.getTypeColor(),
                                fontSize: 14),
                          ),
                          const Expanded(child: SizedBox()),
                          Container(
                            height: 1,
                            width: 89,
                            color: LeezenColor.grey003alpha50.getTypeColor(),
                          ),
                        ],
                      ),
                    ),
                    for (var unValids in widget.fullsitecoupons.unValids) ...[
                      setCouponItem(unValids, false),
                      const SizedBox(
                        height: 12,
                      )
                    ]
                  ]
                ],
              ),
            ),
          ),
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              height: 53,
              child: Container(
                decoration: BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(
                      color: LeezenColor.charcoal_15.getTypeColor(),
                      blurRadius: 6,
                      spreadRadius: 1,
                      offset: const Offset(0, -4)),
                ]),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(12, 9, 12, 2),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '已選擇',
                            style: TextStyle(
                                color:
                                    LeezenColor.greyTextSubTitle.getTypeColor(),
                                fontSize: 11),
                          ),
                          const Expanded(child: SizedBox()),
                          Text(
                            '${widget.fullsitecoupons.selects.length} 張優惠券',
                            style: TextStyle(
                                color: LeezenColor.primary002.getTypeColor(),
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      const Expanded(child: SizedBox()),
                      Padding(
                        padding: const EdgeInsets.only(top: 2),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context, '');
                          },
                          child: Container(
                            width: 245,
                            height: 40,
                            decoration: BoxDecoration(
                              color: LeezenColor.primary001.getTypeColor(),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: const Center(
                              child: Text(
                                '確定',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ))
        ],
      )),
    );
  }

  Widget setCouponItem(CouponElement coupon, bool isValid) {
    return Opacity(
      opacity: isValid ? 1 : 0.6,
      child: GestureDetector(
        onTap: () {
          if (isValid) {
            setState(() {
              if (widget.fullsitecoupons.selects
                  .any((element) => element.id == coupon.id)) {
                widget.fullsitecoupons.selects
                    .removeWhere((element) => element.id == coupon.id);
              } else {
                widget.fullsitecoupons.selects.add(coupon);
              }
            });
          }
        },
        child: Container(
          height: 116,
          padding: const EdgeInsets.only(left: 12, right: 12),
          child: Stack(
            children: [
              Positioned(
                top: 0,
                left: 0,
                bottom: 0,
                width: 116,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(12),
                      bottomLeft: Radius.circular(12)),
                  child: Image.network(
                    coupon.image.withLeeznUrl(),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                  top: 0,
                  left: 103,
                  bottom: 0,
                  width: 26,
                  child: Image.asset(
                    'assets/img-couponShape.png',
                    fit: BoxFit.cover,
                  )),
              Positioned(
                  top: 0,
                  left: 128,
                  right: 0,
                  bottom: 0,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: LeezenColor.charcoal_15.getTypeColor(),
                              blurRadius: 6,
                              spreadRadius: 1,
                              offset: const Offset(6, 2))
                        ],
                        border: Border(
                            top: BorderSide(
                                color:
                                    LeezenColor.lightGreyGrenen.getTypeColor(),
                                width: 1.5),
                            bottom: BorderSide(
                                color:
                                    LeezenColor.lightGreyGrenen.getTypeColor(),
                                width: 1.5),
                            right: BorderSide(
                                color:
                                    LeezenColor.lightGreyGrenen.getTypeColor(),
                                width: 1.5)),
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(10),
                            bottomRight: Radius.circular(10))),
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 12, bottom: 12, right: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            coupon.name,
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            coupon.summary,
                            maxLines: 2,
                            style: TextStyle(
                                color:
                                    LeezenColor.greyTextSubTitle.getTypeColor(),
                                fontSize: 14),
                          ),
                          const Expanded(child: SizedBox()),
                          Text(
                            '${coupon.startTime} ~ ${coupon.endTime}',
                            style: TextStyle(
                                color: LeezenColor.primary002.getTypeColor(),
                                fontSize: 12),
                          )
                        ],
                      ),
                    ),
                  )),
              Positioned(
                  right: 8,
                  bottom: 8,
                  width: 20,
                  height: 20,
                  child: Icon(Icons.task_alt,
                      color: widget.fullsitecoupons.selects
                              .any((element) => element.id == coupon.id)
                          ? LeezenColor.primary002.getTypeColor()
                          : LeezenColor.grey003.getTypeColor()))
            ],
          ),
        ),
      ),
    );
  }
}
