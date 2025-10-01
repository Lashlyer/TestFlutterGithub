

import 'package:flutter/material.dart';
import 'package:shopping_list/data/categories.dart';
import 'package:shopping_list/widgets/ShopCartHome/shopCartHomeScreen.dart';
import 'package:shopping_list/widgets/exhibitionHome/exhibitionHomeScreen.dart';
import 'package:shopping_list/widgets/handwritingboard/drawingpage.dart';
import 'package:shopping_list/widgets/handwritingboard/handwritingboard.dart';
import 'package:shopping_list/widgets/leezenHome/leezenHomeScreen.dart';
import 'package:shopping_list/widgets/login/loginScreen.dart';
import 'package:shopping_list/widgets/orderRecord/orderrecordlistscreen.dart';
import 'package:shopping_list/widgets/prodcuthome/prodcuthomescreen.dart';
import 'package:shopping_list/widgets/salepromoperoid/salepromopreiodlistscreen.dart';
import 'package:shopping_list/widgets/storelist/storelistscreen.dart';
import 'package:shopping_list/widgets/storelist/youtubeDemo.dart';
import 'package:shopping_list/widgets/testLeezen.dart';

class LeezenHomeTabarScreen extends StatefulWidget {

  const LeezenHomeTabarScreen({super.key});

  @override
  State<LeezenHomeTabarScreen> createState() => _LeezenHomeTabarScreenState();
}

class _LeezenHomeTabarScreenState extends State<LeezenHomeTabarScreen> {

  int _selectedIndex = 0;

  List<Widget> _widgetOptions = <Widget>[
    ProdcutHomeScreen(),
    OrderRecordListScreen(),
    TestLeezen(),
    ShopCartHomeScreen(),
    YouTubeDemo()
    ];


  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  } 

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Image.asset('assets/icon-leezenTabHome.png',
            color:  _selectedIndex == 0 ? LeezenColor.primary001.getTypeColor() : LeezenColor.greyTextSubTitle.getTypeColor(),),
            label: '首頁',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/icon-exhibitionHome.png',
            color:  _selectedIndex == 1 ? LeezenColor.primary001.getTypeColor() : LeezenColor.greyTextSubTitle.getTypeColor(),),
            label: '探索',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/icon-productTab.png',
                   color:  _selectedIndex == 2 ? LeezenColor.primary001.getTypeColor() : LeezenColor.greyTextSubTitle.getTypeColor(),),
            label: '產品'
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/icon-productTab.png',
                   color:  _selectedIndex == 3 ? LeezenColor.primary001.getTypeColor() : LeezenColor.greyTextSubTitle.getTypeColor(),),
            label: '購物籃'
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/icon-productTab.png',
                   color:  _selectedIndex == 4 ? LeezenColor.primary001.getTypeColor() : LeezenColor.greyTextSubTitle.getTypeColor(),),
            label: '消費紀錄'
          )
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: LeezenColor.primary001.getTypeColor(),
        unselectedItemColor: LeezenColor.greyTextSubTitle.getTypeColor(),
        selectedIconTheme: IconThemeData(color: LeezenColor.primary001.getTypeColor()),
        unselectedIconTheme: IconThemeData(color: LeezenColor.greyplaceholder.getTypeColor()),
        onTap: _onItemTapped,
        backgroundColor: Colors.white,
      ),
    );
  }
}