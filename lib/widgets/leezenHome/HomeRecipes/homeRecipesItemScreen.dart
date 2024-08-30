


import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shopping_list/models/home/homeRecipe.dart';
import 'package:shopping_list/models/home/leezenShortcuts.dart';

class HomeRecipesItemScreen extends StatelessWidget {

  const HomeRecipesItemScreen({super.key ,required this.recipe});

  final HomeRecipe recipe;

  @override
  Widget build(BuildContext context) {
    
    return Padding(
      padding: const EdgeInsets.only(top: 2, bottom: 2),
      child: Container(
        width: 260,
        decoration: BoxDecoration(
          color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: const Color.fromARGB(1, 47, 51, 43).withOpacity(0.15),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: const Offset(0, 2))
            ]
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              child: Image.network(
                height: 172,
                width: double.infinity,
                recipe.image1.withLeeznUrl(),
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(height: 14,),
            Text(
              recipe.title,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.bold,
                height: 0
              ),
            ),
            const SizedBox(height: 14,),

            Container(
              height: 77,
              padding: const EdgeInsets.only(left: 12, right: 12),
              child: Row(
                children: [
                  if (recipe.image2.isNotEmpty)
                  Image.network(
                    width: 114,
                    recipe.image2.withLeeznUrl(),
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(width: 8,),
                  if (recipe.image3.isNotEmpty)
                  Image.network(
                    width: 114,
                    recipe.image3.withLeeznUrl(),
                    fit: BoxFit.cover,
                  )
                ],
              ),

            )

          ],
        ),
      ),
    );
  }
}