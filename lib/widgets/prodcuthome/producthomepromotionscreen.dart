

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shopping_list/data/categories.dart';
import 'package:shopping_list/models/home/leezenShortcuts.dart';

import '../../models/productHome/productHome.dart';

class ProductHomePromotionScreen extends StatefulWidget {

  final List<Promotion> promotions;

  final void Function(String id) pressPromotion;

  const ProductHomePromotionScreen({super.key, required this.promotions, required this.pressPromotion});


  @override
  State<ProductHomePromotionScreen> createState() => _ProductHomePromotionScreenState();
}

class _ProductHomePromotionScreenState extends State<ProductHomePromotionScreen> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
      child: Column(
        children: [
          SizedBox(
            height: 24,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  '好康優惠',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    height: 0
                  ),
                  
                ),
                  
                const Expanded(child: SizedBox()),
                  
                Text(
                    '看更多',
                    style: TextStyle(
                      color: LeezenColor.greyTextSubTitle.getTypeColor(),
                      fontSize: 13,
                    ),
                )
                
              ],
            ),
          ),

          const SizedBox(height: 12),
          SizedBox(
            height: 146,
            width: double.infinity,
            child: CarouselSlider(
              
              items: imageSliders(widget.promotions), 
              options: CarouselOptions(
                viewportFraction: 1,
                enlargeCenterPage: false,
                scrollDirection: Axis.horizontal,
                autoPlay: true,
                enableInfiniteScroll: true,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentIndex = index;
                  });
                },   
                    
              )
            ),
          ),
          const SizedBox(height: 12,),
          indicators(widget.promotions.length),
          const SizedBox(height: 31,)
        ],
      ),
    );
  }

  List<Widget> imageSliders(List<Promotion> promotions) {
    return promotions.map((promotion) => 
        InkWell(
          onTap: () {
            widget.pressPromotion(promotion.id.toString());
          },
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10)
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                promotion.image.withLeeznUrl(),
                fit: BoxFit.cover,
              ),
            )
                ),
        )
    ).toList();
  }

  Widget indicators(int count) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (int i = 0; i < count; i++) ... [
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: i == _currentIndex ? LeezenColor.primary002.getTypeColor() : LeezenColor.bg004.getTypeColor()
            ),
          ),

          if (i != count - 1)
          const SizedBox(width: 12)
        ]
      ],
    );
  }
}