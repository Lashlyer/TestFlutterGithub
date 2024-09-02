import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_list/models/home/shopcartorderEstablished/orderestablishedModel.dart';
import 'package:shopping_list/viewmodel/shopcart_orderestablish_viewmodel.dart';
import 'package:shopping_list/widgets/shopCartList/stepProgressScreen.dart';
import 'package:shopping_list/widgets/shopcartOrderEstablish/OrderEstablishedOperatorScreen.dart';
import 'package:shopping_list/widgets/shopcartOrderEstablish/orderestablishedInformationscreen.dart';
import 'package:shopping_list/widgets/shopcartOrderEstablish/orderestablishedListScreen.dart';
import 'package:shopping_list/widgets/shopcartOrderEstablish/orderestablisheddetailscreen.dart';

class OrderEstablishedScreen extends StatefulWidget {
  final ShopcartOrderEstablished model;

  const OrderEstablishedScreen({super.key, required this.model});

  @override
  State<OrderEstablishedScreen> createState() => _OrderEstablishedScreenState();
}

class _OrderEstablishedScreenState extends State<OrderEstablishedScreen> {
  late ShopcartOrderEstablishedViewModel viewModel;

  @override
  void initState() {
    viewModel = ShopcartOrderEstablishedViewModel(model: widget.model);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ChangeNotifierProvider(
        create: (context) => viewModel,
        child: Consumer<ShopcartOrderEstablishedViewModel>(
          builder: (context, value, child) {
            return Stack(
              children: [
                Positioned.fill(
                    child: Image.asset(
                  'assets/splash_bg.png',
                  fit: BoxFit.cover,
                )),
                Positioned.fill(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(20.0),
                          child: StepProgressIndicator(
                            currentStep: 3,
                            totalSteps: 3,
                            stepTitles: ['確認購物籃', '配送付款資訊', '成立訂單'],
                          ),
                        ),

                        OrderEstablishedDetailScreen(model: viewModel.model),

                        const SizedBox(height: 24),

                        OrderEstablishedDetailListScreen(model: viewModel.model),

                        const SizedBox(height: 24),
                        
                        OrderEstablishedOperatorScreen(),

                        const SizedBox(height: 24),

                        OrderestablishedDetailInformationScreen(),

                        const SizedBox(height: 24),
                      ],
                    ),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
