import 'package:flutter/material.dart';
import 'package:shopping_list/data/categories.dart';
import 'package:shopping_list/models/exhibitionHome/recipe.dart';
import 'package:shopping_list/models/home/leezenShortcuts.dart';

class RecipeItemScreen extends StatelessWidget {
  const RecipeItemScreen(
      {super.key, required this.recipe, required this.pressItem});

  final Recipe recipe;

  final void Function(Recipe recipe) pressItem;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        pressItem(recipe);
      },
      child: Padding(
          padding: const EdgeInsets.only(top: 2, bottom: 2),
          child: Container(
            width: 260,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                      color:
                          const Color.fromARGB(1, 47, 51, 43).withOpacity(0.15),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: const Offset(0, 2))
                ]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  child: Image.network(
                    height: 172,
                    recipe.image.withLeeznUrl(),
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Container(
                  padding: const EdgeInsets.only(left: 12, right: 12),
                  height: 21,
                  child: Row(
                    children: [
                      Text(
                        recipe.category,
                        style: TextStyle(
                            fontSize: 13,
                            color: LeezenColor.primary002.getTypeColor()),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Container(
                        height: 21,
                        decoration: BoxDecoration(
                            color: LeezenColor.primary002.getTypeColor(),
                            borderRadius: BorderRadius.circular(2)),
                        padding: const EdgeInsets.fromLTRB(4, 2, 4, 2),
                        child: Text(
                          recipe.vege,
                          style: const TextStyle(
                              height: 0.0, fontSize: 10, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12, right: 12),
                  child: Text(
                    maxLines: 1,
                    recipe.title,
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
