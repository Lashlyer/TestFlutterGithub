import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shopping_list/models/home/homeBanner.dart';
import 'package:shopping_list/models/home/leezenShortcuts.dart';

class HomeBannerScreen extends StatefulWidget {
  const HomeBannerScreen({super.key, required this.banners, required this.pressBanner});

  final List<HomeBanner> banners;
  final void Function(String link) pressBanner;

  @override
  State<HomeBannerScreen> createState() => _HomeBannerScreenState();
}

class _HomeBannerScreenState extends State<HomeBannerScreen> {
  int _currentImageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: CarouselSlider(
        options: CarouselOptions(
          height: 157,
          autoPlay: true,
          viewportFraction: 1,
          onPageChanged: (index, reason) {
            setState(() {
              _currentImageIndex = index;
            });
          },
        ),
        items: widget.banners.map((banner) {
          return Builder(
            builder: (context) {
              return InkWell(
                onTap:() {
                  widget.pressBanner(banner.link.toString());
                },
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Image.network(banner.image.withLeeznUrl(), fit: BoxFit.cover),
                ),
              );
            },
          );
        }).toList(),
      ),
    );
  }
}
