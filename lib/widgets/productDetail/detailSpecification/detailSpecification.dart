import 'package:flutter/material.dart';
import 'package:shopping_list/data/categories.dart';
import 'package:shopping_list/models/detailContent.dart';
import 'package:shopping_list/widgets/productDetail/detailSpecification/detailSpecificationRow.dart';
import 'package:shopping_list/widgets/productDetail/detailContent/leezenDetailContent.dart';

class DetailSpecification extends StatelessWidget {
  const DetailSpecification({super.key, required this.model});

  final Specifications model;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                DetailContentType.specifications.getDetailContentTyepName(),
                style: TextStyle(
                    color: LeezenColor.primary002.getTypeColor(),
                    fontSize: 14,
                    fontWeight: FontWeight.normal),
              ),
              const SizedBox(
                height: 8,
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(
                        color: LeezenColor.grey003alpha20.getTypeColor(),
                        width: 1)),
                child: Column(
                  children: [
                    for (final (index, specification)
                        in model.specifications.indexed)
                      DetailSpecificationRow(
                          data: specification,
                          color: index % 2 != 0
                              ? LeezenColor.bg002.getTypeColor()
                              : Colors.white)
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 1,
          color: LeezenColor.grey003alpha20.getTypeColor(),
        ),
      ],
    );
  }
}
