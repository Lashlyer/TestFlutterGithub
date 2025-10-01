import 'package:flutter/cupertino.dart';
import 'package:shopping_list/models/productHome/productcategory.dart';
import 'package:shopping_list/network/repository/productcategorylist_repository.dart';
import 'package:shopping_list/network/response/api_response.dart';
import 'package:shopping_list/widgets/productlist/productlistscreen.dart';
import 'package:shopping_list/widgets/productlist/productlistviewmodel.dart';

class ProductCategoryListViewModel with ChangeNotifier {
  final ProductCategoryListRepository repository =
      ProductCategoryListRepository();

  ApiResponse<ProductCategory> apiResponse = ApiResponse.loading();

  final BuildContext context;

  ProductCategoryListViewModel({required this.context});

  void setResponse(ApiResponse<ProductCategory> response) {
    apiResponse = response;
    notifyListeners();
  }

  void fetchApi() async {
    apiResponse = ApiResponse.loading();

    repository.loadProductCategoryApi().then((value) {
      setResponse(ApiResponse.completed(value));
    }).onError((error, stackTrace) {
      setResponse(ApiResponse.error(error.toString()));
    });
  }

  void pressCategory(SubCategory category, List<SubCategory> subs) {
    Navigator.of(context).push(
        CupertinoPageRoute(builder: (context) => ProductListScreen(
          category: category, subcategories: subs,)));
  }
}
