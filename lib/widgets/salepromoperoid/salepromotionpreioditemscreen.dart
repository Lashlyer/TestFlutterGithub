import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shopping_list/data/categories.dart';
import 'package:shopping_list/models/PromoSaleMulty/promosalemultimodel.dart';
import 'package:shopping_list/models/home/leezenShortcuts.dart';
import 'package:shopping_list/network/appUrls/app_urls.dart';

class SalePromotionPreiodItemScreen extends StatefulWidget {
  final Promotion promotion;

  const SalePromotionPreiodItemScreen({super.key, required this.promotion});

  @override
  State<SalePromotionPreiodItemScreen> createState() =>
      _SalePromotionPreiodItemScreenState();
}

class _SalePromotionPreiodItemScreenState
    extends State<SalePromotionPreiodItemScreen> {
  @override
  Widget build(BuildContext context) {
    double deviceWidth = (MediaQuery.of(context).size.width - 36.0) / 2;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          color: LeezenColor.bg004.getTypeColor(),
          padding: const EdgeInsets.all(12),
          child: Text(
            widget.promotion.name,
            style: TextStyle(
                color: LeezenColor.primary001.getTypeColor(),
                fontSize: 15,
                fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 12,),
        for (var item in widget.promotion.items) ...[
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
            child: Text(
              item.name,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 12, right: 12, bottom: 12),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12.0,
                mainAxisSpacing: 12.0,
                childAspectRatio: deviceWidth / 320),
    
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: item.products.length,
              itemBuilder: (context, index) {
                return productCardBuild(item.products[index]);
            },
          ))
        ]
      ],
    );
  }

  Widget productCardBuild(Product product) {
    return Container(
          decoration: BoxDecoration(
            boxShadow: [LeezenCustomUI.bottmShadow],
            borderRadius: BorderRadius.circular(12),
            color: Colors.white
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(topLeft: Radius.circular(12.0), topRight: Radius.circular(12)),
                child: Image.network(
                  product.image.withLeeznUrl(),
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 170,),
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    for (var tag in product.tags)... [
                      Container(
                        padding: const EdgeInsets.all(4),
                        
                        decoration: BoxDecoration(
                          color: LeezenColor.primary001.getTypeColor(),
                          borderRadius: BorderRadius.circular(2),
                        ),
                        child: Text(
                            tag,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        
                      ),
                      const SizedBox(width: 8)
                    ]
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12, right: 12),
                child: Text(
                  maxLines: 2,
                  '${product.brand}\n${product.name}',
                  overflow: TextOverflow.ellipsis,

                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
              const SizedBox(height: 8,),
              Padding(
                padding: const EdgeInsets.only(left: 12, right: 12),
                child: Row(
                  children: [
                    Text(
                      '\$${product.price}',
                      style: TextStyle(
                        color: LeezenColor.accent001.getTypeColor(),
                        fontSize: 14,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    const SizedBox(width: 8,),
                    if (product.salePrice != product.price)
                    Text(
                      '\$${product.salePrice}',
                      style: TextStyle(
                        color: LeezenColor.greyTextSubTitle.getTypeColor(),
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.lineThrough,
                        decorationColor: LeezenColor.greyTextSubTitle.getTypeColor()
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 25)
            ],
          ),
        );
        
  }
  
}
