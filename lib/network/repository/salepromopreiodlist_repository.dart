


import 'package:shopping_list/models/PromoSaleMulty/promosalemultimodel.dart';
import 'package:shopping_list/network/appUrls/app_urls.dart';
import 'package:shopping_list/network/base_api_service.dart';
import 'package:shopping_list/network/network_api_serivce.dart';
import 'package:shopping_list/widgets/salepromoperoid/salepromopreiodlistviewmodel.dart';

class SalePromoPreiodListRepository {
  
  final BaseApiService _apiService = NetworkApiServices();

    Future<PromoSaleMultiModel> loadOrderRecordDetail(String id, SalePromoPreiodType type) async {
      String url;
      print(id);
      switch (type) {
        case SalePromoPreiodType.promotion:
          url = '${AppUrls.salePromoPreiodUrl}$id';
        case SalePromoPreiodType.topic:
          url = '${AppUrls.saleTopicUrl}$id';
      }

    try {
      final response = await _apiService.getApiResponse(
        url, 
        AppUrls.header
      );
      return PromoSaleMultiModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

}