import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shopping_list/models/home/LeezenHome.dart';
import 'package:shopping_list/widgets/leezenHome/HomeActivity/homeAcitiviyScreen.dart';
import 'package:shopping_list/widgets/leezenHome/HomeArticle/homeArtileScreen.dart';
import 'package:shopping_list/widgets/leezenHome/HomeRecipes/homeRecipesScreen.dart';
import 'package:shopping_list/widgets/leezenHome/homeBanner.dart';
import 'package:shopping_list/widgets/leezenHome/HomePromotion/homePromotionScreen.dart';
import 'package:shopping_list/widgets/leezenHome/homeShortcuts.dart';
import 'package:shopping_list/widgets/leezenHome/HomeTaskMission/homeTaskMetaScreen.dart';
import 'package:shopping_list/widgets/leezenHome/HomeTop/homeTopScreen.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:http/http.dart' as http;

class LeezenHomeScreen extends StatefulWidget {
  const LeezenHomeScreen({super.key});

  @override
  State<LeezenHomeScreen> createState() => _LeezenHomeScreenState();
}

class _LeezenHomeScreenState extends State<LeezenHomeScreen> {

  Future<LeezenHome> _loadDetail() async {
    final url =
        Uri.parse('https://leezen.app.13930.com/api/v1/home/ios');

    final response = await http.get(
      url, 
      headers: {
        'Content-Type': 'application/json',   
        'Authorization': 'Bearer 10857|zG3k7xUypc1rhqpR4fHCJAqCJqz0RoDhb6GbUR641fd841cd'
        }
      );

    if (response.statusCode >= 400) {
      throw Exception('Faile to fetcg grocery item');
    }

    final Map<String, dynamic> data = json.decode(response.body);

    return LeezenHome.fromJson(data['data']);
  }

  void pressBanner(String link)  {
    _launchUrl(link);
  }

  void _launchUrl(String link) async {
    final url = Uri.parse(link);

    if (await canLaunchUrl(url)) {
      await launchUrl(url,
      mode: LaunchMode.externalApplication);
    } else {
      print('error');
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(),
        body: FutureBuilder(
          future: _loadDetail(),
          builder: (context, snapshot) {
            
            if (snapshot.data == null) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              final LeezenHome data = snapshot.data!;

              return Stack(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/splash_bg.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        const HomeTopScreen(),
                        HomeBannerScreen(banners: data.banners, pressBanner: pressBanner),
                        LeezenHomeShortuctsScreen(data: data.shortcuts),
                        // if (data.tasks != null)
                        // HomeTaskMetaScreen(tasks: data.tasks!),
                        HomePromotionScreen(promtoions: data.promotions),
                        HomeActivityScreen(activities: data.activities),
                        HomeRecipeScrenn(recipes: data.recipes),
                        HomeArticleScreen(articles: data.articles)
                        ],
                    ),
                  )
                ],
              );
            }
          },
        ));
  }
}
