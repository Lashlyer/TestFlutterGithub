


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping_list/data/categories.dart';
import 'package:shopping_list/models/home/leezenShortcuts.dart';
import 'package:shopping_list/models/orderhistory/orderrecorddetail/note.dart';
import 'package:shopping_list/models/orderhistory/orderrecorddetail/orderrecorddetailitem.dart';

class OrderrecordSuborderDetailItem extends StatefulWidget {

  final OrderRecordDetailItem item;

  const OrderrecordSuborderDetailItem({super.key, required this.item});

  @override
  State<OrderrecordSuborderDetailItem> createState() => _OrderrecordSuborderDetailItemState();
}

class _OrderrecordSuborderDetailItemState extends State<OrderrecordSuborderDetailItem> {

  bool isOpen = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              Image.network(
                widget.item.image.withLeeznUrl(),
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.item.name,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      widget.item.standard,
                      style: TextStyle(
                          color: LeezenColor.greyTextSubTitle.getTypeColor(),
                          fontSize: 14),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Row(
                      children: [
                        Text(
                          '\$${widget.item.salePrice}',
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        Text(
                          'x${widget.item.quantity}',
                          style: TextStyle(
                              color: LeezenColor.greyTextSubTitle.getTypeColor(),
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
        
                        const Expanded(child: SizedBox()),
        
                        if (widget.item.subtotalOrigin != widget.item.subtotal)... [
                          Text(
                            '\$${widget.item.subtotalOrigin}',
                            style: TextStyle(
                              color: LeezenColor.greyTextSubTitle.getTypeColor(),
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.lineThrough,
                              decorationColor: LeezenColor.greyTextSubTitle.getTypeColor()
                            ),
                          ),
                          const SizedBox(width: 8)
                        ],
                         
                        Text(
                          '\$${widget.item.subtotal}',
                          style: TextStyle(
                              color: LeezenColor.accent001.getTypeColor(),
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    
                  ],
                ),
              )
            ],
          )
        ),
        if (widget.item.offer!.promotion != null)
        Container(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
          color: LeezenColor.bg002.getTypeColor(),
          child: Row(
            children: [
              Text(
                widget.item.offer!.type == 0 ? '優惠活動' : '優惠券',
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 13
                ),
              ),
              const SizedBox(width: 12,),

              Text(
                widget.item.offer!.type == 0 ? widget.item.offer!.promotion!.name : '優惠',
                style: TextStyle(
                  color: LeezenColor.primary002.getTypeColor(),
                  decoration: TextDecoration.underline,
                  decorationColor: LeezenColor.primary002.getTypeColor(),
                  fontSize: 13
                ),
              ),
              const Expanded(child: SizedBox()),
              IconButton(
                onPressed: () {
                  setState(() {
                    isOpen = !isOpen;
                  });
                }, 
                icon: Icon(
                  !isOpen ? Icons.keyboard_arrow_down : Icons.keyboard_arrow_up, 
                  color: LeezenColor.greyTextSubTitle.getTypeColor(),
                  size: 24,)
              )
            ],
          ),
        ),
        if (isOpen) ... [
          for (var note in widget.item.offer!.notes)
          discountItemBuild(note)
        ],
        Divider(
          color: LeezenColor.grey003alpha50.getTypeColor(),
          height: 1,
        )
        
      ],
    );
  }

  Widget discountItemBuild(Note note) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: LeezenColor.primary002.getTypeColor(),
                width: 1
              ),
              borderRadius: BorderRadius.circular(4)
            ),
            padding: const EdgeInsets.all(4),
            child: Text(
              note.name,
              style: TextStyle(
                color: LeezenColor.primary002.getTypeColor(),
                fontSize: 11
              ),
            ),
          ),
          const SizedBox(height: 4,),
          Row(
            children: [
              Text(
                '\$${note.price}',
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 11
                ),
              ),
              const SizedBox(width: 12,),
              Text(
                'x${note.quantity}',
                style: TextStyle(
                  color: LeezenColor.greyTextSubTitle.getTypeColor(),
                  fontSize: 11
                ),
              ),
              const Expanded(child: SizedBox()),
              Text(
                '\$${note.subtotal}',
                style: TextStyle(
                  color: LeezenColor.primary002.getTypeColor(),
                  fontSize: 11
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}