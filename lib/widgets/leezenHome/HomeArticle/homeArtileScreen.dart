import 'package:flutter/material.dart';
import 'package:shopping_list/data/categories.dart';
import 'package:shopping_list/models/home/homeArticle.dart';
import 'package:shopping_list/widgets/leezenHome/HomeActivity/homeActivityItemScreen.dart';
import 'package:shopping_list/widgets/leezenHome/HomeArticle/homeArticleItemScreen.dart';

class HomeArticleScreen extends StatelessWidget {
  const HomeArticleScreen({super.key, required this.articles});

  final List<HomeArticle> articles;

  @override
  Widget build(BuildContext context) {
    double deviceWidth = (MediaQuery.of(context).size.width - 36.0) / 2;

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
                  '讀好文',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
                const Expanded(child: SizedBox()),
                Text(
                  '看更多',
                  style: TextStyle(
                    color: LeezenColor.greyTextSubTitle.getTypeColor(),
                    fontSize: 11,
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          SizedBox(
            width: (MediaQuery.of(context).size.width - 26.0),
            height: 179 + 179 + 30,
            child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 11.2,
                    mainAxisSpacing: 11.2,
                    crossAxisCount: 2),
                itemCount: articles.length,
                itemBuilder: (context, index) {
                  return HomeArticleItemScreen(article: articles[index]);
                }),
          ),

          const SizedBox(height: 32,)
        ],
      ),
    );
  }
}
