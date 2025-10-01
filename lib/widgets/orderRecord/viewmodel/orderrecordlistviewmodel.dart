

import 'package:flutter/cupertino.dart';
import 'package:shopping_list/models/orderhistory/orderlist.dart';
import 'package:shopping_list/network/repository/orderrecodelist_repository.dart';
import 'package:shopping_list/network/response/api_response.dart';
import 'package:shopping_list/widgets/orderRecord/orderrecorddetail/orderrecorddetailscreen.dart';

class OrderRecordListViewModel with ChangeNotifier {
  
  final OrderRecodeListRepository repository = OrderRecodeListRepository();

  ApiResponse<OrderList> apiResponse = ApiResponse.loading();

  setOrderRecordList(ApiResponse<OrderList> response) {
    apiResponse = response;
    notifyListeners();
  }

  void fetchOrderRecordListApi() async {

    setOrderRecordList(ApiResponse.loading());

    repository.loadOrderRecordApi().then((data) => {

      setOrderRecordList(ApiResponse.completed(data))

    }).onError((error, stackTrace) => {

      setOrderRecordList(ApiResponse.error(error.toString()))
    });
  }

  void pressItem(BuildContext context, int id) {
    Navigator.of(context).push(CupertinoPageRoute(
      builder: (context) => OrderRecordDetailScreen(id: id)));
  }
}