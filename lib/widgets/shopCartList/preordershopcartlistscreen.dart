import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_list/data/categories.dart';
import 'package:shopping_list/network/response/api_response.dart';
import 'package:shopping_list/network/response/apistatus.dart';
import 'package:shopping_list/viewmodel/preordershopcartlist_viewmodle.dart';
import 'package:shopping_list/widgets/shopCartList/shopcartprojectitem.dart';
import 'package:shopping_list/widgets/shopCartList/stepProgressScreen.dart';

class PreorderShopcartListScreen extends StatefulWidget {
  const PreorderShopcartListScreen({super.key});

  @override
  State<PreorderShopcartListScreen> createState() =>
      _PreorderShopcartListScreenState();
}

class _PreorderShopcartListScreenState
    extends State<PreorderShopcartListScreen> {
  late PreorderShopcartListViewModel viewModel;

  @override
  void initState() {
    viewModel = PreorderShopcartListViewModel(context: context);
    viewModel.fetchProjectsApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(),
      body: ChangeNotifierProvider<PreorderShopcartListViewModel>(
        create: (context) => viewModel,
        child: Consumer<PreorderShopcartListViewModel>(
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
                if (viewModel.model() == null) {
                  return const Center(
                  child: CircularProgressIndicator(),
                ); 

                } else {
                  return SafeArea(
                  child: Stack(
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
                        bottom: 125,
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.all(20.0),
                                child: StepProgressIndicator(
                                  currentStep: 1,
                                  totalSteps: 3,
                                  stepTitles: ['確認購物籃', '配送付款資訊', '成立訂單'],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
                                child: Text(
                                  '請選擇要結帳的預購專案（一次只能結帳一個）：',
                                  style: TextStyle(
                                    color: LeezenColor.primary001.getTypeColor(),
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                              if (viewModel.model() != null)
                              for (var project in viewModel.model()!.projects.available)...[
                                ShopcartProjectItem(
                                  project: project, 
                                  isSelected: false, 
                                  pressItem: viewModel.pressItem
                                ),
                                const SizedBox(height: 24)
                              ]
                            ],
                          ),
                        ),
                      ),

                      // Positioned(
                      //   left: 0,
                      //   right: 0,
                      //   bottom: 0,
                      //   height: 125,
                      //   child: ShopCartBottomBarScreen(
                      //     shopCart: viewModel.apiResponse.data!,
                      //     pressNext: viewModel.pressNext,
                      //     pressFullsites: viewModel.pressFullsites,)
                      // )
                    ],
                  ),
                );
                }
                
              default:
                return Container();
            }
          },
        ),
      ),
    );
  }
}
