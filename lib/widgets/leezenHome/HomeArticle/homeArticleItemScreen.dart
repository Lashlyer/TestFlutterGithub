

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping_list/models/home/homeArticle.dart';
import 'package:shopping_list/models/home/leezenShortcuts.dart';

class HomeArticleItemScreen extends StatelessWidget {

  const HomeArticleItemScreen({super.key, required this.article});

  final HomeArticle article;

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.only(top: 5, left: 2, right: 2),
      child: Container(
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
                  article.image.withLeeznUrl(),
                  width: double.infinity,
                  height: 114,
                  fit: BoxFit.cover,
                ),
              ),

              const SizedBox(height: 8,),

              Padding(
                padding: const EdgeInsets.only(left: 12, right: 12),
                child: Center(
                  child: Text(
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    article.title,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.bold
                    )
                  ),
                ),
              )
            ],
          ),
      ),
    );
  }
}