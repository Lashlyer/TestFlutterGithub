import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'package:shopping_list/data/categories.dart';
import 'package:shopping_list/models/productHome/productHome.dart';
import 'package:shopping_list/models/productHome/productcategory.dart';
import 'package:shopping_list/network/appUrls/app_urls.dart';
import 'package:shopping_list/network/response/apistatus.dart';
import 'package:shopping_list/widgets/prodcuthome/producthomeitemscreen.dart';
import 'package:shopping_list/widgets/productlist/productlistitemscreen.dart';
import 'package:shopping_list/widgets/productlist/productlistviewmodel.dart';

class ProductListScreen extends StatefulWidget {
  final SubCategory? category;

  final List<SubCategory> subcategories;

  const ProductListScreen(
      {super.key, required this.category, required this.subcategories});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  late ProductListViewModel viewModel;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    viewModel = ProductListViewModel(
        category: widget.category, subcategories: widget.subcategories);
    viewModel.configure();
    _scrollController.addListener(_onScroll);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent - 100 &&
        !viewModel.isLoading) {
      viewModel.loadMoreProducts(); // 加载更多数据
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ChangeNotifierProvider<ProductListViewModel>(
        create: (context) => viewModel,
        child: Consumer<ProductListViewModel>(
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
                    if (viewModel.category != null)
                      SliverPersistentHeader(
                          pinned: true,
                          delegate: _StickHeaderDelegate(
                            child: setSubcategoriesTag(
                                viewModel.subcategories, viewModel.category!),
                          )),
                    SliverToBoxAdapter(
                      child: topViewBuild(
                          value.apiResponse.data!.length, viewModel.listType),
                    ),
                    SliverToBoxAdapter(
                      child: viewModel.listType == ProductListType.card
                          ? setProductCards(viewModel.products)
                          : setProductList(viewModel.products),
                    ),
                    // 加载更多指示器
                    SliverToBoxAdapter(
                      child: viewModel.isLoading
                          ? Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Center(child: CircularProgressIndicator()),
                            )
                          : SizedBox.shrink(),
                    ),
                  ],
                );
              case ApiStatus.error:
                return Center(
                  child: Text(value.apiResponse.message.toString()),
                );

              default:
                return Container(
                  color: Colors.black,
                );
            }
          },
        ),
      ),
    );
  }

  Widget topViewBuild(int count, ProductListType type) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
      child: Row(
        children: [
          Text(
            '共$count個',
            style: TextStyle(
                color: LeezenColor.greyTextSubTitle.getTypeColor(),
                fontSize: 13),
          ),
          const Expanded(child: SizedBox()),
          GestureDetector(
            onTap: viewModel.pressTypeChange,
            child: Icon(
              type == ProductListType.card ? Icons.collections : Icons.list,
              color: LeezenColor.primary002.getTypeColor(),
              size: 24,
            ),
          )
        ],
      ),
    );
  }

  Widget setSubcategoriesTag(
      List<SubCategory> categories, SubCategory category) {
    return Container(
        width: double.infinity,
        height: 44,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [LeezenCustomUI.bottmShadow],
        ),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 6, bottom: 6),
                child: MasonryGridView.count(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  crossAxisCount: 1,
                  mainAxisSpacing: 8,
                  itemCount: categories.length + 2,
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return const SizedBox(
                        width: 6,
                      );
                    }

                    if (index == categories.length + 1) {
                      return const SizedBox(
                        width: 6,
                      );
                    }

                    return GestureDetector(
                      onTap: () {
                        viewModel.pressTag(categories[index - 1]);
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 6.0, horizontal: 12.0),
                        height: 32,
                        decoration: BoxDecoration(
                            color: categories[index - 1].id == category.id
                                ? LeezenColor.primary002.getTypeColor()
                                : Colors.white,
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(
                                width: 1,
                                color: LeezenColor.primary002.getTypeColor())),
                        child: Text(
                          categories[index - 1].name,
                          style: TextStyle(
                              color: categories[index - 1].id == category.id
                                  ? Colors.white
                                  : LeezenColor.primary002.getTypeColor(),
                              fontSize: 13,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                    color: LeezenColor.charcoal_15.getTypeColor(),
                    blurRadius: 6,
                    spreadRadius: 1,
                    offset: const Offset(-2, 0))
              ]),
              width: 48,
              height: 44,
              child: Center(
                child: Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: LeezenColor.primary002.getTypeColor(),
                  // size: 24,
                ),
              ),
            )
          ],
        ));
  }

  Widget setProductCards(List<ProductItem> items) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: MasonryGridView.count(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ProductHomeItemScreen(product: items[index]);
        },
      ),
    );
  }

  Widget setProductList(List<ProductItem> items) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: MasonryGridView.count(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        crossAxisCount: 1,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ProductListItemScreen(item: items[index]);
        },
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
