
import 'package:flutter/material.dart';
import 'package:shopping_list/models/productHome/productHome.dart';
import 'package:shopping_list/models/productHome/productcategory.dart';
import 'package:shopping_list/network/repository/productlist_repository.dart';
import 'package:shopping_list/network/response/api_response.dart';

enum ProductListType { card, list }

class ProductListViewModel with ChangeNotifier {
  ProductListType listType = ProductListType.card;

  SubCategory? category;

  final List<SubCategory> subcategories;

  final ProductListRepository _repository = ProductListRepository();

  final List<ProductItem> _products = [];

  List<ProductItem> get products => _products;

  late Map _body;

  bool get isLoading => _isLoading;

  bool get hasMoreData => _repository.limit != 0;

  bool _isLoading = false;

  ApiResponse<List<ProductItem>> apiResponse = ApiResponse.loading();

  ProductListViewModel({required this.category, required this.subcategories});

  void configure() {
    if (category == null) {
      _body = {
        "offset": 0,
        "limit": 10,
        "sort": 0,
        "category": 0,
        "filters": {"temperatures": [], "channels": [], "veges": []},
        "keyword": ''
      };
    } else {
      _body = {
        "offset": 0,
        "limit": 10,
        "sort": 0,
        "category": category!.id,
        "filters": {"temperatures": [], "channels": [], "veges": []},
        "keyword": ''
      };
    }

    fetchApi(_body);
  }
  
  void loadMoreProducts() {
    _isLoading = true;
    notifyListeners();
  }

  void pressTag(SubCategory sub) {
    category = sub;
    _body['category'] = sub.id;

    fetchApi(_body);
  }

  void setResponse(ApiResponse<List<ProductItem>> response) {
    apiResponse = response;
    _products.addAll(response.data ?? []);
    notifyListeners();
  }

  void pressTypeChange() {
    if (listType == ProductListType.card) {
      listType = ProductListType.list;
    } else {
      listType = ProductListType.card;
    }

    notifyListeners();
  }

  void loadMore(Map body) async {

    _repository.loadProductListApi(body).then((value) {

    }).onError((error, stackTrace) {
      setResponse(ApiResponse.error(error.toString()));
    });
  }

  void fetchApi(Map body) async {
    setResponse(ApiResponse.loading());

    _repository.loadProductListApi(body).then((value) {
      setResponse(ApiResponse.completed(value));
    }).onError((error, stackTrace) {
      setResponse(ApiResponse.error(error.toString()));
    });
  }
}
