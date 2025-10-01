
import 'package:shopping_list/models/storeDetail/storeDetail.dart';
import 'package:shopping_list/network/appUrls/app_urls.dart';
import 'package:shopping_list/network/base_api_service.dart';
import 'package:shopping_list/network/network_api_serivce.dart';

class StoreDetailRepository {

  final BaseApiService _apiService = NetworkApiServices();

  Future<StoreDetail> loadStoreDetailApi(String no) async {
    try {
      final response = await _apiService.getApiResponse(
          '${AppUrls.storeDetailUrl}$no', AppUrls.header);

      return StoreDetail.fromJson(response['detail']);
    } catch (e) {
      rethrow;
    }
  }
}