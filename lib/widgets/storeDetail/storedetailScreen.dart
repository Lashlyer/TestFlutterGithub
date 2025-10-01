



import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_list/data/categories.dart';
import 'package:shopping_list/models/storeDetail/storeDetail.dart';
import 'package:shopping_list/network/response/apistatus.dart';
import 'package:shopping_list/widgets/storeDetail/storeMapScreen.dart';
import 'package:shopping_list/widgets/storeDetail/storedetailinfscreen.dart';
import 'package:shopping_list/widgets/storeDetail/storedetailviewmodel.dart';

class StoreDetailScreen extends StatefulWidget {

  final String no;

  const StoreDetailScreen({super.key, required this.no});

  @override
  State<StoreDetailScreen> createState() => _StoreDetailScreenState();

}

class _StoreDetailScreenState extends State<StoreDetailScreen> {

  late StoreDetailViewModel viewModel;

  @override
  void initState() {
    viewModel = StoreDetailViewModel(no: widget.no);
    viewModel.fetchApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text('門市詳情'),
      ),
      body: ChangeNotifierProvider<StoreDetailViewModel>(
        create: (context) => viewModel,
        child: Consumer<StoreDetailViewModel>(
          builder: (context, value, child) {
            switch (value.apiResponse.status) {
              case ApiStatus.loading:
                return const Center(child: CircularProgressIndicator());

              case ApiStatus.completed:
                return setDetial(value.apiResponse.data!);

              case ApiStatus.error:
                return Center(
                    child: Text(value.apiResponse.message.toString()),
                  );

              default:
                return Container();
            }
          },
        ),
      ),
    );
  }


  Widget setDetial(StoreDetail detail) {
    return SingleChildScrollView(
      child: Column(
        children: [
          StoreMapScreen(detail: detail),
          StoreDetailInfoScreen(detail: detail),
          Divider(
            height: 4,
            color: LeezenColor.paleGrey.getTypeColor(),
          ),
          setDetailItem('營業項目', detail.businessItems),
          Divider(height: 1, color: LeezenColor.grey003alpha20.getTypeColor(),),
          setDetailItem('收款方式', detail.payments),
          Divider(height: 1, color: LeezenColor.grey003alpha20.getTypeColor(),)

        ],
      ),
    );
  }

  Widget setDetailItem(String title, String value) {
    return Container(
        width: double.infinity,
        padding: const EdgeInsets.fromLTRB(12, 16, 12, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                color: LeezenColor.primary002.getTypeColor(),
                fontSize: 14,
                fontWeight: FontWeight.bold
              ),
            ),
            const SizedBox(height: 8,),
      
            Text(
              value,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 14,
              ),
            )
          ],
        ),
      
    );
  }
}