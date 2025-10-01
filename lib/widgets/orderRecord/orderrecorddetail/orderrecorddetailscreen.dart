import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_list/data/categories.dart';
import 'package:shopping_list/network/appUrls/app_urls.dart';
import 'package:shopping_list/network/response/apistatus.dart';
import 'package:shopping_list/widgets/orderRecord/orderrecorddetail/orderrecorddetailbuyerscreen.dart';
import 'package:shopping_list/widgets/orderRecord/orderrecorddetail/orderrecorddetailinfoscreen.dart';
import 'package:shopping_list/widgets/orderRecord/orderrecorddetail/orderrecorddetailinvoicescreen.dart';
import 'package:shopping_list/widgets/orderRecord/orderrecorddetail/orderrecordlistscreen.dart';
import 'package:shopping_list/widgets/orderRecord/orderrecorddetail/orderrecordsummaryscreen.dart';
import 'package:shopping_list/widgets/orderRecord/orderrecorddetail/viewmodel/orderrecorddetailviewmodel.dart';

class OrderRecordDetailScreen extends StatefulWidget {
  final int id;

  const OrderRecordDetailScreen({super.key, required this.id});

  @override
  State<OrderRecordDetailScreen> createState() =>
      _OrderRecordDetailScreenState();
}

class _OrderRecordDetailScreenState extends State<OrderRecordDetailScreen> with SingleTickerProviderStateMixin {
  late OrderRecordDetailViewModel viewModel;
  late TabController _tabController;

  @override
  void initState() {
    print(widget.id);
    _tabController = TabController(length: 3, vsync: this);
    viewModel = OrderRecordDetailViewModel(id: widget.id, context: context);
    viewModel.fetchOrderRecordDetail();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: ChangeNotifierProvider<OrderRecordDetailViewModel>(
          create: (context) => viewModel,
          child: Consumer<OrderRecordDetailViewModel>(
            builder: (context, value, child) {
              switch (value.apiRresponse.status) {
                case ApiStatus.loading:
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                case ApiStatus.completed:
                  return Stack(
                    children: [
                      Positioned.fill(child: LeezenCustomUI.backgroundImage),
                      Positioned.fill(
                          child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            OrderRecordDetailinfoScreen(
                                model: viewModel.apiRresponse.data!),
                            const SizedBox(height: 12),
                            OrderRecordDetailListScreen(
                                model: viewModel.apiRresponse.data!,
                                pressItem: viewModel.pressSuborder,),
                            const SizedBox(height: 12),
                            Container(
                              width: double.infinity,
                              height: 44,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [LeezenCustomUI.bottmShadow]),
                              child: TabBar(
                                onTap: (value) {
                                  viewModel.selectOrderInformaition(value);
                                },
                                dividerColor: LeezenColor.charcoal_15.getTypeColor(),
                                indicatorSize: TabBarIndicatorSize.tab,
                                labelColor:
                                    LeezenColor.primary001.getTypeColor(),
                                indicatorColor:
                                    LeezenColor.primary001.getTypeColor(),
                                
                                controller: _tabController,
                                tabs: const [
                                  Tab(
                                    text: '訂單摘要',
                                  ),
                                  Tab(
                                    text: '訂購人資訊',
                                  ),
                                  Tab(
                                    text: '發票資訊',
                                  )
                                ],
                              ),
                            ),
                            if (viewModel.orderInformationIndex == 0)
                            OrderRecordSummaryScreen(model: value.apiRresponse.data!),

                            if (viewModel.orderInformationIndex == 1)
                            OrderRecordDetailBuyerScreen(model: viewModel.apiRresponse.data!),

                            if (viewModel.orderInformationIndex == 2)
                            OrderRecordDetailInvoiceScreen(model: viewModel.apiRresponse.data!),

                            const SizedBox(height: 24,),

                            Padding(
                              padding: const EdgeInsets.only(left: 12, right: 12),
                              child: Text(
                                '重要提醒',
                                style: TextStyle(
                                  color: LeezenColor.primary001.getTypeColor(),
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                            ),

                            const SizedBox(height: 4,),

                            Padding(
                              padding: const EdgeInsets.only(left: 12, right: 12),
                              child: Text(
                                maxLines: 10,
                                '我們不會主動要求你更改任何付款方式或操作 ATM。\n天天里仁提醒你，接到「+」開頭顯示的電話號碼、且自稱為天天里仁客服者，無論其號碼顯示為何，都是詐騙電話，你可撥打 02-27132829 與我們查證，保障你的權益。',
                                style: TextStyle(
                                  color: LeezenColor.greyTextSubTitle.getTypeColor(),
                                  fontSize: 12
                                ),
                              ),
                            )

                          ],
                        ),
                      ))
                    ],
                  );
                case ApiStatus.error:
                  return Center(
                    child: Text(value.apiRresponse.message.toString()),
                  );
                default:
                  return Container(
                    color: Colors.black,
                  );
              }
            },
          ),
        ));
  }
}
