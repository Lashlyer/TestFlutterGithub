import 'package:flutter/material.dart';
import 'package:shopping_list/models/storeDetail/storeDetail.dart';
import 'package:shopping_list/network/repository/storedetail_repository.dart';
import 'package:shopping_list/network/response/api_response.dart';

class StoreDetailViewModel with ChangeNotifier {
  final StoreDetailRepository repository = StoreDetailRepository();

  ApiResponse<StoreDetail> apiResponse = ApiResponse.loading();

  final String no;

  StoreDetailViewModel({required this.no});

  setStroeDetailModel(ApiResponse<StoreDetail> response) {
    apiResponse = response;

    notifyListeners();
  }

  void fetchApi() async {
    setStroeDetailModel(ApiResponse.loading());

    repository.loadStoreDetailApi(no).then((data) {
      setStroeDetailModel(ApiResponse.completed(data));
    }).onError((error, stackTrace) {
      setStroeDetailModel(ApiResponse.error(error.toString()));
    });
  }
}
