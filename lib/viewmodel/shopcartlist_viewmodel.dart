

import 'package:flutter/cupertino.dart';
import 'package:shopping_list/models/shopcart/shopCartModel.dart';
import 'package:shopping_list/models/shopcartdelivery/shopcartdelivery.dart';
import 'package:shopping_list/network/repository/shopcartlist_repository.dart';
import 'package:shopping_list/network/response/api_response.dart';
import 'package:shopping_list/widgets/ShopCartHome/shopCartHomeScreen.dart';
import 'package:shopping_list/widgets/shopcartDelivery/shopcartdeliveryScreen.dart';

class ShopCartListViewModel extends ChangeNotifier {

  final ShopCartListRepository repository = ShopCartListRepository();

  ApiResponse<ShopCartModel> apiResponse = ApiResponse.loading();

  setShopCartModel(ApiResponse<ShopCartModel> response) {
    apiResponse = response;
    notifyListeners();
  }

  void fetchShopCartApi() async {

    setShopCartModel(ApiResponse.loading());

    repository.loadShopCartApi().then((data) => {

      setShopCartModel(ApiResponse.completed(data))

    }).onError((error, stackTrace) => {

      setShopCartModel(ApiResponse.error(error.toString()))
    });
  }

  void changeQuantityEvent(int id, int quantity) {
    setShopCartModel(ApiResponse.loading());

    repository.changeQuantityEvent(id, quantity).then((value) => {
      setShopCartModel(ApiResponse.completed(value))
    }).onError((error, stackTrace) => {
      
      setShopCartModel(ApiResponse.error(error.toString()))
    });
  }

  void pressNext(BuildContext context) {
    Navigator.of(context).push(CupertinoPageRoute(
      builder: (ctx) => ShopCartDeliveryScreen(model: ShopcartDeliveryModel.create(apiResponse.data!))));
  }
}