
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:shopping_list/models/shopcart/shopCartHomeGroup.dart';
import 'package:shopping_list/network/response/apistatus.dart';
import 'package:shopping_list/viewmodel/shopcart_home_viewmodel.dart';
import 'package:shopping_list/widgets/ShopCartHome/headerSection.dart';
import 'package:shopping_list/widgets/ShopCartHome/shopCartOnlineBasket.dart';

import 'package:shopping_list/widgets/shopCartList/ShopCartListScreen.dart';

class ShopCartHomeScreen extends StatefulWidget {
  const ShopCartHomeScreen({super.key});

  @override
  State<ShopCartHomeScreen> createState() => _ShopCartHomeScreenState();
}

class _ShopCartHomeScreenState extends State<ShopCartHomeScreen> {
  ShopcartHomeViewModel viewModel = ShopcartHomeViewModel();

  @override
  void initState() {
    viewModel.fetchShopcartGroupApi();
    super.initState();
  }

  void _pressShopCartItem(ShopCartHomeGroup item) {
    Navigator.of(context).push<ShopCartHomeGroup>(CupertinoPageRoute(
        builder: (ctx) => ShopCartListScreen(name: item.name)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('我的購物籃'),
        ),
        body: ChangeNotifierProvider<ShopcartHomeViewModel>(
          create: (context) => viewModel,
          child:
              Consumer<ShopcartHomeViewModel>(builder: (context, value, child) {
            switch (value.shopcartGroup.status) {
              case ApiStatus.loading:
                return const Center(
                  child: CircularProgressIndicator(),
                );
              case ApiStatus.error:
                return Center(
                  child: Text(
                    value.shopcartGroup.message.toString(),
                  ),
                );
              case ApiStatus.completed:
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const HeaderSection(),
                      const SizedBox(height: 8),
                      ShopCartOnlineBasket(
                          datas: value.shopcartGroup.data!, pressItem: _pressShopCartItem)
                    ],
                  ),
                );
              default:
                return Container();
            }
          }
        ),
      )
    );
  }
}
