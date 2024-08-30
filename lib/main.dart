import 'package:flutter/material.dart';
import 'package:shopping_list/widgets/Grocery_list.dart';
import 'package:shopping_list/widgets/leezenHome/leezenHomeScreen.dart';
import 'package:shopping_list/widgets/leezenTabarScreen.dart';
import 'package:shopping_list/widgets/productDetail/detailContent/leezenDetailContent.dart';
import 'package:shopping_list/widgets/testLeezen.dart';



void main() {
  // WebViewPlatform.instance = WebWebViewPlatform();
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Groceries',
      theme: ThemeData.dark().copyWith(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 147, 229, 250),
          brightness: Brightness.dark,
          surface: const Color.fromARGB(255, 42, 51, 59),
        ),
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(backgroundColor: Color.fromRGBO(94, 133, 46, 1))
      ),
      home: LeezenHomeTabarScreen()
    );
  }
}


