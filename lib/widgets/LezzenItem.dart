import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shopping_list/models/grocery_item.dart';
import 'package:shopping_list/widgets/tag.dart';
import 'package:transparent_image/transparent_image.dart';

class LeezenItem extends StatelessWidget {
  const LeezenItem(
      {super.key,
      required this.item,
      required this.itemWidth,
      required this.detail});

  final TestItem item;
  final double itemWidth;
  final void Function() detail;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
                color: const Color.fromARGB(1, 47, 51, 43).withOpacity(0.15),
                spreadRadius: 1,
                blurRadius: 5,
                offset: const Offset(0, 2))
          ]),
      margin: const EdgeInsets.all(12.0),
      child: InkWell(
        onTap: () {
          detail();
        },
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.0)),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      topRight: Radius.circular(10.0),
                    ),
                    child: FadeInImage(
                      placeholder: MemoryImage(kTransparentImage),
                      image: NetworkImage(item.image ?? ''),
                      height: 170,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    margin: const EdgeInsets.all(8.0),
                    alignment: Alignment.topLeft,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 21,
                          child: ListView.separated(
                              padding: const EdgeInsets.all(0),
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return TagScreen(
                                  backGroundColor: Colors.green.shade700,
                                  borderRadius: 4.0,
                                  text: item.tags[index],
                                );
                              },
                              separatorBuilder: (context, index) {
                                return const SizedBox(width: 4.0);
                              },
                              itemCount: item.tags.length),
                        ),
                        const SizedBox(
                          height: 8.0,
                        ),
                        Text(
                          textAlign: TextAlign.left,
                          item.brand ?? '',
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          textAlign: TextAlign.left,
                          item.name ?? '',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              height: 0),
                        ),
                        const SizedBox(
                          height: 9.5,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '\$${item.price}',
                              style: TextStyle(
                                color: Colors.amber.shade900,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            if (item.salePrice != 0 &&
                                item.salePrice > item.price)
                              Padding(
                                padding: const EdgeInsets.only(top: 4),
                                child: Text(
                                  '\$${item.salePrice}',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    decoration: TextDecoration.lineThrough,
                                    decorationColor: Colors.grey.shade400,
                                    color: Colors.grey.shade400,
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        if (item.promotion != '')
                          Text(
                            item.promotion,
                            style: TextStyle(
                                color: Colors.amber.shade900,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            if (item.stamp != '')
              Positioned(
                top: 8,
                right: 8,
                child: Image.network(item.stamp ?? '',
                    width: 32, height: 32, fit: BoxFit.cover),
              ),
            Positioned(
              top: 130,
              right: 8,
              width: 32,
              height: 32,
              child: ElevatedButton(
                onPressed: () {
                  print('test button');
                },
                child: item.isColected == 0
                    ? Image.asset('assets/wish.png')
                    : Image.asset('assets/unWish.png'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(4),
                  backgroundColor: Colors.white.withOpacity(0.5),
                ),
              ),
            ),
            Positioned(
              bottom: 8,
              right: 8,
              width: 32,
              height: 32,
              child: ElevatedButton(
                onPressed: () {
                  print('test shop button');
                },
                child: Image.asset('assets/btnWish.png'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(0),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
