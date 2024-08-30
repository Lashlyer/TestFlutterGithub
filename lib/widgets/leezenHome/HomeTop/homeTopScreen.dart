import 'package:flutter/material.dart';
import 'package:shopping_list/data/categories.dart';
import 'package:shopping_list/widgets/leezenHome/HomeTop/homeTopPointRow.dart';

class HomeTopScreen extends StatelessWidget {
  
  const HomeTopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Image.asset(
              width: 37,
              height: 84,
              'assets/img-home-top-leaf.png',
              fit: BoxFit.cover,
            ),
            const Expanded(child: SizedBox()),
            Image.asset(
              width: 162,
              height: 84,
              'assets/img-home-top-slogen.png',
              fit: BoxFit.cover,
            ),
            const Expanded(child: SizedBox()),
            Image.asset(
              width: 160,
              height: 84,
              'assets/img-home-top-male.png',
              fit: BoxFit.cover,
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 12, right: 12),
          child: Container(
            padding: const EdgeInsets.fromLTRB(31, 0, 31, 0),
            width: double.infinity,
            height: 72,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: LeezenColor.lightGreyGrenen.getTypeColor(),
                  width: 1.5,
                ),
                boxShadow: [
                  BoxShadow(
                      color:
                          const Color.fromARGB(1, 47, 51, 43).withOpacity(0.15),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: const Offset(0, 2))
                ]),
            child: Row(
              children: [
                const HomeTopPointRow(
                  type: HomeTopRowItemType.point,
                  value: '2',
                ),
                Expanded(
                  child: SizedBox(
                    child: Center(
                      child: Container(
                        width: 1,
                        height: 31,
                        color: LeezenColor.bg003.getTypeColor(),
                      ),
                    ),
                  ),
                ),
                const HomeTopPointRow(
                  type: HomeTopRowItemType.coupon,
                  value: '1',
                ),
                Expanded(
                  child: SizedBox(
                    child: Center(
                      child: Container(
                        width: 1,
                        height: 31,
                        color: LeezenColor.bg003.getTypeColor(),
                      ),
                    ),
                  ),
                ),
                const HomeTopPointRow(
                  type: HomeTopRowItemType.order,
                  value: '5',
                ),
              ],
            ),
          ),
        ),
        Container(
          width: double.infinity,
          height: 76,
          padding: const EdgeInsets.fromLTRB(12, 16, 12, 16),
          child: ElevatedButton(
            
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                backgroundColor: LeezenColor.primary001.getTypeColor()),
                
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  width: 24,
                  height: 24,
                  'assets/icon-delivery.png',
                  fit: BoxFit.cover,
                  ),
                const SizedBox(width: 8,),
                const Text(
                  '店取 / 外送專區',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                  ),)
              ],
            ),
          ),
        ),

        InkWell(
          onTap: () {
            print('test notification');
          },
          child: Container(
            color: LeezenColor.offWhite.getTypeColor(),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 20,
                    height: 20,
                    child: Image.asset('assets/icon-announcement.png'),
                  ),
          
                  const SizedBox(width: 8),
              
                  Text(
                    '全台蔬食餐廳吃透透~ 登入發票參加抽獎！',
                    style: TextStyle(
                      color: LeezenColor.primary002.getTypeColor(),
                      fontSize: 13,
                    ),
                  ),
              
                  const Expanded(child: SizedBox()),
                  Image.asset(
                    width: 11,
                    height: 14,
                    'assets/icon-next-primay002.png',
                    fit: BoxFit.cover,),
                ],                
              ),
            ),
          ),
        )
      ],
    );
  }
}
