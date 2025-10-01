

import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:shopping_list/models/PromoSaleMulty/promosalemultimodel.dart';
import 'package:shopping_list/network/repository/salepromopreiodlist_repository.dart';
import 'package:shopping_list/network/response/api_response.dart';

enum SalePromoPreiodType { promotion, topic }

class SalePromoPreiodListViewmodel with ChangeNotifier {
  final SalePromoPreiodListRepository repository = SalePromoPreiodListRepository();


  ApiResponse<PromoSaleMultiModel> apiResponse = ApiResponse.loading();

  setSalePromoPreiodList(ApiResponse<PromoSaleMultiModel> response) {
    apiResponse = response;
    notifyListeners();
  }

  void fetchSalePromoPreiodListApi(String id, SalePromoPreiodType type) async {
    setSalePromoPreiodList(ApiResponse.loading());

    repository.loadOrderRecordDetail(id, type).then((data) => {

      setSalePromoPreiodList(ApiResponse.completed(data))

    }).onError((error, stackTrace) => {

      setSalePromoPreiodList(ApiResponse.error(error.toString()))
    });
  }
}