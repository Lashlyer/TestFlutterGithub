

import 'package:flutter/cupertino.dart';
import 'package:shopping_list/models/shopcart/shopCartHomeList.dart';
import 'package:shopping_list/network/repository/shopcartHome_repository.dart';
import 'package:shopping_list/network/response/api_response.dart';

class ShopcartHomeViewModel extends ChangeNotifier {
  final _shopcartHomeRepository = ShopCartHomeRepository();

  ApiResponse<ShopCartHomeList> shopcartGroup = ApiResponse.loading();

  setShopcartGroup(ApiResponse<ShopCartHomeList> response) {
    shopcartGroup = response;
    notifyListeners();
  }

  void fetchShopcartGroupApi() async {
    setShopcartGroup(ApiResponse.loading());

    _shopcartHomeRepository.fetchShopCartHomeList().then((data) {
      setShopcartGroup(ApiResponse.completed(data));

    }).onError((error, stackTrace) {
      setShopcartGroup(ApiResponse.error(error.toString()));
    });
  }
}