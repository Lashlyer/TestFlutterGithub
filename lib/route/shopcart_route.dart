
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping_list/models/shopcart/shopCartModel.dart';
import 'package:shopping_list/models/shopcartdelivery/shopcartdelivery.dart';
import 'package:shopping_list/widgets/ShopCartHome/shopCartHomeScreen.dart';
import 'package:shopping_list/widgets/shopCartList/ShopCartListScreen.dart';
import 'package:shopping_list/widgets/shopcartDelivery/shopcartdeliveryScreen.dart';

class ShopcartRouteName {
  static const String shopcartHome = 'shopcart_home';
  static const String shopcartList = 'shopcart_list';
  static const String shopcartDelivery = 'shopcart_delivery';
}

class ShopcartRouteObject {
  final String name;
  final ShopCartModel model;

  ShopcartRouteObject(this.model, this.name);
}


class ShopcartRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final ShopcartRouteObject object = settings.arguments as ShopcartRouteObject;

    switch (settings.name) {
      case ShopcartRouteName.shopcartHome:
        return MaterialPageRoute(
          builder: (BuildContext context) => const ShopCartHomeScreen());

      case ShopcartRouteName.shopcartList:

        return CupertinoPageRoute(builder: (context) => ShopCartListScreen(name: object.name));
      case ShopcartRouteName.shopcartDelivery:

        return CupertinoPageRoute(
          builder:(context) => ShopCartDeliveryScreen(model: ShopcartDeliveryModel.create(object.model)));
          
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text("No route is configured"),
            ),
          ),
        );
    }
  }
}