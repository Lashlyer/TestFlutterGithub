
import 'package:shopping_list/models/shopcart/shopCartModel.dart';
import 'package:shopping_list/network/appUrls/app_urls.dart';
import 'package:shopping_list/network/base_api_service.dart';
import 'package:shopping_list/network/network_api_serivce.dart';

class ShopCartListRepository {

  final BaseApiService _apiService = NetworkApiServices();

  Future<Map<String, dynamic>> loadSetting() async {
    try {
      final response = await _apiService.getApiResponse(
        AppUrls.shopCartSetUrl, 
        AppUrls.header);

        return response;
  
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> loadShopCart() async {
    try {
      final response = await _apiService.getApiResponse(
          AppUrls.normalShopCartlistUrl, AppUrls.header);

      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> changeQuantityApi(int id, int quantity) async {
    
    Map body = {
      'id': id,
      'quantity': quantity
    };

    try {
      final response = await _apiService.postApiResponse(
        AppUrls.shopCartChangeQuantityUrl, 
        AppUrls.header, 
        body);

        return response;
    } catch (e) {
      rethrow;
    }   
  }

  Future<ShopCartModel> changeQuantityEvent(int id, int quantity) async {

    final results = await Future.wait([changeQuantityApi(id, quantity), loadSetting()]);

    final cart = results[0];
    final set = results[1];

    return ShopCartModel.create(cart, set);
  } 

  Future<ShopCartModel> loadShopCartApi() async {
    final results = await Future.wait([loadShopCart(), loadSetting()]);

    final cartEntity = results[0];
    final setEntity = results[1];

    return ShopCartModel.create(cartEntity, setEntity);
  }
}
