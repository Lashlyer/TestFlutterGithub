
import 'package:flutter/cupertino.dart';
import 'package:shopping_list/models/home/shopcartorderEstablished/orderestablishedModel.dart';
import 'package:shopping_list/models/shopcartdelivery/shopcartdelivery.dart';
import 'package:shopping_list/widgets/shopcartOrderEstablish/orderestablishScreen.dart';

class ShopcartDeliveryViewmodel with ChangeNotifier {

  ShopcartDeliveryModel model;

  ShopcartDeliveryViewmodel({required this.model});

  factory ShopcartDeliveryViewmodel.create(ShopcartDeliveryModel model) {
    return ShopcartDeliveryViewmodel(model: model);
  }

  void pressNext(BuildContext context) {
    Navigator.of(context).push(CupertinoPageRoute(
      builder: (ctx) => OrderEstablishedScreen(model: ShopcartOrderEstablished.mockup())));    
  }
}