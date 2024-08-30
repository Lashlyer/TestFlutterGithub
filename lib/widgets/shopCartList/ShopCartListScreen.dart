
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_list/network/response/apistatus.dart';
import 'package:shopping_list/viewmodel/shopcartlist_viewmodel.dart';
import 'package:shopping_list/widgets/shopCartList/bounsSreen.dart';
import 'package:shopping_list/widgets/shopCartList/commodityScreen.dart';
import 'package:shopping_list/widgets/shopCartList/orderSummaryScreen.dart';
import 'package:shopping_list/widgets/shopCartList/shopCartBottomBar.dart';
import 'package:shopping_list/widgets/shopCartList/stepProgressScreen.dart';

class ShopCartListScreen extends StatefulWidget {
  const ShopCartListScreen({super.key, required this.name});

  final String name;

  @override
  State<ShopCartListScreen> createState() => _ShopCartListScreenState();
}

class _ShopCartListScreenState extends State<ShopCartListScreen> {

  ShopCartListViewModel viewModel = ShopCartListViewModel();

  void changeQuantity(int id, int quantity) {
    viewModel.changeQuantityEvent(id, quantity);
  }

  void pressNext() {
    viewModel.pressNext(context);
  }

  @override
  void initState() {
    viewModel.fetchShopCartApi();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.name),
        ),
        body: ChangeNotifierProvider<ShopCartListViewModel>(
          create: (context) => viewModel,
          child:
              Consumer<ShopCartListViewModel>(builder: (context, value, child) {
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
                    Positioned.fill(
                      child: Image.asset(
                        'assets/splash_bg.png',
                        fit: BoxFit.cover,
                      )
                    ),
                    Positioned(
                      left: 0,
                      right: 0,
                      top: 0,
                      bottom: 125,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(20.0),
                              child: StepProgressIndicator(
                                currentStep: 1, 
                                totalSteps: 3, 
                                stepTitles: ['確認購物籃', '配送付款資訊', '成立訂單'],
                              ),                           
                            ),
                            for(var order in viewModel.apiResponse.data!.orders)
                            CommodityScreen(order: order, changeQuantity: changeQuantity),
                            BounsSreen(presents: viewModel.apiResponse.data!.presents),
                            const SizedBox(height: 12,),
                            OrderSummaryScreen(shopcart: viewModel.apiResponse.data!),
                      
                            const SizedBox(height: 20,)
                          ],
                        ),
                      ),
                    ),

                    Positioned(
                      left: 0,
                      right: 0,
                      bottom: 0,
                      height: 125,
                      child: ShopCartBottomBarScreen(shopCart: viewModel.apiResponse.data!, pressNext: pressNext)
                    )
                  ],
                );
              default:
                return Container();
            }
          }
        )));
  }
}

