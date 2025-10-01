

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:shopping_list/widgets/prodcuthome/producthomeitemscreen.dart';

import '../../models/productHome/productHome.dart';

class ProductHomeProductsScreen extends StatelessWidget {

  final List<ProductItem> product;

  const ProductHomeProductsScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: MasonryGridView.count(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12, 
        itemCount: product.length,
        itemBuilder:(context, index) {
          return ProductHomeItemScreen(product: product[index]);
        },
        ),
      );
  }
}