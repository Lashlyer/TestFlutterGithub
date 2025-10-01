

import 'package:flutter/cupertino.dart';
import 'package:shopping_list/models/shopcart/shopCartModel.dart';
import 'package:shopping_list/models/shopcart/shopCartPersent.dart';
import 'package:shopping_list/models/shopcartdelivery/shopcartdelivery.dart';
import 'package:shopping_list/network/repository/shopcartlist_repository.dart';
import 'package:shopping_list/network/response/api_response.dart';
import 'package:shopping_list/widgets/shopCartList/bonusListScreen.dart';
import 'package:shopping_list/widgets/shopCartList/fullsitecouponScreen.dart';
import 'package:shopping_list/widgets/shopcartDelivery/shopcartdeliveryScreen.dart';

class ShopCartListViewModel extends ChangeNotifier {

  final ShopCartListRepository repository = ShopCartListRepository();

  final BuildContext context;

  late ShopCartModel model;

  ApiResponse<ShopCartModel> apiResponse = ApiResponse.loading();

  ShopCartListViewModel({required this.context});

  setShopCartModel(ApiResponse<ShopCartModel> response) {
    apiResponse = response;

    if (response.data != null) {
      model = response.data!;
    }

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

  void pressBonus(List<Present> presents) {
    Navigator.of(context).push(CupertinoPageRoute(
      builder: (context) => BonusListScreen(presents: presents),
    ));
  }

  void pressNext() {
    Navigator.of(context).push(CupertinoPageRoute(
      builder: (ctx) => ShopCartDeliveryScreen(model: ShopcartDeliveryModel.create(apiResponse.data!))));
  }

  void pressFullsites() async {
    final result = await Navigator.of(context).push(
      CupertinoPageRoute(builder:(context) => 
      FullSiteCouponScreen(fullsitecoupons: model.fullSiteCoupon)));
    
    if (result != null) {
      print('object');
      notifyListeners();
    }
  }
}