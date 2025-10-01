

import 'package:flutter/material.dart';
import 'package:shopping_list/models/shopcart/preordershopcartmodel.dart';
import 'package:shopping_list/models/shopcart/shopCartModel.dart';
import 'package:shopping_list/models/shopcart/shopcartprojects.dart';
import 'package:shopping_list/network/repository/preordershopcartlist_repository.dart';
import 'package:shopping_list/network/response/api_response.dart';

class PreorderShopcartListViewModel extends ChangeNotifier {

  final PreorderShopcartListRepository repository = PreorderShopcartListRepository();

  final BuildContext context;

  late PreorderShopcartModel? _model;

  PreorderShopcartModel? model() {
    if (_model != null) {
      return  _model!;
    } else {
      return null;
    }
  }

  ApiResponse<PreorderShopcartModel> apiResponse = ApiResponse.loading();

  PreorderShopcartListViewModel({required this.context});

  void fetchProjectsApi() async {

    setModel(ApiResponse.loading());

    repository.loadShopCartProject().then((data) => {
      setModel(ApiResponse.completed(data))

    }).onError((error, stackTrace) => {
      setModel(ApiResponse.error(error.toString()))
    });
    
  }

  void pressItem(ShopcartProject project) {
    print('pressitem');
    _model!.selectedProject = project;
    notifyListeners();
  }

  setModel(ApiResponse<PreorderShopcartModel> response) {
    apiResponse = response;

    if (response.data != null) {
      _model = response.data!;
    }

    notifyListeners();
  }
  
}