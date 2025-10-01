import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_list/data/categories.dart';
import 'package:shopping_list/models/PromoSaleMulty/promosalemultimodel.dart';
import 'package:shopping_list/models/home/leezenShortcuts.dart';
import 'package:shopping_list/network/response/apistatus.dart';
import 'package:shopping_list/stringExtention.dart';
import 'package:shopping_list/widgets/salepromoperoid/salepromopreiodlistviewmodel.dart';
import 'package:shopping_list/widgets/salepromoperoid/salepromotionpreioditemscreen.dart';

class SalePromoPreiodListScreen extends StatefulWidget {
  final String id;

  final SalePromoPreiodType type;

  const SalePromoPreiodListScreen({super.key, required this.id, required this.type});

  @override
  State<SalePromoPreiodListScreen> createState() =>
      _SalePromoPreiodListScreenState();
}

class _SalePromoPreiodListScreenState extends State<SalePromoPreiodListScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  final ScrollController _scrollController = ScrollController();
  final Map<int, double> _sectionOffsets = {};

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    print('TODO: implement didChangeDependencies');
    super.didChangeDependencies();
  }



  @override
  void dispose() {
    _tabController?.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _initializeTabController(int length) {
    if (_tabController == null && length > 0) {
      _tabController = TabController(length: length, vsync: this);
      _tabController!.addListener(() {
        if (_tabController!.indexIsChanging) {
          _scrollToSection(_tabController!.index);
        }
      });
    }
  }

  void _scrollToSection(int index) {
    final offset = _sectionOffsets[index] ?? 0.0;
    _scrollController.animateTo(
      offset,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _calculateSectionOffsets(List<Promotion> promotions) {
    // 初始顶部图片和内容高度
    double offset = 233;

    for (int i = 0; i < promotions.length; i++) {
      _sectionOffsets[i] = offset;
       // 綠色區塊
       offset += 45;
      for (var (index, item) in promotions[i].items.indexed) {
        // 白色區塊
        offset += 34.0;
        // 卡片區塊
        int cardheightCount = item.products.length % 2 == 0 ? item.products.length ~/ 2 : (item.products.length ~/ 2) + 1;

        offset += (331 * cardheightCount) + 12;
      }
    }
  }

  @override
  void didUpdateWidget(covariant SalePromoPreiodListScreen oldWidget) {
    print('didUpdateWidget') ;
    super.didUpdateWidget(oldWidget);
  }

  @override
  void deactivate() {
    print('deactivate');
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      appBar: AppBar(
        title: Text('檔期'),
      ),
      body: ChangeNotifierProvider<SalePromoPreiodListViewmodel>(
        create: (context) => SalePromoPreiodListViewmodel()..fetchSalePromoPreiodListApi(widget.id, widget.type),
        child: Consumer<SalePromoPreiodListViewmodel>(
          builder: (context, value, child) {
            switch (value.apiResponse.status) {
              case ApiStatus.loading:
                return const Center(
                  child: CircularProgressIndicator(),
                );
              case ApiStatus.error:
                return Center(
                  child: Text(value.apiResponse.message.toString()),
                );
              case ApiStatus.completed:
                final promotions = value.apiResponse.data!.promotions;
                _initializeTabController(promotions.length);
                _calculateSectionOffsets(promotions);

                return CustomScrollView(
                  controller: _scrollController,
                  slivers: [
                    SliverToBoxAdapter(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.network(
                            value.apiResponse.data!.detail.image.withLeeznUrl(),
                            width: double.infinity,
                            height: 156,
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(height: 12),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: Text(
                              value.apiResponse.data!.detail.name,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: Text(
                              '${value.apiResponse.data!.detail.startTime.toFormattedDate()} ~ ${value.apiResponse.data!.detail.endTime.toFormattedDate()}',
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                              ),
                            ),
                          ),
                          const SizedBox(height: 12),
                        ],
                      ),
                    ),
                    SliverPersistentHeader(
                      pinned: true,
                      delegate: _SliverAppBarDelegate(
                        promtotionTagBuild(promotions),
                      ),
                    ),
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          if (index < promotions.length) {
                            return SalePromotionPreiodItemScreen(
                              promotion: promotions[index],
                            );
                          } else {
                            return Container(
                              width: double.infinity,
                              height: 100,
                            );
                          }
                        },
                        childCount: promotions.length + 1,
                      ),
                    ),
                  ],
                );
              default:
                return Container();
            }
          },
        ),
      ),
    );
  }

  Widget promtotionTagBuild(List<Promotion> promotions) {
    if (_tabController == null || promotions.isEmpty) return Container();
    return Row(
      children: [
        Expanded(
          child: TabBar(
            controller: _tabController,
            labelColor: LeezenColor.primary001.getTypeColor(),
            unselectedLabelColor: LeezenColor.greyTextSubTitle.getTypeColor(),
            indicatorColor: LeezenColor.primary001.getTypeColor(),
            dividerColor: Colors.transparent,
            padding: EdgeInsets.zero,
            tabAlignment: TabAlignment.start,
            indicatorWeight: 1.5,
            isScrollable: true,
            tabs: [
              for (var promotion in promotions)
                Tab(
                  text: promotion.name,
                )
            ],
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_upward),
          iconSize: 24,
        ),
      ],
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;

  _SliverAppBarDelegate(this.child);

  @override
  double get minExtent => 44.0;

  @override
  double get maxExtent => 44.0;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white,
      child: child,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
