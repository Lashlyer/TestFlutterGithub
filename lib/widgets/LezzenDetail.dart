import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:shopping_list/data/categories.dart';
import 'package:shopping_list/models/detailItem.dart';
import 'package:shopping_list/models/grocery_item.dart';
import 'package:http/http.dart' as http;
import 'package:shopping_list/widgets/productDetail/detailNutrition/detailNutrition.dart';
import 'package:shopping_list/widgets/productDetail/detailSpecification/detailSpecification.dart';
import 'package:shopping_list/widgets/productDetail/detailContent/leezenDetailContent.dart';
import 'package:shopping_list/widgets/leezenDetailInfo.dart';
import 'package:shopping_list/widgets/lezzenDetailShipping.dart';

class LeezenDetail extends StatefulWidget {
  const LeezenDetail({super.key, required this.item, required this.id});

  final TestItem item;
  final String id;

  @override
  State<LeezenDetail> createState() => _LeezenDetailState();
}

class _LeezenDetailState extends State<LeezenDetail>
    with SingleTickerProviderStateMixin {
  late Future<DetailItem> detail;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    detail = _loadDetail(widget.id);
    print(widget.id);
    _tabController =
        TabController(length: DetailContentType.values.length, vsync: this);
  }

  @override 
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
   
  Future<DetailItem> _loadDetail(String id) async {
    final url =
        Uri.parse('http://leezen.app.13930.com/api/v1/product/detail/$id');

    final response = await http.get(url);

    if (response.statusCode >= 400) {
      throw Exception('Faile to fetcg grocery item');
    }

    final Map<String, dynamic> data = json.decode(response.body);

    return DetailItem.fromJson(data['data']);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          textAlign: TextAlign.center,
          widget.item.name ?? '',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.ios_share_outlined),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.shopping_basket_outlined),
            onPressed: () {},
          ),
        ],
      ),
      body: FutureBuilder(
        future: detail,
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.only(bottom: 48),
              child: CustomScrollView(slivers: [
                SliverToBoxAdapter(
                    child: LeezenDetailInfo(detail: snapshot.data!)),

                SliverPersistentHeader(
                  pinned: true,
                  delegate: _StickHeaderDelegate(
                    child: Container(
                        height: 44,
                        color: Colors.white,
                        child: TabBar(
                          indicatorSize: TabBarIndicatorSize.tab,
                          labelColor:
                              leezenColor[LeezenColor.primary002]!.color,
                          indicatorColor:
                              leezenColor[LeezenColor.primary002]!.color,
                          controller: _tabController,
                          tabs: [
                            Tab(
                              text: DetailContentType.content
                                  .getDetailContentTyepName(),
                            ),
                            Tab(
                              text: DetailContentType.nutritions
                                  .getDetailContentTyepName(),
                            ),
                            Tab(
                              text: DetailContentType.specifications
                                  .getDetailContentTyepName(),
                            ),
                            Tab(
                              text: DetailContentType.shipping
                                  .getDetailContentTyepName(),
                            )
                          ],
                        )),
                  ),
                ),
                SliverToBoxAdapter(
                  child: LeezenDetailContent(content: snapshot.data!.content),
                ),
                if (snapshot.data!.content.specifications != null && snapshot.data!.content.specifications!.specifications.isNotEmpty)
                SliverToBoxAdapter(
                  child: DetailSpecification(model: snapshot.data!.content.specifications!),
                ),

                if (snapshot.data!.content.nutritions != null && snapshot.data!.content.nutritions!.isNotEmpty) 
                SliverToBoxAdapter(
                  child: DetailNutrtionItem(nutrition: snapshot.data!.content.nutritions!.first, total: snapshot.data!.content.nutritions!.length),
                ),

                SliverToBoxAdapter(
                  child: LeeznDetailShipping(url: snapshot.data!.content.shipping,),
                )
              ]),
            );
          }
        },
      ),
      bottomNavigationBar: Container(
        height: 49,
        decoration: const BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
              color: Color.fromRGBO(47, 51, 43, 0.2),
              blurRadius: 6,
              spreadRadius: 1,
              offset: Offset(0, -2))
        ]),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
          child: Row(
            children: [
              SizedBox(
                  width: 48,
                  height: 48,
                  child: ElevatedButton(
                    child: Image.asset('assets/unWish.png'),
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(4),
                        backgroundColor: Colors.white,
                        shadowColor: null),
                  ))
            ],
          ),
        ),
      ),
      extendBody: true,
    );
  }
}

class _StickHeaderDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;

  _StickHeaderDelegate({required this.child});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Material(
      elevation: 4.0,
      child: child,
    );
  }

  @override
  double get maxExtent => 44.0; // header的最大高度

  @override
  double get minExtent => 44.0; // header的最小高度

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
