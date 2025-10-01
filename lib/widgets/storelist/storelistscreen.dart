import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:shopping_list/data/categories.dart';
import 'package:shopping_list/network/appUrls/app_urls.dart';
import 'package:shopping_list/network/response/apistatus.dart';
import 'package:shopping_list/widgets/storelist/storeItemscreen.dart';
import 'package:shopping_list/widgets/storelist/storelistviewmodel.dart';

import '../../models/storelist/storeRegion.dart';
import '../../models/storelist/storelistmodel.dart';

class StoreListSreen extends StatefulWidget {
  const StoreListSreen({super.key});


  @override
  State<StoreListSreen> createState() => _StoreListSreenState();
}

class _StoreListSreenState extends State<StoreListSreen>
    with SingleTickerProviderStateMixin {
  late StoreListViewmodel viewmodel;
  late TabController _tabController;


  @override
  void initState() {
    viewmodel = StoreListViewmodel(context: context);
    viewmodel.fetchloadStoreApi(0);
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('門市'),
        ),
        body: ChangeNotifierProvider<StoreListViewmodel>(
          create: (context) => viewmodel,
          child: Consumer<StoreListViewmodel>(
            builder: (context, value, child) {
              switch (value.apiResponse.status) {
                case ApiStatus.loading:
                  return const Center(child: CircularProgressIndicator());

                case ApiStatus.error:
                  return Center(
                    child: Text(value.apiResponse.message.toString()),
                  );

                case ApiStatus.completed:
                  return storeListTopBuild(value.apiResponse.data!);

                default:
                  return Container();
              }
            },
          ),
        ));
  }

  Widget storeListTopBuild(StoreListModel model) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            decoration: BoxDecoration(
                color: Colors.white, boxShadow: [LeezenCustomUI.bottmShadow]),
            width: double.infinity,
            height: 44.0,
            child: TabBar(
              controller: _tabController,
              labelColor: LeezenColor.primary001.getTypeColor(),
              unselectedLabelColor: LeezenColor.greyTextSubTitle.getTypeColor(),
              indicatorColor: LeezenColor.primary001.getTypeColor(),
              dividerColor: Colors.transparent,
              indicatorSize: TabBarIndicatorSize.tab,
              padding: EdgeInsets.zero,
              indicatorWeight: 1.5,
              isScrollable: false,
              tabs: const [
                Tab(
                  text: '台灣',
                ),
                Tab(text: '外島'),
              ],
              onTap: (value) {
                viewmodel.pressTopTag(value);
              },
            )),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: DropdownButtonFormField<Region>(
              
              value: viewmodel.region,
              icon: Icon(
                Icons.arrow_drop_down,
                color: LeezenColor.greyTextSubTitle.getTypeColor(),
              ),
              iconSize: 24,
              items: viewmodel.areaList?.map<DropdownMenuItem<Region>>((e) {
                return DropdownMenuItem(value: e, child: Text(e.name, style: const TextStyle(color: Colors.black),));
              }).toList(),
              onChanged: (value) {
                if (value != null) {
                  viewmodel.selectArea(value);
                }
              },
              dropdownColor: Colors.white,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: InputBorder.none,
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide:
                          const BorderSide(color: Colors.black, width: 1)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide:
                          const BorderSide(color: Colors.black, width: 1)))),
        ),
        
        Expanded(child: StoreItemScreen(items: viewmodel.apiResponse.data!.list.rows, pressItem: viewmodel.pressItem,))
      ],
    );
  }
}
