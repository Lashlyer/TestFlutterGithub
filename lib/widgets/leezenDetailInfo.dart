import 'package:flutter/material.dart';
import 'package:shopping_list/data/categories.dart';
import 'package:shopping_list/models/detailItem.dart';
import 'package:shopping_list/widgets/leezenPrice.dart';
import 'package:shopping_list/widgets/tag.dart';
import 'package:carousel_slider/carousel_slider.dart';

class LeezenDetailInfo extends StatefulWidget {
  const LeezenDetailInfo({super.key, required this.detail});

  final DetailItem detail;

  @override
  State<LeezenDetailInfo> createState() => _LeezenDetailInfoState();
}

class _LeezenDetailInfoState extends State<LeezenDetailInfo> {
  int _currentImageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            CarouselSlider(
                options: CarouselOptions(
                  height: 375,
                  autoPlay: false,
                  viewportFraction: 1,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentImageIndex = index;
                    });
                  },
                ),
                items: widget.detail.imageUrl.map((url) {
                  return Builder(
                    builder: (context) {
                      return SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Image.network(url, fit: BoxFit.cover),
                      );
                    },
                  );
                }).toList()),
            Positioned(
              bottom: 12,
              right: 12,
              child: Container(
                height: 18,
                decoration: BoxDecoration(
                    color: const Color.fromRGBO(250, 249, 243, 1),
                    borderRadius: BorderRadius.circular(9.0)),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(8, 1, 8, 1),
                  child: Text(
                    '${(_currentImageIndex + 1)}/${widget.detail.imageUrl.length}',
                    style: TextStyle(
                        color: leezenColor[LeezenColor.primary001]!.color,
                        fontSize: 12),
                  ),
                ),
              ),
            )
          ],
        ), //圖片
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 21,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return TagScreen(
                          backGroundColor:
                              leezenColor[LeezenColor.primary002]!.color,
                          borderRadius: 2,
                          text: widget.detail.tags[index]);
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(width: 8);
                    },
                    itemCount: widget.detail.tags.length),
              ), // tag
              const SizedBox(
                height: 12,
              ),

              Text('${widget.detail.brand}${widget.detail.name}',
                  style: const TextStyle(
                      height: 0,
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),

              const SizedBox(height: 8),

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  LeezenPriceWidget(
                    price: widget.detail.price,
                    fontSize: 20,
                    isNeedStrightLine: false,
                  ),
                  const SizedBox(width: 8),
                  if (widget.detail.price < widget.detail.salePrice)
                    Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: LeezenPriceWidget(
                          price: widget.detail.salePrice,
                          fontSize: 16,
                          isNeedStrightLine: true),
                    )
                ],
              ),

              const SizedBox(height: 12),

              Text(
                textAlign: TextAlign.justify,
                widget.detail.feature,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
        ),

        if (widget.detail.sku != null)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 1,
                color: leezenColor[LeezenColor.bg003]!.color,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 14, 12, 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      '規格 ${widget.detail.sku?.sku}',
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.normal),
                    ),

                    const Expanded(child: SizedBox()),

                    // ignore: unrelated_type_equality_checks
                    if (widget.detail.sku?.boxMax != 0)
                      Text(
                        textAlign: TextAlign.end,
                        '${widget.detail.sku?.boxMax}入成箱出貨',
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.normal),
                      )
                  ],
                ),
              ),
              Container(
                height: 1,
                color: leezenColor[LeezenColor.bg003]!.color,
              ),
            ],
          ), // 規格
        if (widget.detail.stamp.isNotEmpty)
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '標章/榮譽',
                  style: TextStyle(
                      height: 0,
                      color: leezenColor[LeezenColor.primary002]!.color,
                      fontSize: 14,
                      fontWeight: FontWeight.normal),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  height: 52,
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Image.network(
                          widget.detail.stamp[index].image,
                          width: 48,
                          height: 48,
                          fit: BoxFit.cover,
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(width: 12);
                      },
                      itemCount: widget.detail.stamp.length
                  ),
                ),
              ],
            ),
          )
      ],
    );
  }
}
