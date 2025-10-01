import 'package:flutter/cupertino.dart';
import 'package:shopping_list/models/orderhistory/orderrecorddetail/orderrecorddetail.dart';
import 'package:shopping_list/models/orderhistory/orderrecorddetail/suborder.dart';
import 'package:shopping_list/network/repository/orderrecorddetail_repository.dart';
import 'package:shopping_list/network/response/api_response.dart';
import 'package:shopping_list/widgets/orderRecord/orderrecordsuborderdetail/orderrecordsuborderdetailscreen.dart';

class OrderRecordDetailViewModel with ChangeNotifier {
  final int id;

  final BuildContext context;

  int orderInformationIndex = 0;

  final OrderRecordDetailRepostitory repostitory =
      OrderRecordDetailRepostitory();

  ApiResponse<OrderRecordDetail> apiRresponse = ApiResponse.loading();

  OrderRecordDetailViewModel({required this.id, required this.context});

  void setOrderRecordDetail(ApiResponse<OrderRecordDetail> response) {
    apiRresponse = response;
    notifyListeners();
  }

  void pressSuborder(Suborder suborder) {
    Navigator.of(context).push(
      CupertinoPageRoute(builder:( context) => OrderRecordSuborderDetailScreen(suborder: suborder)));
  }

  void selectOrderInformaition(int index) {
    if (index == orderInformationIndex) {
      return;
    } else {
      orderInformationIndex = index;
      notifyListeners();
    }
  }

  void fetchOrderRecordDetail() async {
    setOrderRecordDetail(ApiResponse.loading());

    repostitory
        .loadOrderRecordDetail(id)
        .then((data) => {setOrderRecordDetail(ApiResponse.completed(data))})
        .onError((error, stackTrace) =>
            {setOrderRecordDetail(ApiResponse.error(error.toString()))});
  }
}
