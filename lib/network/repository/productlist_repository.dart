import 'package:shopping_list/models/productHome/productHome.dart';
import 'package:shopping_list/network/appUrls/app_urls.dart';
import 'package:shopping_list/network/base_api_service.dart';
import 'package:shopping_list/network/network_api_serivce.dart';

class ProductListRepository {

  final BaseApiService _apiService = NetworkApiServices();

  late int limit;

  Future<List<ProductItem>> loadProductListApi(Map body) async {
    try {
      final response = await _apiService.postApiResponse(
          AppUrls.productListUrl, AppUrls.header, body);

      limit = response['next'];

      return List<ProductItem>.from(response["rows"].map((x) => ProductItem.fromJson(x)));
    } catch (e) {
      rethrow;
    }
  }
}
