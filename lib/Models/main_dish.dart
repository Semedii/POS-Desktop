import 'package:flutter/material.dart';
import 'package:flutter_pos_app/Data/breakfast_data.dart';
import 'package:flutter_pos_app/Models/item.dart';
import 'package:flutter_pos_app/Data/main_dish_data.dart';

class MainDish extends StatelessWidget {
  MainDish({super.key});
  List<Item> myList = MainDishData.MainDishList;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.count(
        crossAxisCount: 4,
        childAspectRatio: (1 / 1.2),
        children: [...myList.map((e) => e).toList()],
      ),
    );
  }
}
