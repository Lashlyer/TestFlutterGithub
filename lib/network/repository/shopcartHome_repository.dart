
import 'package:shopping_list/models/shopcart/shopCartHomeList.dart';
import 'package:shopping_list/network/appUrls/app_urls.dart';
import 'package:shopping_list/network/base_api_service.dart';
import 'package:shopping_list/network/network_api_serivce.dart';

class ShopCartHomeRepository {

  final BaseApiService _apiService = NetworkApiServices();

  Future<ShopCartHomeList> fetchShopCartHomeList() async {
    try {
      final response = await _apiService.getApiResponse(
        AppUrls.shopCartHomelistUrl, 
        AppUrls.header
      );
      return ShopCartHomeList.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}