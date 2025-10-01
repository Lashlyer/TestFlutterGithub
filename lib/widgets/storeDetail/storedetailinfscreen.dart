import 'package:flutter/material.dart';
import 'package:shopping_list/data/categories.dart';
import 'package:shopping_list/models/storeDetail/storeDetail.dart';

class StoreDetailInfoScreen extends StatelessWidget {
  final StoreDetail detail;

  const StoreDetailInfoScreen({super.key, required this.detail});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 16, 12, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            detail.name,
            style: const TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 18,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.location_on_outlined,
                size: 20,
                color: LeezenColor.primary001.getTypeColor(),
              ),
              const SizedBox(
                width: 4,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '地址',
                    style: TextStyle(
                        color: LeezenColor.primary002.getTypeColor(),
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    detail.address,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              const Expanded(child: SizedBox()),

              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: LeezenColor.bg004.getTypeColor(),
                  borderRadius: BorderRadius.circular(30)
                ),
                child: IconButton(
                    color: LeezenColor.bg004.getTypeColor(),
                    onPressed: () {},
                    icon: Icon(
                      Icons.location_on_outlined,
                      size: 24,
                      color: LeezenColor.primary001.getTypeColor(),
                    )),
              )
            ],
          ),

          const SizedBox(height: 16,),

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.phone,
                size: 20,
                color: LeezenColor.primary001.getTypeColor(),
              ),
              const SizedBox(
                width: 4,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '電話',
                    style: TextStyle(
                        color: LeezenColor.primary002.getTypeColor(),
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    detail.telephone,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              const Expanded(child: SizedBox()),

              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: LeezenColor.bg004.getTypeColor(),
                  borderRadius: BorderRadius.circular(30)
                ),
                child: IconButton(
                    color: LeezenColor.bg004.getTypeColor(),
                    onPressed: () {},
                    icon: Icon(
                      Icons.phone_in_talk,
                      size: 24,
                      color: LeezenColor.primary001.getTypeColor(),
                    )),
              )
            ],
          ),

          const SizedBox(height: 16,),

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.access_time_rounded,
                size: 20,
                color: LeezenColor.primary001.getTypeColor(),
              ),
              const SizedBox(
                width: 4,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '時間',
                    style: TextStyle(
                        color: LeezenColor.primary002.getTypeColor(),
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    detail.businessHours,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              const Expanded(child: SizedBox()),
            ],
          ),

          if (detail.parking != 0) ... [
            const SizedBox(height: 16,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.local_parking,
                  size: 20,
                  color: LeezenColor.primary001.getTypeColor(),
                ),
                const SizedBox(width: 4,),

                Text(
                  '含停車場',
                  style: TextStyle(
                    color: LeezenColor.primary002.getTypeColor(),
                    fontSize: 14,
                    fontWeight: FontWeight.bold
                  ),
                )
              ],
            )
          ],
        ],
      ),
    );
  }
}
