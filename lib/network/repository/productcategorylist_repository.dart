import 'package:shopping_list/models/productHome/productcategory.dart';
import 'package:shopping_list/network/appUrls/app_urls.dart';
import 'package:shopping_list/network/base_api_service.dart';
import 'package:shopping_list/network/network_api_serivce.dart';

class ProductCategoryListRepository {
  final BaseApiService _apiService = NetworkApiServices();

  Future<ProductCategory> loadProductCategoryApi() async {
    try {
      final response = await _apiService.getApiResponse(
          AppUrls.productCategoryUrl, AppUrls.header);

      return ProductCategory.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
