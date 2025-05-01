import 'package:flutter/material.dart';
import 'package:toku/components/item_info.dart';
import 'package:toku/models/item_model.dart';

class ItemList extends StatelessWidget {
  const ItemList({Key? key, required this.item, required this.color})
      : super(key: key);
  final ItemModel item;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      height: 100,
      child: Row(
        children: [
          Container(color:const Color(0xffFFF6DC), child: Image.asset(item.image!)),
          Expanded(
              child: ItemInfo(
            item: item,
          )),
        ],
      ),
    );
  }
}
