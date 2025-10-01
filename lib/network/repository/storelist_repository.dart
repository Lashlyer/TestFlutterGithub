import 'package:shopping_list/models/storelist/storeRegion.dart';
import 'package:shopping_list/models/storelist/storelist.dart';
import 'package:shopping_list/models/storelist/storelistmodel.dart';
import 'package:shopping_list/network/appUrls/app_urls.dart';
import 'package:shopping_list/network/base_api_service.dart';
import 'package:shopping_list/network/network_api_serivce.dart';

class StoreListRepository {

  final BaseApiService _apiService = NetworkApiServices();

  Future<Map<String, dynamic>> loadStoreListApi(Map body) async {
    try {
      final response = await _apiService.postApiResponse(
          AppUrls.storelistUrl, AppUrls.header, body);

      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> loadStoreRegionApi() async {
    try {
      final response = await _apiService.getApiResponse(
        AppUrls.storeRegionUrl, 
        AppUrls.header);

        return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<StoreListModel> fetchApi(Map body) async {

    final result = await Future.wait([loadStoreListApi(body), loadStoreRegionApi()]);

    final storelist = StoreList.fromJson(result[0]);

    final storeRegion = StoreRegion.fromJson(result[1]);

    return StoreListModel(list: storelist, regions: storeRegion);
  }
}
