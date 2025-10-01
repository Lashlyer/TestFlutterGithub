



import 'package:shopping_list/models/shopcart/preordershopcartmodel.dart';
import 'package:shopping_list/models/shopcart/shopcartprojects.dart';
import 'package:shopping_list/network/appUrls/app_urls.dart';
import 'package:shopping_list/network/base_api_service.dart';
import 'package:shopping_list/network/network_api_serivce.dart';

class PreorderShopcartListRepository {

  final BaseApiService _apiService = NetworkApiServices();

  Future<PreorderShopcartModel> loadShopCartProject() async {
    try {
      final response = await _apiService.getApiResponse(
          AppUrls.shopcartprojectUrl, 
          AppUrls.header);
      PreorderShopcartModel model = PreorderShopcartModel(projects: ShopcartListProject.fromJson(response));
      print(model);
      return model;
    } catch (e) {
      print('errro');
      rethrow;
    }
  }
}