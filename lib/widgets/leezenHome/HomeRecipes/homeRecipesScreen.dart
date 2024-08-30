

import 'package:flutter/material.dart';
import 'package:shopping_list/data/categories.dart';
import 'package:shopping_list/models/home/homeRecipe.dart';
import 'package:shopping_list/widgets/leezenHome/HomeRecipes/homeRecipesItemScreen.dart';

class HomeRecipeScrenn extends StatelessWidget {
  
  const HomeRecipeScrenn({super.key, required this.recipes});

  final List<HomeRecipe> recipes;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 24,
            padding: const EdgeInsets.only(left: 12, right: 12),
            child: Row(
              children: [
                const Text(
                  '逛食譜',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
                const Expanded(child: SizedBox()),
                Text(
                  '找更多',
                  style: TextStyle(
                      color: LeezenColor.greyTextSubTitle.getTypeColor(),
                      fontSize: 11,
                      fontWeight: FontWeight.normal),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Container(
            color: Colors.white,
            height: 325,
            padding: const EdgeInsets.only(top: 5, left: 12, bottom: 5),
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  if (index < recipes.length) {
                    return HomeRecipesItemScreen(recipe: recipes[index]);
                  } else {
                    return SizedBox(
                      width: 146,
                      height: double.infinity,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              '探索更多',
                              style: TextStyle(
                                color: LeezenColor.primary001.getTypeColor(),
                                fontSize: 13,
                              ),
                            ),
                      
                            const SizedBox(height: 4,),
                      
                            Image.asset(
                              width: 106,
                              height: 16,
                              'assets/btn-misson-arrow.png'
                            )
                          ],
                        ),
                      ),
                    );
                  }
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    width: 12,
                  );
                },
                itemCount: recipes.length + 1),
          ),

          const SizedBox(height: 32,)
        ],
      ),
    );
  }
}