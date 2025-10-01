import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:shopping_list/data/categories.dart';
import 'package:shopping_list/network/appUrls/app_urls.dart';
import 'package:shopping_list/network/response/apistatus.dart';
import 'package:shopping_list/viewmodel/shopcart_home_viewmodel.dart';
import 'package:shopping_list/widgets/orderRecord/viewmodel/orderrecordlistitemscreen.dart';
import 'package:shopping_list/widgets/orderRecord/viewmodel/orderrecordlistviewmodel.dart';

class OrderRecordListScreen extends StatefulWidget {
  const OrderRecordListScreen({super.key});

  @override
  State<OrderRecordListScreen> createState() => _OrderRecordListScreenState();
}

class _OrderRecordListScreenState extends State<OrderRecordListScreen>
    with SingleTickerProviderStateMixin {
  late OrderRecordListViewModel viewModel;
  late TabController _tabController;

  @override
  void initState() {
    viewModel = OrderRecordListViewModel();
    viewModel.fetchOrderRecordListApi();
    _tabController = TabController(length: 2, vsync: this);

    super.initState();
  }

  void pressItem(int id) {
    viewModel.pressItem(context, id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('我的購物籃'),
        ),
        body: ChangeNotifierProvider<OrderRecordListViewModel>(
          create: (context) => viewModel,
          child: Consumer<OrderRecordListViewModel>(
              builder: (context, value, child) {
            switch (value.apiResponse.status) {
              case ApiStatus.loading:
                return const Center(
                  child: CircularProgressIndicator(),
                );
              case ApiStatus.error:
                return Center(
                  child: Text(
                    value.apiResponse.message.toString(),
                  ),
                );
              case ApiStatus.completed:
                return Stack(
                  children: [
                    Positioned.fill(child: LeezenCustomUI.backgroundImage),
                    Positioned(
                      left: 0,
                      right: 0,
                      top: 116,
                      bottom: 0,
                      child: ListView.separated(
                        itemBuilder:(context, index) {
                          if (index == 0) {
                            return Padding(
                              padding: const EdgeInsets.all(12),
                              child: Text(
                                '共 ${viewModel.apiResponse.data!.items.length} 筆',
                                style: TextStyle(
                                  color: LeezenColor.greyTextSubTitle.getTypeColor(),
                                  fontSize: 12
                                ),
                              ),
                            );
                          } else {
                            return Container(
                              color: Colors.white,
                              width: double.infinity,
                              child: OrderRecordListItemScreen(
                                item: viewModel.apiResponse.data!.items[index - 1], 
                                pressItem: pressItem
                              ),
                            );
                          }
                          
                        }, 
                        separatorBuilder:(context, index) {
                          if (index != 0) {
                            return const SizedBox(height: 12);
                          } else {
                            return const SizedBox();
                          }
                        }, 
                        itemCount: viewModel.apiResponse.data!.items.length + 1
                      ),
                    ),
                    Positioned(
                        child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [LeezenCustomUI.bottmShadow]),
                          child: TabBar(
                            indicatorSize: TabBarIndicatorSize.tab,
                            labelColor:
                                leezenColor[LeezenColor.primary001]!.color,
                            indicatorColor:
                                leezenColor[LeezenColor.primary001]!.color,
                            controller: _tabController,
                            tabs: const [
                              Tab(
                                text: '線上購買',
                              ),
                              Tab(
                                text: '門市消費',
                              )
                            ],
                          ),
                        ),
                        Container(
                          height: 72,
                          color: LeezenColor.bg004.getTypeColor(),
                          padding: const EdgeInsets.all(12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                  child: LeezenCustomUI().buildDropdownButton(
                                      value: '1個月內',
                                      hint: '1個月內',
                                      items: ['1個月內', '3個月內', '6個月內'],
                                      onChanged: (value) {})),
                              const SizedBox(
                                width: 8,
                              ),
                              Expanded(
                                  child: LeezenCustomUI().buildDropdownButton(
                                      value:
                                          '全部訂單狀態(${viewModel.apiResponse.data!.items.length})',
                                      hint:
                                          '全部訂單狀態(${viewModel.apiResponse.data!.items.length})',
                                      items: [
                                        '全部訂單狀態(${viewModel.apiResponse.data!.items.length})',
                                        '已付款',
                                        '未付款'
                                      ],
                                      onChanged: (value) {})),
                            ],
                          ),
                        )
                      ],
                    ))
                  ],
                );
              default:
                return Container();
            }
          }),
        ));
  }
}
