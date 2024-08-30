
import 'package:flutter/cupertino.dart';
import 'package:shopping_list/models/shopcartdelivery/shopcartdelivery.dart';

class ShopcartDeliveryViewmodel with ChangeNotifier {

  ShopcartDeliveryModel model;

  ShopcartDeliveryViewmodel({required this.model});

  factory ShopcartDeliveryViewmodel.create(ShopcartDeliveryModel model) {
    return ShopcartDeliveryViewmodel(model: model);
  }
}