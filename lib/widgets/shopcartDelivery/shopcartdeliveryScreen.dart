import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_list/models/shopcartdelivery/shopcartdelivery.dart';
import 'package:shopping_list/viewmodel/shopcartdelivery_viewmodel.dart';
import 'package:shopping_list/widgets/shopCartList/stepProgressScreen.dart';
import 'package:shopping_list/widgets/shopcartDelivery/buyerItem.dart';
import 'package:shopping_list/widgets/shopcartDelivery/deliveryInfomation.dart';
import 'package:shopping_list/widgets/shopcartDelivery/deliverySummaryScreen.dart';
import 'package:shopping_list/widgets/shopcartDelivery/invoiceItem.dart';
import 'package:shopping_list/widgets/shopcartDelivery/ordernotescreen.dart';
import 'package:shopping_list/widgets/shopcartDelivery/ordershipmethoditem.dart';
import 'package:shopping_list/widgets/shopcartDelivery/paymentmethodScreen.dart';
import 'package:shopping_list/widgets/shopcartDelivery/shopcartcheckoutbottombar.dart';

class ShopCartDeliveryScreen extends StatefulWidget {
  final ShopcartDeliveryModel model;

  const ShopCartDeliveryScreen({super.key, required this.model});

  @override
  State<ShopCartDeliveryScreen> createState() => _ShopCartDeliveryScreenState();
}

class _ShopCartDeliveryScreenState extends State<ShopCartDeliveryScreen> {
  late ShopcartDeliveryViewmodel viewModel;

  @override
  void initState() {
    viewModel = ShopcartDeliveryViewmodel(model: widget.model);

    super.initState();
  }


  void pressChekOut() {
    viewModel.pressNext(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ChangeNotifierProvider(
        create: (context) => viewModel,
        child: Consumer<ShopcartDeliveryViewmodel>(
          builder: (context, value, child) {
            return Stack(
              children: [
                Positioned.fill(
                    child: Image.asset(
                  'assets/splash_bg.png',
                  fit: BoxFit.cover,
                )),

                Positioned(
                      left: 0,
                      right: 0,
                      top: 0,
                      bottom: 76,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(20.0),
                              child: StepProgressIndicator(
                                currentStep: 2, 
                                totalSteps: 3, 
                                stepTitles: ['確認購物籃', '配送付款資訊', '成立訂單'],
                              ),                           
                            ),    
                                             
                            for(var order in widget.model.shopcart.orders)
                            OrderShipmethodItem(order: order),

                            const SizedBox(height: 12,),

                            BuyerItem(buyer: widget.model.buyer),

                            const SizedBox(height: 12,),

                            InvoiceItem(),

                            const SizedBox(height: 12,),

                            PaymentMethodScreen(),

                            const SizedBox(height: 12,),

                            OrderNoteScreen(),

                            const SizedBox(height: 12,),

                            DeliverySummaryScreen(model: widget.model),

                            const SizedBox(height: 12,),

                            DeliveryInfomation()
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      left: 0,
                      right: 0,
                      bottom: 0,
                      height: 76,
                      child: ShopCartCheckOutBottomBarScreen(model: viewModel.model, pressChekOut: pressChekOut)
                    )
              ],
            );
          },
        ),
      ),
    );
  }
}
