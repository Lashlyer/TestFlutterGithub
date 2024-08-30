import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:shopping_list/data/categories.dart';
import 'package:shopping_list/models/exhibitionHome/activity.dart';
import 'package:shopping_list/models/exhibitionHome/exhibition.dart';
import 'package:shopping_list/models/exhibitionHome/exhibitionHome.dart';
import 'package:shopping_list/models/exhibitionHome/recipe.dart';
import 'package:shopping_list/models/home/leezenShortcuts.dart';
import 'package:shopping_list/widgets/exhibitionHome/ExhibitionActivity/ExhibitionActivityScreen.dart';
import 'package:shopping_list/widgets/exhibitionHome/ExhibitonHomeRecipeItemScreen/recipeItemScreen.dart';
import 'package:shopping_list/widgets/exhibitionHome/exhibitonItemScreen.dart';
import 'package:shopping_list/widgets/exhibitionHome/leezenSeeMoreTitleScreen.dart';

class ExhibitionHomeScreen extends StatefulWidget {
  const ExhibitionHomeScreen({super.key});

  @override
  State<ExhibitionHomeScreen> createState() => _ExhibitionHomeScreenState();
}

class _ExhibitionHomeScreenState extends State<ExhibitionHomeScreen> {
  Future<ExhibitionHome> _loadData() async {
    final url =
        Uri.parse('http://leezen.app.13930.com/api/v1/explore/overview');

    final response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization':
          'Bearer 6370|oNX3E58gyNvM9dxO31PVn8Hh7v8nnMl2KtBR53Xyec86af87'
    });

    if (response.statusCode >= 400) {
      throw Exception('Faile to fetcg grocery item');
    }

    final Map<String, dynamic> data = json.decode(response.body);

    return ExhibitionHome.fromJson(data['data']);
  }

  void _pressExhibitionItem(Exhibition exhibition) {
    print('pressExhibition ${exhibition.name}');
  }

  void _seeMoreRecipe() {
    print('seeMoreRecipe');
  }

  void _seeMoreTopic() {
    print('seeMoreTopic');
  }

  void _seeMoreActivity() {
    print('seeMoreActivity');
  }

  void _pressActivityItem(Activity activity) {
    print('pressActivity ${activity.name}');
  }

  void _pressRecipeItem(Recipe recipe) {
    print('pressRecipe ${recipe.title}');
  }

  @override
  Widget build(BuildContext context) {
    double deviceWidth = ((MediaQuery.of(context).size.width) - 31) / 2;

    print(deviceWidth);
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: _loadData(),
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
          } else {
            final data = snapshot.data!;
            return SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 16,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12, right: 12),
                    child: ExhibitionItemScreen(
                        exhibition: data.exhibitions.first,
                        pressItem: _pressExhibitionItem,
                        height: 180),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 12, right: 12),
                    height: 180,
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 7,
                          mainAxisSpacing: 7,
                          childAspectRatio: deviceWidth / 86),
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: data.exhibitions.length - 1,
                      itemBuilder: (context, index) {
                        return ExhibitionItemScreen(
                            exhibition: data.exhibitions[index + 1],
                            pressItem: _pressExhibitionItem,
                            height: 86);
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 28,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12, right: 12),
                    child: LeezenSeeMoreTitleScreen(
                        title: '里仁活動', seeMore: _seeMoreActivity),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  ExhibitionActivityScreen(
                      activities: data.activities,
                      pressItem: _pressActivityItem),
                  const SizedBox(
                    height: 32,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12, right: 12),
                    child: LeezenSeeMoreTitleScreen(
                        title: '最新食譜', seeMore: _seeMoreRecipe),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Container(
                    height: 245,
                    padding: const EdgeInsets.only(left: 12),
                    child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return RecipeItemScreen(
                              recipe: data.recipes[index],
                              pressItem: _pressRecipeItem);
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox(width: 12);
                        },
                        itemCount: data.recipes.length),
                  ),
                  const SizedBox(
                    height: 36,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12, right: 12),
                    child: LeezenSeeMoreTitleScreen(
                        title: '精選主題', seeMore: _seeMoreTopic),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Container(
                    height: 172,
                    padding: const EdgeInsets.only(left: 12),
                    child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Container(
                            width: 260,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6)),
                            child: Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(6),
                                  child: Image.network(
                                    width: double.infinity,
                                    height: double.infinity,
                                    data.topics[index].image.withLeeznUrl(),
                                    fit: BoxFit.cover,
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox(width: 12);
                        },
                        itemCount: data.topics.length),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
