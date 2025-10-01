import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shopping_list/data/categories.dart';
import 'package:shopping_list/models/home/leezenShortcuts.dart';
import 'package:shopping_list/models/shopcart/shopCartPersent.dart';

class BonusListScreen extends StatelessWidget {
  final List<Present> presents;

  const BonusListScreen({super.key, required this.presents});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '全站滿額贈',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [for (var present in presents) buildItem(present)],
          ),
        ),
      ),
    );
  }

  Widget buildItem(Present present) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                height: 34,
                decoration: BoxDecoration(
                    border: Border.all(
                        width: 1,
                        color: present.valid
                            ? LeezenColor.primary002.getTypeColor()
                            : LeezenColor.greyplaceholder.getTypeColor()),
                    borderRadius: BorderRadius.circular(6)),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: present.valid
                              ? LeezenColor.primary002.getTypeColor()
                              : LeezenColor.greyplaceholder.getTypeColor()),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(8, 6, 6, 6),
                        child: Text(
                          present.valid ? '已符合' : '未符合',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(6, 6, 6, 8),
                      child: Text(
                        present.name,
                        style: TextStyle(
                            color: present.valid
                                ? LeezenColor.primary002.getTypeColor()
                                : LeezenColor.greyplaceholder.getTypeColor(),
                            fontSize: 14),
                      ),
                    )
                  ],
                ),
              ),
              const Expanded(child: SizedBox())
            ],
          ),

          const SizedBox(height: 12,),

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                present.image.withLeeznUrl(),
                width: 64,
                height: 64,
                fit: BoxFit.cover,),
                
              const SizedBox(width: 16,),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      present.name,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    Text(
                      present.standard,
                      style: TextStyle(
                        color: LeezenColor.greyTextSubTitle.getTypeColor(),
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      'x${present.quantity}',
                      style: TextStyle(
                        color: LeezenColor.greyTextSubTitle.getTypeColor(),
                        fontSize: 14,
                        fontWeight: FontWeight.bold
                      ),
                    )
                  ],
                ),
              ),
              
            ],
          ),
          const SizedBox(height: 12,),

          if (present.features != null)
          Text(
            present.features!,
            style: TextStyle(
              color: LeezenColor.greyTextSubTitle.getTypeColor(),
              fontSize: 14,
            ),
          )
        ],
      ),
    );
  }
}
