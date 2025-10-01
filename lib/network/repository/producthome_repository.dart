

import 'package:shopping_list/models/productHome/productHome.dart';
import 'package:shopping_list/network/appUrls/app_urls.dart';
import 'package:shopping_list/network/base_api_service.dart';
import 'package:shopping_list/network/network_api_serivce.dart';

class ProdcutHomeRepository {

  final BaseApiService _apiService = NetworkApiServices();

  Future<ProdcutHome> loadProdcutHomeApi() async {

    try {
      final response = await _apiService.getApiResponse(
        AppUrls.prodcutHomeUrl, 
        AppUrls.header);

        return ProdcutHome.fromJson(response);
    } catch (e) {
      rethrow;
    }   
  }
}