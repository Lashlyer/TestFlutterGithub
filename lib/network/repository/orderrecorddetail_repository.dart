import 'package:shopping_list/models/orderhistory/orderrecorddetail/orderrecorddetail.dart';
import 'package:shopping_list/network/appUrls/app_urls.dart';
import 'package:shopping_list/network/base_api_service.dart';
import 'package:shopping_list/network/network_api_serivce.dart';

class OrderRecordDetailRepostitory {
  final BaseApiService _apiService = NetworkApiServices();

  Future<OrderRecordDetail> loadOrderRecordDetail(int id) async {
    try {
      final response = await _apiService.getApiResponse(
        '${AppUrls.orderRecordDetailUrl}$id', 
        AppUrls.header
      );
      return OrderRecordDetail.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
