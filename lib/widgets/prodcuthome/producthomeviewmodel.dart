


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping_list/models/productHome/productHome.dart';
import 'package:shopping_list/network/repository/producthome_repository.dart';
import 'package:shopping_list/network/response/api_response.dart';
import 'package:shopping_list/widgets/prodcuthome/productcategorylistscreen.dart';
import 'package:shopping_list/widgets/salepromoperoid/salepromopreiodlistscreen.dart';
import 'package:shopping_list/widgets/salepromoperoid/salepromopreiodlistviewmodel.dart';

class ProductHomeViewModel with ChangeNotifier {

  final ProdcutHomeRepository repository = ProdcutHomeRepository();

  final BuildContext context;

  ApiResponse<ProdcutHome> apiResponse = ApiResponse.loading();

  ProductHomeViewModel({required this.context});


  void setProductHome(ApiResponse<ProdcutHome> response) {
    apiResponse = response;
    notifyListeners();
  }

  void pressPromotion(String id) {
    Navigator.of(context).push(CupertinoPageRoute(
      builder: (context) => SalePromoPreiodListScreen(id: id, type: SalePromoPreiodType.promotion,)));
  }

  void pressTopics(String id) {
    Navigator.of(context).push(CupertinoPageRoute(
      builder: (context) => SalePromoPreiodListScreen(id: id, type: SalePromoPreiodType.topic,)));
  }

  void pressSeemore() {
        Navigator.of(context).push(CupertinoPageRoute(
      builder: (context) => ProductCategoryListScreen()));

  }

  void fetchApi() async {

    setProductHome(ApiResponse.loading());

    repository.loadProdcutHomeApi().then((data) {

      setProductHome(ApiResponse.completed(data));

    }).onError((error, stackTrace) {

      setProductHome(ApiResponse.error(error.toString()));

    });
  }
}