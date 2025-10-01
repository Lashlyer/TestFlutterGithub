import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shopping_list/data/categories.dart';
import 'package:shopping_list/models/storelist/storeRegion.dart';
import 'package:shopping_list/models/storelist/storelist.dart';
import 'package:shopping_list/network/appUrls/app_urls.dart';

class StoreItemScreen extends StatelessWidget {

  final List<StoreItem> items;

  final void Function(StoreItem item) pressItem;

  const StoreItemScreen({super.key, required this.items, required this.pressItem});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12, right: 12),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (var item in items) ...[
              setList(item),
              const SizedBox(height: 12)
            ]
          ],
        ),
      ),
    );
  }

  Widget setList(StoreItem item) {
    return InkWell(
      onTap: () {
        pressItem(item);
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
                color: LeezenColor.lightGreyGrenen.getTypeColor(), width: 1),
            boxShadow: [LeezenCustomUI.bottmShadow]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              item.name,
              style: TextStyle(
                  color: LeezenColor.primary001.getTypeColor(),
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.location_on_outlined,
                  color: LeezenColor.primary001.getTypeColor(),
                  size: 24,
                ),
                const SizedBox(
                  width: 4,
                ),
                Text(
                  item.address,
                  style: const TextStyle(color: Colors.black, fontSize: 14),
                  maxLines: 1,
                )
              ],
            ),
      
            const SizedBox(height: 4,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.phone,
                  color: LeezenColor.primary001.getTypeColor(),
                  size: 24,
                ),
                const SizedBox(
                  width: 4,
                ),
                Text(
                  item.telephone,
                  style: const TextStyle(color: Colors.black, fontSize: 14),
                  maxLines: 1,
                ),
      
                const Expanded(child: SizedBox()),
      
                Icon(Icons.arrow_forward_ios, color: LeezenColor.grey003.getTypeColor(), size: 24)
              ],
            )
          ],
        ),
      ),
    );
  }
}
