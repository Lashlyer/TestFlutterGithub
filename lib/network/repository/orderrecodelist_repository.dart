
import 'package:shopping_list/models/orderhistory/orderlist.dart';
import 'package:shopping_list/network/appUrls/app_urls.dart';
import 'package:shopping_list/network/base_api_service.dart';
import 'package:shopping_list/network/network_api_serivce.dart';

class OrderRecodeListRepository {

  final BaseApiService _apiService = NetworkApiServices();

  Future<OrderList> loadOrderRecordApi() async {
    
    Map body = {
    "offset": 0,
    "limit": 10,
    "range": 0,
    "status": 0
    };

    try {
      final response = await _apiService.postApiResponse(
        AppUrls.orderRecordListUrl, 
        AppUrls.header, 
        body);

        return OrderList.fromJson(response);
    } catch (e) {
      rethrow;
    }   
  }
}