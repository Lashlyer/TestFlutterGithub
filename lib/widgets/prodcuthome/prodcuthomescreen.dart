import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_list/data/categories.dart';
import 'package:shopping_list/network/response/apistatus.dart';
import 'package:shopping_list/widgets/prodcuthome/producthomecategoryscreen.dart';
import 'package:shopping_list/widgets/prodcuthome/producthomeproductscreen.dart';
import 'package:shopping_list/widgets/prodcuthome/producthomepromotionscreen.dart';
import 'package:shopping_list/widgets/prodcuthome/producthometopicscreen.dart';
import 'package:shopping_list/widgets/prodcuthome/producthomeviewmodel.dart';

class ProdcutHomeScreen extends StatefulWidget {
  const ProdcutHomeScreen({super.key});

  @override
  State<ProdcutHomeScreen> createState() => _ProdcutHomeScreenState();
}

class _ProdcutHomeScreenState extends State<ProdcutHomeScreen>
    with SingleTickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();

  late ProductHomeViewModel viewModel;

  late TabController _tabController;

  int tabcurrentIndex = 0;

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    viewModel = ProductHomeViewModel(context: context);
    viewModel.fetchApi();
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(),
      body: ChangeNotifierProvider<ProductHomeViewModel>(
        create: (context) => viewModel,
        child: Consumer<ProductHomeViewModel>(
          builder: (context, value, child) {
            switch (value.apiResponse.status) {
              case ApiStatus.loading:
                return const Center(
                  child: CircularProgressIndicator(),
                );
              case ApiStatus.completed:
                return CustomScrollView(
                  controller: _scrollController,
                  slivers: [
                    SliverToBoxAdapter(
                      child: SizedBox(
                        height: 24,
                        child: TextField(
                          keyboardType: TextInputType.numberWithOptions(),
                          textInputAction: TextInputAction.done,
                          decoration: InputDecoration(
                            labelText: '請輸入數字',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: ProductHomePromotionScreen(
                          promotions: value.apiResponse.data!.promotions,
                          pressPromotion: viewModel.pressPromotion),
                    ),
                    SliverToBoxAdapter(
                      child: ProductHomeTopicScreen(
                        topics: value.apiResponse.data!.topics,
                        presstopic: viewModel.pressTopics,
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: ProductHomeCategoryScreen(
                        categories: value.apiResponse.data!.categories,
                        pressSeemore: viewModel.pressSeemore,
                      ),
                    ),
                    if (value.apiResponse.data!.products.isNotEmpty) ...[
                      const SliverToBoxAdapter(
                        child: Padding(
                          padding:
                              EdgeInsets.only(left: 12, right: 12, bottom: 12),
                          child: Text(
                            '里仁選品 安心永續',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      SliverPersistentHeader(
                          pinned: true,
                          delegate: _StickHeaderDelegate(
                              child: Container(
                                  height: 44,
                                  color: Colors.white,
                                  child: TabBar(
                                    onTap: (value) {
                                      setState(() {
                                        print(value);
                                        tabcurrentIndex = value;
                                      });
                                    },
                                    dividerColor: Colors.transparent,
                                    indicatorSize: TabBarIndicatorSize.tab,
                                    labelColor:
                                        LeezenColor.primary002.getTypeColor(),
                                    indicatorColor:
                                        LeezenColor.primary002.getTypeColor(),
                                    controller: _tabController,
                                    tabs: [
                                      for (var product
                                          in value.apiResponse.data!.products)
                                        Tab(
                                          text: product.name,
                                        )
                                    ],
                                  )))),
                      SliverToBoxAdapter(
                        child: ProductHomeProductsScreen(
                            product: value.apiResponse.data!
                                .products[tabcurrentIndex].items),
                      )
                    ]
                  ],
                );
              case ApiStatus.error:
                return Center(
                  child: Text(value.apiResponse.message.toString()),
                );
              default:
                return Container();
            }
          },
        ),
      ),
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
