import 'package:flutter/cupertino.dart';
import 'package:shopping_list/models/storelist/storelist.dart';
import 'package:shopping_list/widgets/storeDetail/storedetailScreen.dart';
import '../../models/storelist/storeRegion.dart';
import '../../models/storelist/storelistmodel.dart';
import '../../network/repository/storelist_repository.dart';
import '../../network/response/api_response.dart';


class RegionMenu {

  Region selected;

  List<Region> arealis;

  RegionMenu({required this.arealis, required this.selected});

}

class StoreListViewmodel with ChangeNotifier {
  final StoreListRepository repository = StoreListRepository();

  ApiResponse<StoreListModel> apiResponse = ApiResponse.loading();

  Map<int, RegionMenu>? cached;

  int _selectIndex = 0;

  Region? get region => cached?[_selectIndex]?.selected;

  List<Region>? get areaList => cached?[_selectIndex]?.arealis;

  BuildContext context;

  StoreListViewmodel({required this.context});

  pressTopTag(int index) {

    _selectIndex = index;

    if (cached != null) {
      fetchloadStoreApi(cached![_selectIndex]!.selected.id);
    }

    notifyListeners();
  }

  selectArea(Region region) {

    cached?[_selectIndex]?.selected = region;

    fetchloadStoreApi(region.id);
  }

  setStroelistModel(ApiResponse<StoreListModel> response) {
    apiResponse = response;

    if (apiResponse.data != null) {
      if (cached == null) {
        final model = apiResponse.data as StoreListModel;

        cached = {0: RegionMenu(arealis: model.regions.regions, selected: model.regions.regions.first),
                  1: RegionMenu(arealis: model.regions.outerIslandRegions, selected: model.regions.outerIslandRegions.first)};

      } 
    } 
     notifyListeners();
  }

  void pressItem(StoreItem item) {
    Navigator.of(context).push(CupertinoPageRoute(
        builder: (ctx) =>
            StoreDetailScreen(no: item.no,)));
  }

  void fetchloadStoreApi(int regionid) async {
    Map body = {
      "lat": 25.051904181964744,
      "limit": 10,
      "lng": 121.52611204490297,
      "offset": 0,
      "region": regionid,
      "type": 0
    };

    setStroelistModel(ApiResponse.loading());

    repository.fetchApi(body).then((data) {
      setStroelistModel(ApiResponse.completed(data));
    }).onError((error, stackTrace) {
      setStroelistModel(ApiResponse.error(error.toString()));
    });
  }
}




