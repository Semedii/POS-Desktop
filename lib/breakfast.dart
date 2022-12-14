import 'package:flutter/material.dart';
import 'package:flutter_pos_app/breakfast_data.dart';
import 'package:flutter_pos_app/item.dart';

class Breakfast extends StatelessWidget {
  Breakfast({super.key});
  List<Item> myList = BreakfastData.BreakfastList;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.count(
        crossAxisCount: 4,
        childAspectRatio: (1 / 1.2),
        children: [
          ...myList.map((e) => e).toList()
        ],
      ),
    );
  }
}