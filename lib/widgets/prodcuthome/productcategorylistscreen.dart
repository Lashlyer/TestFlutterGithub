import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_list/data/categories.dart';
import 'package:shopping_list/network/appUrls/app_urls.dart';
import 'package:shopping_list/network/response/apistatus.dart';
import 'package:shopping_list/widgets/prodcuthome/productcategorylistviewmodel.dart';

class ProductCategoryListScreen extends StatefulWidget {
  const ProductCategoryListScreen({super.key});

  @override
  State<ProductCategoryListScreen> createState() =>
      _ProductCategoryListScreenState();
}

class _ProductCategoryListScreenState extends State<ProductCategoryListScreen> {
  late ProductCategoryListViewModel viewModel;
  int _currentIndex = 0;

  @override
  void initState() {
    viewModel = ProductCategoryListViewModel(context: context);
    viewModel.fetchApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body: ChangeNotifierProvider<ProductCategoryListViewModel>(
        create: (context) => viewModel,
        child: Consumer<ProductCategoryListViewModel>(
          builder: (context, value, child) {
            switch (value.apiResponse.status) {
              case ApiStatus.loading:
                return const Center(
                  child: CircularProgressIndicator(),
                );

              case ApiStatus.completed:
                return SafeArea(
                  child: Stack(
                    children: [
                      Positioned(
                        top: 0,
                        left: 0,
                        right: 0,
                        bottom: 0,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              color: LeezenColor.bg004.getTypeColor(),
                              height: double.infinity,
                              width: 173,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  
                                  for (var (index, category) in value
                                      .apiResponse.data!.categories.indexed) ...[
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          _currentIndex = index;
                                        });
                                      },
                                      child: Container(
                                        width: double.infinity,
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 12, horizontal: 12),
                                        color: _currentIndex == index
                                            ? Colors.white
                                            : LeezenColor.bg004.getTypeColor(),
                                        child: Text(
                                          category.name,
                                          style: TextStyle(
                                              color: _currentIndex == index
                                                  ? LeezenColor.primary001
                                                      .getTypeColor()
                                                  : LeezenColor.greyTextSubTitle
                                                      .getTypeColor(),
                                              fontSize: 16,
                                              fontWeight: _currentIndex == index
                                                  ? FontWeight.bold
                                                  : FontWeight.normal),
                                        ),
                                      ),
                                    ),
                                    Divider(
                                      height: 0.5,
                                      color: LeezenColor.grey003alpha20
                                          .getTypeColor(),
                                    )
                                  ]
                                ],
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                
                                for (var subcategory in value.apiResponse.data!
                                    .categories[_currentIndex].subcategory) ...[
                                  GestureDetector(
                                    onTap: () {
                                      viewModel.pressCategory(
                                        subcategory, 
                                        value.apiResponse.data!.categories[_currentIndex].subcategory
                                      );
                                    },
                                    child: Container(
                                      width:
                                          LeezenCustomUI().deviceWidth(context) -
                                              174,
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 12, horizontal: 12),
                                      child: Text(subcategory.name,
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                  ),
                                  const Divider(
                                    height: 0.5,
                                  )
                                ]
                              ],
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        left: 0,
                        right: 0,
                        bottom: 0,
                        child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [LeezenCustomUI.topShadow]),
                            child: GestureDetector(
                              onTap: () {},
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                                child: Container(
                                  height: 40,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: LeezenColor.primary001.getTypeColor()
                                  ),
                                  child: const Center(
                                    child: Text(
                                      '查看所有產品',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )),
                      )
                    ],
                  ),
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
